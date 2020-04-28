
package com.rice.C001.boardcontroller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;
import org.springframework.http.HttpHeaders;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.rice.A001.memvo.A001MemVO;
import com.rice.C001.boarddto.Criteria;
import com.rice.C001.boarddto.PageDTO;
import com.rice.C001.boardservice.C001DocService;
import com.rice.C001.boardvo.C001BoardVO;
import com.rice.C001.boardvo.C001ClassBoardVO;
import com.rice.C001.boardvo.C001FileUploadVO;

import net.coobird.thumbnailator.Thumbnailator;

@Controller
@RequestMapping("/mypage/board/*")
public class C001DocContoller {
	private static final Logger logger = LoggerFactory.getLogger(C001DocContoller.class);

	@Autowired
	private C001DocService c001DocService;

	@RequestMapping(value = "/{boCode}/{boURL}", method = RequestMethod.GET)
	public String list(Model model, Criteria cri, HttpServletRequest request, HttpServletResponse response,
			@PathVariable("boURL") String boURL, @PathVariable("boCode") String boCode) {
		cri.setBoURL(boURL);
		cri.setBoCode(boCode);
		List<C001ClassBoardVO> DocBoard = c001DocService.getList(cri);
		model.addAttribute("sjctName", c001DocService.getsbjc(boURL));
		model.addAttribute("listB", DocBoard);
		model.addAttribute("pageMaker", new PageDTO(cri, c001DocService.getTotal(cri)));
		
		String result_view = null;
		HttpSession session = request.getSession(false);
		A001MemVO vo = (A001MemVO) session.getAttribute("loginMem");
		
		if (vo == null) {
			return "redirect:/";
		} else if (vo.getAuthId().equals("1001")) { // 학생
			if (boCode.equals("2000")) {
				result_view = "C_stdNoticeList";
			} else if (boCode.equals("2001")) {
				result_view = "C_stdDocList";
			} else if (boCode.equals("2002")) {
				result_view = "C_stdHwList";
			} else if (boCode.equals("2003")) {
				result_view = "C_stdQnaList";
			}else if(boCode.equals("2006")) {
				result_view ="C_stdTeamList";
			}
		} else if (vo.getAuthId().equals("1002")) { // 강사
			if (boCode.equals("2000")) { // 공지사항
				result_view = "C_tchNoticeList";
			} else if (boCode.equals("2001")) { // 자료게시판
				result_view = "C_tchDocList";
			} else if (boCode.equals("2002")) { // 과제게시판
				result_view = "C_tchHwList";
			} else if (boCode.equals("2003")) { // qna게시판
				result_view = "C_tchQnaList";
			} else if(boCode.equals("2004")) {	//
				List<A001MemVO> stdlist = c001DocService.getStdList(cri);
				System.out.println(stdlist);
				model.addAttribute("list", stdlist);
				result_view ="C_tchStdList";
			} else if(boCode.equals("2005")) {
				result_view ="C_tchGrdList";
			} else if(boCode.equals("2006")) {
				result_view ="C_tchTeamList";
			}
		}

		return result_view;
	}

	@RequestMapping(value = "/get/{boCode}/{boURL}", method = RequestMethod.GET)
	public String get(@RequestParam("boNum") String boNum, Model model, Criteria cri, HttpServletRequest request, HttpServletResponse response,
			@PathVariable("boURL") String boURL, @PathVariable("boCode") String boCode) {
		String result_view = null;
		HttpSession session = request.getSession(false);
		A001MemVO vo = (A001MemVO) session.getAttribute("loginMem");
		c001DocService.updateViewCnt(boNum, boURL, boCode);
		model.addAttribute("sjctName", c001DocService.getsbjc(boURL));
		model.addAttribute("list", c001DocService.read(boNum, boURL, boCode));
		model.addAttribute("memId", vo.getMemId());
		if (vo == null) {
			return "redirect:/";
		} else if (vo.getAuthId().equals("1001")) { // 학생
			if (boCode.equals("2000")) {
				result_view = "C_stdNoticeGet";
			} else if (boCode.equals("2001")) {
				result_view = "C_stdDocGet";
			} else if (boCode.equals("2002")) {
				result_view = "C_stdHwGet";
			} else if (boCode.equals("2003")) {
				if(vo.getMemNum().equals(c001DocService.read(boNum, boURL, boCode).getMemNum())) {
					result_view = "C_stdQnaGet";
				}
				else {
					result_view="C_stdQna";
				}
			} else if(boCode.equals("2006")) {
				result_view = "C_stdTeamGet";
			}
		} else if (vo.getAuthId().equals("1002")) { // 강사
			if (boCode.equals("2000")) { // 공지사항
				result_view = "C_tchNoticeGet";
			} else if (boCode.equals("2001")) { // 자료게시판
				result_view = "C_tchDocGet";
			} else if (boCode.equals("2002")) { // 과제게시판
				result_view = "C_tchHwGet";
			} else if (boCode.equals("2003")) { // qna게시판
				result_view = "C_tchQnaGet";
			} else if(boCode.equals("2005")) {
				result_view ="C_tchGrdGet";
			} else if(boCode.equals("2006")) {
				result_view ="C_tchTeamGet";
			}
		}

		return result_view;
	}

	@RequestMapping(value = "/regForm/{boCode}/{boURL}", method = RequestMethod.GET)
	public String regForm(C001ClassBoardVO boardvo, Model model, @PathVariable("boURL") String boURL,HttpServletRequest request,
			@PathVariable("boCode") String boCode) {
		HttpSession session = request.getSession(false);
		A001MemVO vo = (A001MemVO) session.getAttribute("loginMem");
		model.addAttribute("memName", vo.getMemName());
		model.addAttribute("memNum", vo.getMemNum());
		model.addAttribute("memId",vo.getMemId());
		model.addAttribute("boURL", boURL);
		model.addAttribute("boCode", boCode);
		model.addAttribute("sjctName", c001DocService.getsbjc(boURL));
		String pageTitle = null;
		if (boCode.equals("2000")) { // 공지사항
			pageTitle = "공지사항 게시판";
		} else if (boCode.equals("2001")) { // 자료게시판
			pageTitle = "자료 게시판";
		} else if (boCode.equals("2002")) { // 과제게시판
			pageTitle = "과제 게시판";
		} else if(boCode.equals("2005")) {
			pageTitle ="성적 게시판";
		} else if(boCode.equals("2006")) {
			pageTitle ="스터디 게시판";
		} else if(boCode.equals("2003")) {
			pageTitle ="Q&A 게시판";
		}
		model.addAttribute("pageTitle", pageTitle);
		return "C_tchDocReg";
	}

	@RequestMapping(value = "/reg/{boCode}/{boURL}", method = RequestMethod.GET)
	public String reg(C001ClassBoardVO boardvo, HttpServletRequest request, HttpServletResponse response,
			@PathVariable("boURL") String boURL, @PathVariable("boCode") String boCode, Criteria cri, C001FileUploadVO uploadvo) {
		cri.setBoURL(boURL);
		cri.setBoCode(boCode);

		if(boardvo.getFilelist() != null) {
			boardvo.getFilelist().forEach(attach->System.out.println("출력 "+attach.getFileName()));
		}
		c001DocService.register(boardvo);
		String nextPage = "redirect:/mypage/board/" + boCode + "/" + boURL;

		return nextPage;
	}

	@RequestMapping(value = "/mdfyForm/{boCode}/{boURL}", method = RequestMethod.GET)
	public String update( Model model, @PathVariable("boURL") String boURL,@RequestParam("boNum") String boNum,
			@PathVariable("boCode") String boCode, HttpServletRequest request,C001ClassBoardVO boardvo) {
		model.addAttribute("sjctName", c001DocService.getsbjc(boURL));
		System.out.println("mdfyForm  "+boardvo.getBoNum());
		System.out.println("mdfyForm  "+boNum);
		model.addAttribute("list", c001DocService.read(boNum, boURL, boCode));
		String pageTitle = null;
		if (boCode.equals("2000")) { // 공지사항
			pageTitle = "공지사항 게시판";
		} else if (boCode.equals("2001")) { // 자료게시판
			pageTitle = "자료 게시판";
		} else if (boCode.equals("2002")) { // 과제게시판
			pageTitle = "과제 게시판";
		} else if(boCode.equals("2005")) {
			pageTitle ="성적 게시판";
		} else if(boCode.equals("2006")) {
			pageTitle ="스터디 게시판";
		} else if(boCode.equals("2003")) {
			pageTitle ="Q&A 게시판";
		}
		model.addAttribute("pageTitle", pageTitle);

		return "C_tchDocMdfy";
	}

	@RequestMapping(value = "/mdfy/{boCode}/{boURL}", method = RequestMethod.GET)
	public String updateBoard(C001ClassBoardVO boardvo, @PathVariable("boURL") String boURL, Model model,@RequestParam("boNum") String boNum,
			@PathVariable("boCode") String boCode) {
		System.out.println("mdfy 첫번째 줄 : "+boardvo.getBoNum());
		System.out.println("mdfy 두번째 줄 : "+boNum);
		model.addAttribute("sjctName", c001DocService.getsbjc(boURL));
		c001DocService.update(boardvo);

		String nextPage = "redirect:/mypage/board/" + boCode + "/" + boURL;

		return nextPage;
	}

	@RequestMapping(value = "/dlt/{boCode}/{boURL}", method = RequestMethod.GET)
	public String remove(@RequestParam("boNum") String boNum, @PathVariable("boURL") String boURL,
			@PathVariable("boCode") String boCode) {

		c001DocService.delete(boNum, boURL, boCode);

		String nextPage = "redirect:/mypage/board/" + boCode + "/" + boURL;

		return nextPage;
	}
	
	@PostMapping(value = "/uploadAction", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<C001FileUploadVO>> uploadPost(MultipartFile[] uploadFile) {
		
		List<C001FileUploadVO> list = new ArrayList<>();
		
		String uploadFolder ="C:\\upload";
		String uploadFolderPath= getFolder();
		//날짜별 폴더 만들기
		File uploadPath = new File(uploadFolder, uploadFolderPath);
		if(uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		//폴더에 파일저장
		for(MultipartFile multipartFile : uploadFile) {

			C001FileUploadVO attachVO = new C001FileUploadVO();
			attachVO.setFileSize(String.valueOf(multipartFile.getSize()));

			String uploadFileName = multipartFile.getOriginalFilename();
			
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\")+1);
			attachVO.setFileName(uploadFileName);
			
			UUID uuid = UUID.randomUUID();
			 uploadFileName = uuid.toString()+"_"+ uploadFileName;
			 attachVO.setSaveFileName(uploadFileName);
			try {
				File saveFile = new File(uploadPath, uploadFileName);
				multipartFile.transferTo(saveFile);
				attachVO.setClassFileNum(uuid.toString());
				attachVO.setFilePath(uploadFolderPath);
				
				if(checkImageType(saveFile)) {
					
					attachVO.setFileCode("Image");
					
					//파일코드가 이미지일경우 썸네일 생성
					FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_"+uploadFileName));
					Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 100, 100);
					thumbnail.close();
				}
				list.add(attachVO);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return new ResponseEntity<>(list,HttpStatus.OK);
	}
	
	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		return str.replace("-", File.separator);
		
	}
	private boolean checkImageType(File file) {
		try {
			String contentType = Files.probeContentType(file.toPath());
			
			return contentType.startsWith("image");
			
		}catch(IOException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	@GetMapping("/display")
	@ResponseBody
	public ResponseEntity<byte[]> getFile(String fileName){
		File file = new File("C:\\upload"+fileName);
		
		ResponseEntity<byte[]> result = null;
		
		try {
			HttpHeaders header = new HttpHeaders();
			
			header.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
		} catch(IOException e) {
			e.printStackTrace();
		}
		return result;
	}

	@GetMapping(value = "/download", produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
	@ResponseBody
	public ResponseEntity<Resource> downloadFile(@RequestHeader("User-Agent") String userAgent, C001FileUploadVO vo){
		
		
		//디비에서 경로 가져오기 해야됨
		Resource resource = new FileSystemResource("C:\\upload\\"+vo.getFileName());
		
		if(resource.exists() ==false) {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		String resourceName = resource.getFilename();
		
		String resuourceOriginalName = resourceName.substring(resourceName.indexOf("_")+1);
		HttpHeaders headers = new HttpHeaders();
		//디비에서 파일이름을 가져와야함
		try {
			String downloadName = null;
			if(userAgent.contains("Trident")) {
				System.out.println("IE browser");
				downloadName = URLEncoder.encode(resuourceOriginalName,"UTF-8").replaceAll("\\+"," ");
				System.out.println("Edge Name: "+ downloadName);
			}else if(userAgent.contains("Edge")) {
				downloadName = URLEncoder.encode(resuourceOriginalName,"UTF-8");
			}
			else {
				downloadName = new String(resuourceOriginalName.getBytes("UTF-8"),"ISO-8859-1"); 
			}
			headers.add("Content-Disposition", "attachment; filename=" +downloadName);
		}catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return new ResponseEntity<Resource>(resource, headers, HttpStatus.OK);
	}
	
	@PostMapping("/deleteFile")
	@ResponseBody
	public ResponseEntity<String> deleteFile(String fileName, String type){
		System.out.println("delete file: "+ fileName);
		
		File file;
		
		try {
			file = new File("C:\\upload\\"+URLDecoder.decode(fileName,"UTF-8"));
			file.delete();
			if(type.equals("image")) {
				String largeFileName = file.getAbsolutePath().replace("s_", "");
				System.out.println("large FileName: "+largeFileName);
				file= new File(largeFileName);
				file.delete();
			}
		}catch(UnsupportedEncodingException e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}
	
	@GetMapping(value="/getAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<C001FileUploadVO>> getAttachList(String boNum){
		return new ResponseEntity<>(c001DocService.getAttachList(boNum),HttpStatus.OK);
	}
	
	private void deleteFiles(List<C001FileUploadVO> vo) {
		if(vo == null || vo.size() == 0) {
			return;
		}
		vo.forEach(attach->{
			try {
				Path file = Paths.get("C:\\upload\\"+attach.getFilePath()+"\\s_"+attach.getClassFileNum()+"_"+attach.getFileName());
				
				Files.deleteIfExists(file);
				
				if(Files.probeContentType(file).startsWith("image")) {
					Path thumbNail = Paths.get("C:\\upload\\"+attach.getFilePath()+"\\s_"+attach.getClassFileNum()+"_"+attach.getFileName());
					
					Files.delete(thumbNail);
				}
			}catch(Exception e) {
				System.out.println("delete file error"+e.getMessage());
			}
		});
	}
	
	@PostMapping("/remove/{boCode}/{boURL}")
	public String fileremove(@RequestParam("boNum") String boNum, Criteria cri, RedirectAttributes rttr,
			@PathVariable("boURL") String boURL, @PathVariable("boCode") String boCode) {
		System.out.println("remove..."+ boNum);
		List<C001FileUploadVO> attachList = c001DocService.getAttachList(boNum);
		
		if(c001DocService.delete(boNum, boURL, boCode)) {
			deleteFiles(attachList);
			rttr.addFlashAttribute("result","success");
		}
		return "redirect:/mypage/board" + cri.getListLink();
	}
}

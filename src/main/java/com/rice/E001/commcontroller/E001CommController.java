package com.rice.E001.commcontroller;

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
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.util.StringUtils;
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
import com.rice.E001.commservice.E001CommBoardService;
import com.rice.E001.commservice.E001CommService;
import com.rice.E001.commvo.E001CommBoardVO;
import com.rice.E001.commvo.E001CommVO;
import com.rice.E001.commvo.E001FileUploadVO;

import net.coobird.thumbnailator.Thumbnailator;

@Controller
@RequestMapping("/comm/*")
public class E001CommController {

	@Autowired
	public E001CommBoardService e001CommBoardService;
	@Autowired
	public E001CommService e001CommService;
	
	//커뮤니티 메인
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String commMain(Model model, Criteria cri, HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession(false);
		A001MemVO vo = (A001MemVO) session.getAttribute("loginMem");
		//model.addAttribute("joinComm", e001CommBoardService.getComm(vo.getMemNum()));
		model.addAttribute("pageMaker", new PageDTO(cri, e001CommBoardService.getTotal(cri)));
		return "E_CommMain";

	}
	
	//커뮤니티 글조회
	@RequestMapping(value = "/{commURL}", method = RequestMethod.GET)
	public String list(Model model, Criteria cri, HttpServletRequest request, HttpServletResponse response,
			@PathVariable("commURL") String commURL) {
		HttpSession session = request.getSession(false);
		A001MemVO vo = (A001MemVO) session.getAttribute("loginMem");
		cri.setCommURL(commURL);
		List<E001CommBoardVO> commboardlist = e001CommBoardService.getList(cri);
		model.addAttribute("commboardlist", commboardlist);
		model.addAttribute("pageMaker", new PageDTO(cri, e001CommBoardService.getTotal(cri)));
		model.addAttribute("commName", e001CommBoardService.getCommName(commURL));
		String resultpage ="";
		if(e001CommBoardService.checkMem(commURL, vo.getMemNum())==1) {
			resultpage+="E_CommBoard_no";
		}else {
			resultpage+="E_CommBoard";
		}
		return resultpage;

	}
	
	//좋아요
	@RequestMapping(value="/like", method=RequestMethod.POST)
	public ResponseEntity<String> like(HttpServletRequest request, @RequestBody String boNum) {
		HttpSession session = request.getSession(false);
		A001MemVO vo = (A001MemVO) session.getAttribute("loginMem");
		e001CommBoardService.like(vo.getMemNum(), boNum);
		e001CommBoardService.updateLikeCnt(vo.getMemNum(), boNum);
		return new ResponseEntity<String>("liked", HttpStatus.OK);
	}
	//좋아요 삭제
	@RequestMapping(value="/delLike", method=RequestMethod.POST)
	public ResponseEntity<String> delLike(HttpServletRequest request, @RequestBody String boNum) {
		HttpSession session = request.getSession(false);
		A001MemVO vo = (A001MemVO) session.getAttribute("loginMem");
		e001CommBoardService.delLike(vo.getMemNum(), boNum);
		e001CommBoardService.updatedisLikeCnt(vo.getMemNum(), boNum);
		return new ResponseEntity<String>("delLiked", HttpStatus.OK);
	}
	
	//커뮤니티 글 하나씩 보기  
	@RequestMapping(value = "/viewwritings/{commURL}", method = RequestMethod.GET)
	public String get(@RequestParam("boNum") String boNum, Model model,  HttpServletRequest request, HttpServletResponse response
			,@PathVariable("commURL") String commURL) {
		HttpSession session = request.getSession(false);
		A001MemVO vo = (A001MemVO) session.getAttribute("loginMem");
		e001CommBoardService.updateViewCnt(boNum, commURL); 
		model.addAttribute("comm", e001CommBoardService.read(boNum,commURL));
		model.addAttribute("memId", vo.getMemId());
		model.addAttribute("commName", e001CommBoardService.getCommName(commURL));
		return "E_CommBoardGet";
		}
	
	@RequestMapping(value = "/mdfyForm/{commURL}", method = RequestMethod.GET)
	public String update( Model model, @PathVariable("commURL") String commURL, @RequestParam("boNum") String boNum,
			HttpServletRequest request,E001CommBoardVO boardvo) {
		model.addAttribute("commName", e001CommBoardService.getCommName(commURL));
		model.addAttribute("comm", e001CommBoardService.read(boNum,commURL));
		return "E_CommBoardMdfy";
	}
	
	
	
	  //커뮤니티 글 수정
	  
	  @RequestMapping(value = "/viewupdate/{commURL}", method = RequestMethod.GET)
	  public String updateBoard(E001CommBoardVO boardvo, HttpServletRequest
	  request, HttpServletResponse response) {
	  
	  e001CommBoardService.update(boardvo);
	  
	  return "redirect:/comm/writingslist/{commURL}"; }
	 
	
	//커뮤니티 글 삭제
	@RequestMapping(value = "/listdelete/{commURL}", method = RequestMethod.GET)
	public String remove(@RequestParam("boNum") String boNum, RedirectAttributes rttr,@PathVariable("commURL") String commURL) {

		if (e001CommBoardService.delete(boNum, commURL)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/comm/{commURL}";
	}
	
	//커뮤니티자체를 만드는거 
	@RequestMapping(value = "/makecomm", method = RequestMethod.GET)
	public String makecomm(HttpServletRequest request, Model model, E001CommVO e001commvo) {
		HttpSession session = request.getSession(false);
		A001MemVO vo = (A001MemVO) session.getAttribute("loginMem");
		model.addAttribute("memId", vo.getMemId());
		model.addAttribute("memLevel", vo.getMemLevel());
		return "E_CommCrt";
	}
	
	//like 중복확인
		@RequestMapping(value = "/likeCheck", method = RequestMethod.POST)
		@ResponseBody
		public String likeCheck(@RequestBody String boNum, HttpServletRequest request, HttpServletResponse response) throws Exception {
			String likeCheck = "1";
			HttpSession session = request.getSession(false);
			A001MemVO vo = (A001MemVO) session.getAttribute("loginMem");
			likeCheck = Integer.toString(e001CommBoardService.likeCheck(boNum, vo.getMemNum()));
			return likeCheck;
		}
	
	//url 중복확인
	@RequestMapping(value = "/urlCheck", method = RequestMethod.POST)
	@ResponseBody
	public String urlCheck(@RequestBody String commURL, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String urlCheck = "1";
		urlCheck = Integer.toString(e001CommService.urlCheck(commURL));

		return urlCheck;
	}
	//커뮤니티 명 중복확인
	@RequestMapping(value = "/nameCheck", method = RequestMethod.POST)
	@ResponseBody
	public String nameCheck(@RequestBody String commName, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String nameCheck = "1";
		nameCheck = Integer.toString(e001CommService.nameCheck(commName));

		return nameCheck;
	}
	
	//커뮤니티 자체를 만드는 곳
	@RequestMapping(value = "/commRegister", method = RequestMethod.POST)
	public String commRegister(HttpServletRequest request, Model model, E001CommVO e001commvo) {
		
		e001CommService.commReg(e001commvo);
		
		return "E_CommMain";
	}
	
	//커뮤니티에서 글쓰기
	@RequestMapping(value = "/regForm/{commURL}", method = RequestMethod.GET)
	public String regForm(E001CommBoardVO boardvo, Model model, @PathVariable("commURL") String commURL,HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		A001MemVO vo = (A001MemVO) session.getAttribute("loginMem");
		model.addAttribute("memName", vo.getMemName());
		model.addAttribute("memNum", vo.getMemNum());
		model.addAttribute("memId",vo.getMemId());
		model.addAttribute("commURL", commURL);
		model.addAttribute("commName", e001CommBoardService.getCommName(commURL));
		return "E_commBoardReg";
	}
	
	@RequestMapping(value = "/reg/{commURL}", method = RequestMethod.GET)
	public String reg(E001CommBoardVO boardvo, HttpServletRequest request, HttpServletResponse response,
			@PathVariable("commURL") String commURL, Criteria cri, E001FileUploadVO uploadvo) {
		cri.setCommURL(commURL);
		if(boardvo.getFilelist() != null) {
			boardvo.getFilelist().forEach(attach->System.out.println("출력 "+attach.getFileName()));
		}
		e001CommBoardService.register(boardvo);
		String nextPage = "redirect:/comm/" + commURL;

		return nextPage;
	}
	
	
	//파일업로드
	
	@PostMapping(value = "/uploadAction", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<E001FileUploadVO>> uploadPost(MultipartFile[] uploadFile) {
		
		List<E001FileUploadVO> list = new ArrayList<>();
		
		String uploadFolder ="C:\\commupload";
		String uploadFolderPath= getFolder();
		//날짜별 폴더 만들기
		File uploadPath = new File(uploadFolder, uploadFolderPath);
		if(uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		//폴더에 파일저장
		for(MultipartFile multipartFile : uploadFile) {

			E001FileUploadVO attachVO = new E001FileUploadVO();
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
		File file = new File("C:\\commupload"+fileName);
		
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
	public ResponseEntity<Resource> downloadFile(@RequestHeader("User-Agent") String userAgent, E001FileUploadVO vo){
		

		Resource resource = new FileSystemResource("C:\\commupload\\"+vo.getFileName());
		
		if(resource.exists() ==false) {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		String resourceName = resource.getFilename();
		
		String resuourceOriginalName = resourceName.substring(resourceName.indexOf("_")+1);
		HttpHeaders headers = new HttpHeaders();
		
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
			file = new File("C:\\commupload\\"+URLDecoder.decode(fileName,"UTF-8"));
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
	public ResponseEntity<List<E001FileUploadVO>> getAttachList(String boNum){
		return new ResponseEntity<>(e001CommBoardService.getAttachList(boNum),HttpStatus.OK);
	}
	
	private void deleteFiles(List<E001FileUploadVO> vo) {
		if(vo == null || vo.size() == 0) {
			return;
		}
		vo.forEach(attach->{
			try {
				Path file = Paths.get("C:\\commupload\\"+attach.getFilePath()+"\\s_"+attach.getClassFileNum()+"_"+attach.getFileName());
				
				Files.deleteIfExists(file);
				
				if(Files.probeContentType(file).startsWith("image")) {
					Path thumbNail = Paths.get("C:\\commupload\\"+attach.getFilePath()+"\\s_"+attach.getClassFileNum()+"_"+attach.getFileName());
					
					Files.delete(thumbNail);
				}
			}catch(Exception e) {
				System.out.println("delete file error"+e.getMessage());
			}
		});
	}
	
	@PostMapping("/remove/{commURL}")
	public String fileremove(@RequestParam("boNum") String boNum, Criteria cri, RedirectAttributes rttr,
			@PathVariable("commURL") String commURL) {
		System.out.println("remove..."+ boNum);
		List<E001FileUploadVO> attachList = e001CommBoardService.getAttachList(boNum);
		
		if(e001CommBoardService.delete(boNum, commURL)) {
			deleteFiles(attachList);
			rttr.addFlashAttribute("result","success");
		}
		return "redirect:/comm/" + cri.getListLink();
	}
	

	@RequestMapping(value = "/searchcomm", method = RequestMethod.GET)
	public String searchComm(Model model, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		List<E001CommBoardVO> commboardlist = e001CommBoardService.getSearchList(cri);
		model.addAttribute("commboardlist", commboardlist);
		model.addAttribute("pageMaker", new PageDTO(cri, e001CommBoardService.getTotal(cri)));
		return "E_CommSearch";

	}
}




package com.rice.C001.boardcontroller;

import java.io.File;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.rice.C001.boarddto.Criteria;
import com.rice.C001.boarddto.PageDTO;
import com.rice.C001.boardservice.C001QnAService;
import com.rice.C001.qnavo.C001QnAVO;
import com.rice.C001.qnavo.classattachedFileVO;


@Controller
@RequestMapping("/mypage/board/*")
public class C001QnAController {

	@Autowired
	private C001QnAService c001QnAService;

	
	@RequestMapping(value="/qna/list",method = RequestMethod.GET)
	public String listAll(Model model,Criteria cri,HttpServletRequest request,HttpServletResponse response)throws Exception{
		
		List<C001QnAVO> list = c001QnAService.listAll(cri);
		
		model.addAttribute("boardList",list);
		model.addAttribute("pageMaker",new PageDTO(cri,c001QnAService.getTotal()));
		
		return "C_qnaList";
	}

	@RequestMapping(value="/qna/view",method = RequestMethod.GET)
	public String view(C001QnAVO vo ,Model model)throws Exception{
		
		model.addAttribute("read",c001QnAService.read(vo.getBoNum()));
		
		List<Map<String, Object>> fileList = c001QnAService.selectFilelList(vo.getBoNum());
		model.addAttribute("file",fileList);
		
		return "C_qnaView";
	}
	
	@RequestMapping(value="/qna/write",method = RequestMethod.POST)
	public String write(C001QnAVO vo, MultipartHttpServletRequest mpRequest)throws Exception{
		
		c001QnAService.insert(vo,mpRequest);
		
		return "redirect:list";
	}
	
	  @RequestMapping(value="/qna/writeView",method=RequestMethod.GET)
	  public String writeView(C001QnAVO vo,Model model) {
		  
		  return"C_qnaWrite"; 
	 }
	 
	
	//modifyView
	@RequestMapping(value="/qna/modifyView",method=RequestMethod.POST)
	public String modifyView(C001QnAVO vo,Model model,@ModelAttribute("boNum")String boNum)throws Exception{
		
		model.addAttribute("update",c001QnAService.read(vo.getBoNum()));
		
		List<Map<String, Object>> fileList = c001QnAService.selectFilelList(vo.getBoNum());
		model.addAttribute("file",fileList);
		System.out.println("filelist:"+fileList);
		
		return "C_qnaModify";
	}
	
	//modify
	@RequestMapping(value="/qna/modify",method=RequestMethod.POST)
	public String modify(C001QnAVO vo,RedirectAttributes rttr,
						@ModelAttribute("cri")Criteria cri,
						@RequestParam(value="fileNoDel[]",required=false)String[] files,
						@RequestParam(value="fileNameDel[]",required=false)String[] fileNames,
						MultipartHttpServletRequest mpRequest)throws Exception{
		
		System.out.println("files:"+files);
		System.out.println("filNames:"+fileNames);
		c001QnAService.modify(vo,files, fileNames, mpRequest);
		/* c001QnAService.insert(vo,mpRequest); */
		
		rttr.addAttribute("page",cri.getPage());
		rttr.addAttribute("amount",cri.getAmount());
		rttr.addAttribute("type",cri.getType());
		rttr.addAttribute("keyword",cri.getKeyword());
		
		return "redirect:list";
		
	}
	
	@RequestMapping(value="/qna/delete",method = RequestMethod.POST)
	public String delete(C001QnAVO vo,Criteria cri,RedirectAttributes rttr)throws Exception{
		
		c001QnAService.delete(vo.getBoNum());
		
		rttr.addAttribute("page",cri.getPage());
		rttr.addAttribute("amount",cri.getAmount());
		rttr.addAttribute("type",cri.getType());
		rttr.addAttribute("keyword",cri.getKeyword());
		
		return"redirect:list";
	}
	
	
	@RequestMapping(value="/fileDown")
	public void fileDown(@RequestParam Map<String, Object>map, HttpServletResponse response)throws Exception {
		Map<String, Object> resultMap = c001QnAService.selectFileInfo(map);
		System.out.println( (String)resultMap.get("SAVEFILENAME"));
		String storedFileName = (String)resultMap.get("SAVEFILENAME");
		String originalFileName = (String)resultMap.get("FILENAME");
		
		byte fileByte[] = org.apache.commons.io.FileUtils.readFileToByteArray(new File("C:\\download\\test\\"+storedFileName));
		response.setContentType("application/octet-stream");
		response.setContentLength(fileByte.length);
		response.setHeader("Content-Disposition", "attachment; fileName=\""+URLEncoder.encode(originalFileName,"UTF-8")+"\";");
		response.getOutputStream().write(fileByte);
		response.getOutputStream().flush();
		response.getOutputStream().close();
	}
	
}

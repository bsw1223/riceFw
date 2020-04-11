package com.rice.C001.boardcontroller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.rice.C001.boarddto.Criteria;
import com.rice.C001.boarddto.PageDTO;
import com.rice.C001.boardservice.C001QnAService;
import com.rice.C001.qnavo.C001QnAVO;


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
	public String view(C001QnAVO vo,Model model)throws Exception{
		
		model.addAttribute("read",c001QnAService.read(vo.getBoNum()));
		
		return "C_qnaView";
	}
	
	@RequestMapping(value="/qna/write",method = RequestMethod.POST)
	public String write(C001QnAVO vo, RedirectAttributes rttr)throws Exception{
		
		c001QnAService.insert(vo);
		
		return "redirect:list";
	}
	
	  @RequestMapping(value="/qna/writeView",method=RequestMethod.GET)
	  public String writeView(C001QnAVO vo,Model model) {
	  
		  return"C_qnaWrite"; 
	 }
	 
	
	//modifyView
	@RequestMapping(value="/qna/modifyView",method=RequestMethod.POST)
	public String modifyView(C001QnAVO vo,Model model)throws Exception{
		
		model.addAttribute("update",c001QnAService.read(vo.getBoNum()));
		
		return "C_qnaModify";
	}
	
	//modify
	@RequestMapping(value="/qna/modify",method=RequestMethod.POST)
	public String modify(C001QnAVO vo)throws Exception{
		
		c001QnAService.modify(vo);
		
		return "redirect:list";
		
	}
	
	@RequestMapping(value="/qna/delete",method = RequestMethod.POST)
	public String delete(C001QnAVO vo)throws Exception{
		
		c001QnAService.delete(vo.getBoNum());
		
		return"redirect:list";
	}
	
}

package com.rice.C001.boardcontroller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.rice.C001.boarddto.Criteria;
import com.rice.C001.boarddto.PageDTO;
import com.rice.C001.boardservice.C001QnAService;
import com.rice.C001.qnavo.C001QnAVO;


@Controller
@RequestMapping("/mypage/board/*")
public class C001NoticeController {

	@Autowired
	private C001QnAService c001QnAService;

	
	@RequestMapping(value="/notice/list",method = RequestMethod.GET)
	public String listAll(Model model,Criteria cri,HttpServletRequest request,HttpServletResponse response)throws Exception{
		
		List<C001QnAVO> list = c001QnAService.listAll(cri);
		
		model.addAttribute("noticeList",list);
		model.addAttribute("pageMaker",new PageDTO(cri,c001QnAService.getTotal()));
		
		return "C_BnoticeList";
	}

	@RequestMapping(value="/notice/view",method = RequestMethod.GET)
	public String view(C001QnAVO vo,Model model)throws Exception{
		
		model.addAttribute("read",c001QnAService.read(vo.getBoNum()));
		
		return "C_BnoticeView";
	}
	
	@RequestMapping(value="/notice/write",method = RequestMethod.POST)
	public String write(C001QnAVO vo, RedirectAttributes rttr)throws Exception{
		
		c001QnAService.insert(vo, null);
		
		return "redirect:list";
	}
	
	  @RequestMapping(value="/notice/writeView",method=RequestMethod.GET)
	  public String writeView(C001QnAVO vo,Model model) {
	  
		  return"C_qnaWrite"; 
	 }
	 
	
	//modifyView
	@RequestMapping(value="/notice/modifyView",method=RequestMethod.POST)
	public String modifyView(C001QnAVO vo,Model model)throws Exception{
		
		model.addAttribute("update",c001QnAService.read(vo.getBoNum()));
		
		return "C_BnoticeModify";
	}
	
	//modify
	@RequestMapping(value="/notice/modify",method=RequestMethod.POST)
	public String modify(C001QnAVO vo,RedirectAttributes rttr,@ModelAttribute("cri")Criteria cri)throws Exception{
		
				
		
		rttr.addAttribute("page",cri.getPage());
		rttr.addAttribute("amount",cri.getAmount());
		rttr.addAttribute("type",cri.getType());
		rttr.addAttribute("keyword",cri.getKeyword());
		
		return "redirect:list";
		
	}
	
	@RequestMapping(value="/notice/delete",method = RequestMethod.POST)
	public String delete(C001QnAVO vo,Criteria cri,RedirectAttributes rttr)throws Exception{
		
		c001QnAService.delete(vo.getBoNum());
		
		rttr.addAttribute("page",cri.getPage());
		rttr.addAttribute("amount",cri.getAmount());
		rttr.addAttribute("type",cri.getType());
		rttr.addAttribute("keyword",cri.getKeyword());
		
		return"redirect:list";
	}
	
}

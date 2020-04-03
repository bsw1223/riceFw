package com.rice.C001.boardcontroller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.rice.C001.boarddto.Criteria;
import com.rice.C001.boardservice.C001ReplyService;
import com.rice.C001.replyvo.C001ReplyVO;



@RequestMapping("/replies/*")
@RestController
public class C001ReplyController {
	
	@Autowired
	private C001ReplyService c001replyService;
	
	@Autowired
	C001ReplyController(C001ReplyService c001replyService){
		this.c001replyService=c001replyService;
	}
	
	@PostMapping(value="/new",
			consumes="application/json",
			produces= {MediaType.TEXT_PLAIN_VALUE})
	@ResponseBody
	public ResponseEntity<String> create(@RequestBody C001ReplyVO vo){
		int insertCount= c001replyService.register(vo);
		return insertCount == 1
				? new ResponseEntity<>("success",HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@GetMapping(value="/pages/{bno}/{page}/{amount}", 
			produces = {
					MediaType.APPLICATION_XML_VALUE,
					MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<C001ReplyVO>> getList(@PathVariable("page") int page, 
			@PathVariable("bno") Long bno, @PathVariable("amount") int amount){
		Criteria cri = new Criteria(page,amount);
		return new ResponseEntity<>(c001replyService.getList(cri, bno), HttpStatus.OK);
	}
	
	@GetMapping(value="/{bno}",
			produces= {MediaType.APPLICATION_XML_VALUE,
					MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<C001ReplyVO> get(@PathVariable("bno") Long bno){
		return new ResponseEntity<>(c001replyService.get(bno),HttpStatus.OK);
	}
	
	@DeleteMapping(value="/{rno}", 
			produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> remove(@PathVariable("rno") Long rno){
		return c001replyService.remove(rno) == 1
		? new ResponseEntity<>("success", HttpStatus.OK)
		: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@RequestMapping(method= {RequestMethod.PUT, RequestMethod.PATCH},
			value="/{rno}",
			consumes ="application/json",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> modify(@RequestBody C001ReplyVO vo,
			@PathVariable("rno") Long rno){
		vo.setRno(rno);
		return c001replyService.modify(vo)==1
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		
	}
}

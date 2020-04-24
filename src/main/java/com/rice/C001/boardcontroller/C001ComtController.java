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
import com.rice.C001.boardservice.C001ComtService;
import com.rice.C001.boardvo.C001CommentVO;


@RequestMapping("/comt/*")
@RestController
public class C001ComtController {

	@Autowired
	private C001ComtService c001comtService;

	@Autowired
	C001ComtController(C001ComtService c001comtService) {
		this.c001comtService = c001comtService;
	}

	@PostMapping(value = "/new", consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE })
	@ResponseBody
	public ResponseEntity<String> create(@RequestBody C001CommentVO vo) {
		int insertCount = c001comtService.register(vo);
		return insertCount == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	@GetMapping(value = "/pages/{boNum}/{page}/{amount}", produces = { MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<List<C001CommentVO>> getList(@PathVariable("page") int page, @PathVariable("boNum") String boNum,
			@PathVariable("amount") int amount) {
		Criteria cri = new Criteria(page, amount);
		return new ResponseEntity<>(c001comtService.getList(cri, boNum), HttpStatus.OK);
	}

	@GetMapping(value = "/{boNum}", produces = { MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<C001CommentVO> get(@PathVariable("boNum") String boNum) {
		return new ResponseEntity<>(c001comtService.get(boNum), HttpStatus.OK);
	}

	@DeleteMapping(value = "/{comtNum}", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> remove(@PathVariable("comtNum") String comtNum) {
		return c001comtService.remove(comtNum) == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	@RequestMapping(method = { RequestMethod.PUT, RequestMethod.PATCH },
			value = "/{comtNum}", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> modify(@RequestBody C001CommentVO vo, @PathVariable("comtNum") String comtNum) {
		vo.setComtNum(comtNum);
		return c001comtService.modify(vo) == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}

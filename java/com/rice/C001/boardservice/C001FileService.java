package com.rice.C001.boardservice;

import java.util.List;

import com.rice.C001.boarddto.Criteria;
import com.rice.C001.boardvo.C001CommentVO;
import com.rice.C001.boardvo.C001FileUploadVO;
import com.rice.C001.replyvo.C001ReplyVO;

public interface C001FileService {

	public void insert(C001FileUploadVO vo);
	
	public void delete(String saveFileName);
	
	public List<C001FileUploadVO> findByboNum(String boNum);
}

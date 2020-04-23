package com.rice.C001.boardservice;

import java.util.List;

import com.rice.C001.boarddto.Criteria;
import com.rice.C001.boardvo.C001CommentVO;
import com.rice.C001.replyvo.C001ReplyVO;

public interface C001ComtService {

	public int register(C001CommentVO vo);

	public C001CommentVO get(String boNum);

	public int modify(C001CommentVO vo);

	public int remove(String comtNum);

	public List<C001CommentVO> getList(Criteria cri, String boNum);
}

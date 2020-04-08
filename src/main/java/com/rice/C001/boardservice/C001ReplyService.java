package com.rice.C001.boardservice;

import java.util.List;

import com.rice.C001.boarddto.Criteria;
import com.rice.C001.replyvo.C001ReplyVO;

public interface C001ReplyService {

	public int register(C001ReplyVO vo);

	public C001ReplyVO get(Long bno);

	public int modify(C001ReplyVO vo);

	public int remove(Long rno);

	public List<C001ReplyVO> getList(Criteria cri, Long bno);
}

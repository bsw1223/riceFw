package com.rice.C001.boarddao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.rice.C001.boarddto.Criteria;
import com.rice.C001.replyvo.C001ReplyVO;

public interface C001ReplyDAO {

	public int insert(C001ReplyVO vo);

	public C001ReplyVO read(Long bno);

	public int delete(Long rno);

	public int update(C001ReplyVO vo);

	public List<C001ReplyVO> getListWithPaging(@Param("cri") Criteria cri, @Param("bno") Long bno);
}

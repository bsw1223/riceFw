package com.rice.C001.boarddao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.rice.C001.boarddto.Criteria;
import com.rice.C001.boardvo.C001CommentVO;

public interface C001ComtDAO {

	public int insert(C001CommentVO vo);

	public C001CommentVO read(String boNum);

	public int delete(String comtNum);

	public int update(C001CommentVO vo);

	public List<C001CommentVO> getListWithPaging(@Param("cri") Criteria cri, @Param("boNum") String boNum);
}

package com.model2.mvc.service.board.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.board.BoardDao;
import com.model2.mvc.service.domain.Board;
@Repository("boardDaoImpl")
public class BoardDaoImpl implements BoardDao {

	@Autowired
	@Qualifier("sqlSessionTemplate")
	SqlSession sqlSession;
	
	public BoardDaoImpl() {
		// TODO Auto-generated constructor stub
		System.out.println("Board Dao Impl");
	}

	@Override
	public void addBoard(Board board) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert("BoardMapper.addBoard",board);
	}

	@Override
	public Map getBoardList(Search search) throws Exception {
		// TODO Auto-generated method stub
		List list = sqlSession.selectList("BoardMapper.getBoardList",search);
		int totalCount = sqlSession.selectOne("BoardMapper.getTotalCount",search);
		Map map = new HashMap();
		map.put("list",list);
		map.put("totalCount", totalCount);
		return map;
	}

	@Override
	public Board getBoard(int boardNo) throws Exception {
		// TODO Auto-generated method stub
		
		
		
		return sqlSession.selectOne("BoardMapper.getBoard",boardNo);
	}

}

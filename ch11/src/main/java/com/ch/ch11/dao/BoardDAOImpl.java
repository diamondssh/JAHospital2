package com.ch.ch11.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.ch11.model.Board;

@Repository
public class BoardDAOImpl implements BoardDAO{
	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public int total(Board board) {
		// TODO Auto-generated method stub
		return sst.selectOne("boardns.total", board);
	}

	/*@Override		첫번째 방법 hashmap 쓰는 방법
	public List<Board> getList(int startRow,int endRow) {
		HashMap<String, Integer> hm = new HashMap<String,Integer>();
		hm.put("startRow", startRow);
		hm.put("endRow", endRow);
		return sst.selectList("boardns.list", hm);
	}*/	
	@Override//해쉬맵 안쓰는방법
	public List<Board> getList(Board board) {
		
		return sst.selectList("boardns.list", board);
	}
	public void updateReadCount(int num) {
		sst.update("boardns.updateReadCount",num);
		
	}
	public Board select(int num) {
		return sst.selectOne("boardns.select",num);
	}

	public int insert(Board board) {
		
		return sst.insert("boardns.insert",board);
	}

	@Override
	public int updateReadCount(Board board) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(int num) {
		// TODO Auto-generated method stub
		return sst.update("boardns.delete", num);
	}

	@Override
	public int getMaxNum() {
		// TODO Auto-generated method stub
		return sst.selectOne("boardns.maxnum");
	}

	@Override
	public void updateRe_step(Board board) {
		sst.update("boardns.updateRe_step", board);
		
	}

	@Override
	public int update(Board board) {
		// TODO Auto-generated method stub
		return sst.update("boardns.update", board);
	}
}

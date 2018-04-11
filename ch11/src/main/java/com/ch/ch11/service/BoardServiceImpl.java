package com.ch.ch11.service;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.ch11.dao.BoardDAO;
import com.ch.ch11.model.Board;
@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
	private BoardDAO bd;
	public int total(Board board) {
		return bd.total(board);
	}
	// public List<Board> getList(int startRow, int endRow) {
	public List<Board> getList(Board board) {
		return bd.getList(board);
		// return bd.getList(startRow, endRow);
	}
	public void updateReadCount(int num) {
		bd.updateReadCount(num);		
	}
	public Board select(int num) {
		return bd.select(num);
	}
	public int insert(Board board) {
		return bd.insert(board);
	}
	public int update(Board board) {
		return bd.update(board);
	}
	public int delete(int num) {
		return bd.delete(num);
	}
	public int getMaxNum() {
		return bd.getMaxNum();
	}
	public void updateRe_step(Board board) {
		bd.updateRe_step(board);		
	}
}





package com.ch.ch11.service;
import java.util.List;

import com.ch.ch11.model.Board;
public interface BoardService {
	int total(Board board);
	// List<Board> getList(int startRow, int endRow);
	List<Board> getList(Board board);
	void updateReadCount(int num);
	Board select(int num);
	int insert(Board board);
	int update(Board board);
	int delete(int num);
	int getMaxNum();
	void updateRe_step(Board board);

}

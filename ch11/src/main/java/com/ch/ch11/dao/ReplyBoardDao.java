package com.ch.ch11.dao;

import java.util.List;

import com.ch.ch11.model.ReplyBoard;

public interface ReplyBoardDao {

	List<ReplyBoard> list(int bno);

	void insert(ReplyBoard rb);

	void delete(int rno);

	void update(ReplyBoard rb);

}

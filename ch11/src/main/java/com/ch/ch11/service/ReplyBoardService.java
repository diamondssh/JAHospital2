package com.ch.ch11.service;

import java.util.List;

import com.ch.ch11.model.ReplyBoard;

public interface ReplyBoardService {

	List<ReplyBoard> list(int num);
	void insert(ReplyBoard rb);
	void delete(int rno);
	void update(ReplyBoard rb);

}

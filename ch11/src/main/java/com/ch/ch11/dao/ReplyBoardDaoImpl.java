package com.ch.ch11.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.ch11.model.ReplyBoard;
@Repository
public class ReplyBoardDaoImpl implements ReplyBoardDao {
	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public List<ReplyBoard> list(int bno) {
		
		return sst.selectList("rboardns.list",bno);
	}

	@Override
	public void insert(ReplyBoard rb) {
		System.out.println("bn0="+rb.getBno()+"rno="+rb.getRno()+"rT= "+rb.getReplytext()+"ply="+rb.getReplyer()+"rd="+rb.getRegdate()+"ud= "+rb.getUpdatedate()+"del="+rb.getDel());
		sst.insert("rboardns.insert",rb);
	}

	@Override
	public void delete(int rno) {
		sst.update("rboardns.delete",rno);
		
	}

	@Override
	public void update(ReplyBoard rb) {
		sst.update("rboardns.update",rb);
	}
	
}

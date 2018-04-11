package com.ch.ch11;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.ch11.model.Board;
import com.ch.ch11.model.ReplyBoard;
import com.ch.ch11.service.BoardService;
import com.ch.ch11.service.ReplyBoardService;

@Controller
public class ReplyBoardController {
	@Autowired
	private ReplyBoardService rbs;
	@Autowired
	private BoardService bs;
	@RequestMapping("/rlist/num/{num}")
	public String rlist(@PathVariable int num, Model model) {
		Board board = bs.select(num);
		List<ReplyBoard> rlist =rbs.list(num);
		model.addAttribute("board",board);
		model.addAttribute("rlist",rlist);
		return "rlist";
	}
	@RequestMapping("/rInsert")
	public String rInsert(ReplyBoard rb, Model model) {
		rbs.insert(rb);
		return "redirect:/rlist/num/"+rb.getBno();
	}
	@RequestMapping("/rDelete")
	public String rDelete(ReplyBoard rb, Model model) {
		rbs.delete(rb.getRno());
		return "redirect:/rlist/num/"+rb.getBno();
	}
	@RequestMapping("/rUpdate")
	public String rUpdate(ReplyBoard rb, Model model) {
		rbs.update(rb);
		return "redirect:/rlist/num/"+rb.getBno();
	}
}

package com.ch.ch11;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import com.ch.ch11.model.Board;
import com.ch.ch11.service.BoardService;
import com.ch.ch11.service.PagingPgm;
@Controller
public class BoardController {
	@Autowired
	private BoardService bs;
	@RequestMapping("/list")
	public String init() {
		return "forward:list/pageNum/1";
//		return "redirect:list/pageNum/1";
		
	}
	@RequestMapping("/list/pageNum/{pageNum}")
	public String list(@PathVariable String pageNum, 
				Board board, Model model) {
		int rowPerPage = 10;
		if (pageNum==null || pageNum.equals(""))
			pageNum = "1";
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1)*rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		int total = bs.total(board); 
		PagingPgm pp = new PagingPgm(total,rowPerPage,currentPage);
		int no = total - startRow + 1;
		board.setStartRow(startRow);
		board.setEndRow(endRow);
		// List<Board> list = bs.getList(startRow, endRow);
		List<Board> list = bs.getList(board);
		model.addAttribute("pp", pp);
		model.addAttribute("no", no);
		model.addAttribute("list", list);
		String[] ops = {"제목","작성자","내용","제목+내용"};
		model.addAttribute("keyword",board.getKeyword());
		model.addAttribute("search", board.getSearch());
		model.addAttribute("ops",ops);
		return "list";
	}
	@RequestMapping("/view/num/{num}/pageNum/{pageNum}")
	public String view(@PathVariable int num,
			@PathVariable String pageNum, Model model) {
		bs.updateReadCount(num);
		Board board = bs.select(num);
		model.addAttribute("board", board);
		model.addAttribute("pageNum", pageNum);
		return "view";
	}
	@RequestMapping("/insertForm") 
	public String insertForm(String nm,String pageNum,Model model){
		int num=0, ref=0, re_level=0, re_step=0;
		if (nm==null || nm.equals("null")) nm = null;
		if (nm != null) {
			num = Integer.parseInt(nm);
			Board board = bs.select(num);
			ref = board.getRef();
			re_level = board.getRe_level();
			re_step  = board.getRe_step();
		}
		model.addAttribute("num", num);
		model.addAttribute("ref", ref);
		model.addAttribute("re_level", re_level);
		model.addAttribute("re_step", re_step);
		model.addAttribute("pageNum", pageNum);
		return "insertForm";
	}
	@RequestMapping("/insert")
	public String insert(Board board,String pageNum, Model model,
			HttpServletRequest request) {
		int number = bs.getMaxNum();
		if (board.getNum() != 0) {
			bs.updateRe_step(board);
			board.setRe_level(board.getRe_level()+1);
			board.setRe_step(board.getRe_step()+1);
		} else board.setRef(number);
		board.setNum(number);
		String ip = request.getRemoteAddr();
		board.setIp(ip);
		int result = bs.insert(board);
		model.addAttribute("result", result);
		model.addAttribute("pageNum", pageNum);
		return "insert";
	}
	@RequestMapping("/updateForm/num/{num}/pageNum/{pageNum}")
	public String updateForm(@PathVariable int num,
			@PathVariable String pageNum,Model model) {
		Board board = bs.select(num);
		model.addAttribute("board", board);
		model.addAttribute("pageNum", pageNum);
		return "updateForm";
	}
	@RequestMapping("/update")
	public String update(Board board,String pageNum,Model model) {
		int result = bs.update(board);
		model.addAttribute("result", result);
		model.addAttribute("pageNum", pageNum);
		return "update";
	}
	@RequestMapping("/deleteForm/num/{num}/pageNum/{pageNum}")
	public String deleteForm(@PathVariable int num,
			@PathVariable String pageNum, Model model) {
		Board board = bs.select(num);
		model.addAttribute("board", board);
		model.addAttribute("pageNum", pageNum);
		return "deleteForm";
	}
	@RequestMapping("/delete")
	public String delete(int num, String pageNum, Model model) {
		int result = bs.delete(num);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("result", result);
		return "delete";
	}
}




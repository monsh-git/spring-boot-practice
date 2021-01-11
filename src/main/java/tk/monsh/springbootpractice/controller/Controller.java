package tk.monsh.springbootpractice.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import tk.monsh.springbootpractice.domain.Board;
import tk.monsh.springbootpractice.service.BoardService;

@org.springframework.stereotype.Controller
public class Controller {
	
	@Autowired BoardService boardservice;
	
	@RequestMapping("/")
	public String home(Model model) {
		
		List<Board> list = boardservice.selectBoardList();
		model.addAttribute("list", list);
		return "/index";
	}
}

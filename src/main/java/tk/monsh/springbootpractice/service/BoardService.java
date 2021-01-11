package tk.monsh.springbootpractice.service;

import java.util.List;

import tk.monsh.springbootpractice.domain.Board;

public interface BoardService {
	public List<Board> selectBoardList();
}

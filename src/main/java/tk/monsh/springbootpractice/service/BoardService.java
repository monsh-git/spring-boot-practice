package tk.monsh.springbootpractice.service;

import java.util.List;

import tk.monsh.springbootpractice.domain.Board;

public interface BoardService {
	
	public List<Board> getBoards(String itemId);
	
	public Board getBoard(int boardId);
	
	public void createBoard(Board board);
	
	public void updateBoard(Board board);
}

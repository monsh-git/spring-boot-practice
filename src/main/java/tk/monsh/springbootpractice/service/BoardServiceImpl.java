package tk.monsh.springbootpractice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tk.monsh.springbootpractice.domain.Board;
import tk.monsh.springbootpractice.mapper.BoardMapper;

@Service("BoardServiceImpl")
public class BoardServiceImpl implements BoardService {
	
	@Autowired BoardMapper boardMapper;
	
	@Override
	public List<Board> getBoards(String itemId) {
		return boardMapper.getBoards(itemId);
	}
	
	@Override
	public Board getBoard(int boardId) {
		return boardMapper.getBoard(boardId);
	}
	
	@Override
	public void createBoard(Board board) {
		boardMapper.createBoard(board);
	}
	
	@Override
	public void updateBoard(Board board) {
		boardMapper.updateBoard(board);
	}
}

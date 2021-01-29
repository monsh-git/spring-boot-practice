package tk.monsh.springbootpractice.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import tk.monsh.springbootpractice.domain.Board;

@Mapper
public interface BoardMapper {
	
	public List<Board> getBoards(String itemId);
	public Board getBoard(int boardId);
	public void createBoard(Board board);
	public void updateBoard(Board board);
}

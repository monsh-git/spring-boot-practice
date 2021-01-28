package tk.monsh.springbootpractice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tk.monsh.springbootpractice.domain.Board;
import tk.monsh.springbootpractice.mapper.BoardMapper;

@Service("BoardServiceImpl")
public class BoardServiceImpl implements BoardService {
	
	@Autowired BoardMapper boardmapper;
	
	@Override
	public List<Board> getBoards(String itemId) {
		return boardmapper.getBoards(itemId);
	}
}

package tk.monsh.springbootpractice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tk.monsh.springbootpractice.domain.Item;
import tk.monsh.springbootpractice.mapper.ItemMapper;

@Service
public class ItemServiceImpl implements ItemService {

	@Autowired
	ItemMapper itemMapper;
	
	Item item = null;
	List<Item> list = null;
	
	@Override
	public Item readItem(String itemId) {
		item = itemMapper.readItem(itemId);
		
		return item;
	}
	
	@Override
	public List<Item> readItems() {
		list = itemMapper.readItems();
		
		return list;
	}

	@Override
	public void addItem(Item item) {
		itemMapper.addItem(item);
	}
	
	@Override
	public void editItem(Item item) {
		itemMapper.editItem(item);
	}
}

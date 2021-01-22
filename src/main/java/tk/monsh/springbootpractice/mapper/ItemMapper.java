package tk.monsh.springbootpractice.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import tk.monsh.springbootpractice.domain.Item;

@Mapper
public interface ItemMapper {
	// Read items
	public List<Item> readItems();

	// Read item
	public Item readItem(String itemId);
	
	// Add item
	public void addItem(Item item);
	
	// Edit item
	public void editItem(Item item);
}

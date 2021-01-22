package tk.monsh.springbootpractice.service;

import java.util.List;

import tk.monsh.springbootpractice.domain.Item;

public interface ItemService {

	// Read items
	public List<Item> readItems();

	// Read item
	public Item readItem(String itemId);

	// Add item
	public void addItem(Item item);
	
	// Edit item
	public void editItem(Item item);
}

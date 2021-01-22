package tk.monsh.springbootpractice.service;

import tk.monsh.springbootpractice.domain.Order;

public interface OrderService {
	
	// Get an order
	public Order getOrder(String username);
	
	// Make an order
	public void makeOrder(String username);
}

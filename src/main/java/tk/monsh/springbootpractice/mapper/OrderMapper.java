package tk.monsh.springbootpractice.mapper;

import org.apache.ibatis.annotations.Mapper;

import tk.monsh.springbootpractice.domain.Order;

@Mapper
public interface OrderMapper {
	
	// Get an order
	public Order getOrder(String username);
	
	// Make an order
	public void makeOrder(String username);
	
	// Get the total amount of an order
	public int getTotalAmount(int orderId);
}

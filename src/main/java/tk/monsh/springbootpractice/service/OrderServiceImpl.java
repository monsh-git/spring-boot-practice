package tk.monsh.springbootpractice.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tk.monsh.springbootpractice.domain.Order;
import tk.monsh.springbootpractice.mapper.OrderMapper;

@Service
public class OrderServiceImpl implements OrderService {
	
	@Autowired
	OrderMapper orderMapper;
	
	@Override
	public Order getOrder(String username) {
		Order order = orderMapper.getOrder(username);
		
		return order;
	}
	
	@Override
	public void makeOrder(String username) {
		orderMapper.makeOrder(username);
	}
}

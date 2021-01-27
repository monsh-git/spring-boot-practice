package tk.monsh.springbootpractice.service;

import java.util.List;

import tk.monsh.springbootpractice.domain.Order;
import tk.monsh.springbootpractice.domain.OrderDetail;

public interface OrderDetailService {
	
	public List<OrderDetail> getOrderDetails(int orderId);
	public void makeOrderDetail(OrderDetail orderDetail);
}

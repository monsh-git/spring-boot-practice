package tk.monsh.springbootpractice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tk.monsh.springbootpractice.domain.Order;
import tk.monsh.springbootpractice.domain.OrderDetail;
import tk.monsh.springbootpractice.mapper.OrderDetailMapper;

@Service
public class OrderDetailServiceImpl implements OrderDetailService {

	@Autowired
	OrderDetailMapper orderDetailMapper;
	
	@Override
	public List<OrderDetail> getOrderDetails(int orderId) {
		
		List<OrderDetail> orderDetailList = orderDetailMapper.getOrderDetails(orderId);
		
		return orderDetailList;
	}
	
	@Override
	public void makeOrderDetail(OrderDetail orderDetail) {
		orderDetailMapper.makeOrderDetail(orderDetail);
	}
}

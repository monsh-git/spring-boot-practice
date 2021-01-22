package tk.monsh.springbootpractice.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import tk.monsh.springbootpractice.domain.OrderDetail;

@Mapper
public interface OrderDetailMapper {
	
	public List<OrderDetail> makeOrder();
}

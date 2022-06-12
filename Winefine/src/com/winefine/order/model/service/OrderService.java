package com.winefine.order.model.service;

import static com.winefine.common.JDBCTemplate.close;
import static com.winefine.common.JDBCTemplate.commit;
import static com.winefine.common.JDBCTemplate.getConnection;
import static com.winefine.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.winefine.common.model.vo.PageInfo;
import com.winefine.order.model.dao.OrderDao;
import com.winefine.order.model.vo.Order;
import com.winefine.order.model.vo.OrderProduct;



public class OrderService {
	
	public int insertOrder(Order o) {
		Connection conn = getConnection();
		
		int result = new OrderDao().insertOrder(conn, o);
		
		if(result > 0) {
			commit(conn);
		}
		else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	public Order selectOrder(int userNo) {
		Connection conn = getConnection();
		
		Order paidOrder = new OrderDao().selectOrder(conn, userNo);
		
		close(conn);
		
		return paidOrder;
	
	}
	
	public Order selectOrderByOrderNo(int orderNo) {
		Connection conn = getConnection();
		
		Order o = new OrderDao().selectOrderByOrderNo(conn, orderNo);
		
		close(conn);
		
		return o;
	
	}
	
	public int insertOrderProduct(int orderNo, String productNo, int price, int bottle) {
		
		Connection conn = getConnection();
		
		int resultOrderProduct = new OrderDao().insertOrderProduct(conn, orderNo, productNo, price, bottle);
		
		if(resultOrderProduct > 0) {
			commit(conn);
		}
		else {
			rollback(conn);
		}
		
		close(conn);
		
		return resultOrderProduct;
	}
	
	public ArrayList<OrderProduct> selectOrderProduct(int orderNo) {
		
		Connection conn = getConnection();
		
		ArrayList<OrderProduct> opList = new OrderDao().selectOrderProduct(conn, orderNo);
		
		close(conn);
		
		return opList;
		
	}
	
	public ArrayList<Order> selectOrderList(int userNo) {
		
		Connection conn = getConnection();
	
		ArrayList<Order> list = new OrderDao().selectOrderList(conn, userNo);
		
		close(conn);
		
		return list;
	}
	
	// 페이징용
	public int selectListCount() {
		
		Connection conn = getConnection();
		
		int listCount = new OrderDao().selectListCount(conn);
		
		close(conn);
		
		return listCount;
	}
	
	// 관리자 - 전체 주문 조회용
	public ArrayList<Order> selectAllOrderList(PageInfo pi) {
		
		Connection conn = getConnection();
		
		ArrayList<Order> list = new OrderDao().selectAllOrderList(conn, pi);
		
		close(conn);
		
		return list;
		
	}
	
	// 관리자 - 주문 수정용(결제완료/픽업완료)
	public int updateOrder(int orderNo) {
		Connection conn = getConnection();
		
		int result = new OrderDao().updateOrder(conn, orderNo);
		
		if(result > 0) {
			commit(conn);
		}
		else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

}

























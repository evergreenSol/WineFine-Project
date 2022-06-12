package com.winefine.order.model.dao;

import static com.winefine.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.winefine.cart.model.dao.CartDao;
import com.winefine.common.model.vo.PageInfo;
import com.winefine.order.model.vo.Order;
import com.winefine.order.model.vo.OrderProduct;

public class OrderDao {
	
	// 전역변수로 Properties 타입의 객체 하나 만들어두기
			private Properties prop = new Properties();
			
	// 공통적인 코드를 기본생성자에 빼기
	public OrderDao() {
		
		// 나중에 배포될 classes 폴더 기준으로 xml 파일의 경로 잡기
		String fileName = CartDao.class.getResource("/sql/order/order-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int insertOrder(Connection conn, Order o) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertOrder");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, o.getOrderUser());
			pstmt.setString(2, o.getPickup());
			pstmt.setString(3, o.getPickupDate());
			pstmt.setString(4, o.getOrderStatus());
			pstmt.setInt(5, o.getTotalPrice());
			pstmt.setString(6, o.getLocationCode());
			pstmt.setString(7, o.getPaymentCode());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;

	}
	
	public Order selectOrder(Connection conn, int userNo) {
		
		Order paidOrder = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectOrder");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				paidOrder = new Order(rset.getInt("ORDER_NO"),
									  rset.getString("ORDER_USER"),
									  rset.getString("PICKUP"),
									  rset.getString("PICKUP_DATE"),
									  rset.getString("ORDER_STATUS"),
									  rset.getInt("TOTAL_PRICE"),
									  rset.getDate("ORDER_DATE"),
									  rset.getString("LOCATION_NAME"),
								  	  rset.getString("PAYMENT"));
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return paidOrder;
	}
	
	public Order selectOrderByOrderNo(Connection conn, int orderNo) {
		
		Order o = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectOrderByOrderNo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, orderNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				o = new Order(rset.getInt("ORDER_NO"),
							  rset.getString("USER_NAME"),
							  rset.getString("PICKUP"),
							  rset.getString("PICKUP_DATE"),
							  rset.getString("ORDER_STATUS"),
							  rset.getInt("TOTAL_PRICE"),
							  rset.getDate("ORDER_DATE"),
							  rset.getString("LOCATION_NAME"),
							  rset.getString("PAYMENT"));
			} 
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return o;
	}
				
	
	public int insertOrderProduct(Connection conn, int orderNo, String productNo, int price, int bottle) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertOrderProduct");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, orderNo);
			pstmt.setInt(2, Integer.parseInt(productNo));
			pstmt.setInt(3, bottle);
			pstmt.setInt(4, price);
//			pstmt.setInt(1, orderNo);
//			pstmt.setInt(1, Integer.parseInt(productNo));
//			pstmt.setInt(2, bottle);
//			pstmt.setInt(3, price);
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
		
	}

	public ArrayList<OrderProduct> selectOrderProduct(Connection conn, int orderNo) {
		
		ArrayList<OrderProduct> opList = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectOrderProduct");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, orderNo);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				
				OrderProduct op = new OrderProduct(rset.getInt("ORDER_PRODUCT_NO"),
												   rset.getInt("ORDER_NO"),												   
												   rset.getInt("PRODUCT_NO"),
												   rset.getString("PRODUCT_NAME"), // 뽑을 땐 getProductNo로()
												   rset.getInt("P_COUNT"),
												   rset.getInt("P_PRICE"),
												   rset.getString("THUMBNAIL"));
//				op.setTotalPrice();
				opList.add(op);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return opList;
	}
	
	public ArrayList<Order> selectOrderList(Connection conn, int userNo) {
		
		ArrayList<Order> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectOrder");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
			Order o	= new Order(rset.getInt("ORDER_NO"),
								rset.getString("ORDER_USER"),
								rset.getString("PICKUP"),
								rset.getString("PICKUP_DATE"),
								rset.getString("ORDER_STATUS"),
								rset.getInt("TOTAL_PRICE"),
								rset.getDate("ORDER_DATE"),
								rset.getString("LOCATION_NAME"),
								rset.getString("PAYMENT"));
			
			list.add(o);
	
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	// 페이징 처리용
	public int selectListCount(Connection conn) {
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectListCount");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				listCount = rset.getInt("COUNT");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			
			close(rset);
			close(pstmt);
		}
		
		return listCount;
	}
	
	
	// 관리자 - 전체 주문 조회용
	public ArrayList<Order> selectAllOrderList(Connection conn, PageInfo pi) {
		
		ArrayList<Order> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAllOrder");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			/*
			 * boardLimit 가 10 이라는 가정 하에
			 * currentPage : 1 => 시작값 1, 끝값 10
			 * currentPage : 2 => 시작값 11, 끝값 20
			 * currentPage : 3 => 시작값 21, 끝값 30
			 * ...
			 * 
			 * 시작값 = (currentPage - 1) * boardLimit + 1
			 * 끝값 = 시작값 + boardLimit - 1
			 */
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
			Order o	= new Order(rset.getInt("ORDER_NO"),
								rset.getString("USER_ID"),
								rset.getString("PICKUP"),
								rset.getString("PICKUP_DATE"),
								rset.getString("ORDER_STATUS"),
								rset.getInt("TOTAL_PRICE"),
								rset.getDate("ORDER_DATE"),
								rset.getString("LOCATION_NAME"),
								rset.getString("PAYMENT"));
			
			list.add(o);
	
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);

		}
		
		return list;
		
	}
	
	public int updateOrder(Connection conn, int orderNo) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateOrder");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, orderNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		
		return result;

	}
	


}
























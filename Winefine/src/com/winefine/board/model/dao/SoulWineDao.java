package com.winefine.board.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.winefine.common.JDBCTemplate;
import com.winefine.store.model.vo.Product;

public class SoulWineDao {

	// 전역변수로 Properties 타입의 객체 하나 만들어두기
	private Properties prop = new Properties();
	
	// 공통적인 코드를 기본생성자에 빼기
	public SoulWineDao() {
		
		// 나중에 배포될 classes 폴더 기준으로 xml 파일의 경로 잡기
		String fileName = SoulWineDao.class.getResource("/sql/board/soulWine-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<Product> selectCartList(Connection conn, int sweetness, int acidity, int body, int tannin) {

		// SELECT 문 => ResultSet 객체 (여러행 조회) => ArrayList
		
		// 1) 필요한 변수들 셋팅
		ArrayList<Product> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectSoulWineList");
		
		try {
			
			// 2) PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			
			// 3) 미완성된 SQL 문 완성시키기
			// 로그인 구현되면 userNo 동적으로 받아오기
			pstmt.setInt(1, sweetness);
			pstmt.setInt(2, acidity);
			pstmt.setInt(3, body);
			pstmt.setInt(4, tannin);
			
			// 4, 5) 쿼리문 실행 후 결과받기
			rset = pstmt.executeQuery();
			
			// 6) VO 객체 또는 ArrayList 로 가공하기
			while(rset.next()) {
				
				list.add(new Product(rset.getInt("PRODUCT_NO"),
									rset.getString("PRODUCT_TYPE"),
									rset.getString("PRODUCT_NAME"),
									rset.getInt("PRICE"),
									rset.getString("BRAND"),
									rset.getFloat("ALCOHOL"),
									rset.getInt("STOCK"),
									rset.getString("ORIGIN"),
									rset.getInt("SWEETNESS"),
									rset.getInt("ACIDITY"),
									rset.getInt("BODY"),
									rset.getInt("TANNIN"),
									rset.getString("STATUS"),
									rset.getInt("COUNT"),
									rset.getString("THUMBNAIL"),
									rset.getString("CONTENT_PHOTO1"),
									rset.getString("CONTENT_PHOTO2"),
									rset.getString("CONTENT")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			
			// 7) 자원반납 (생성된 순서의 역순)
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		// 8) 결과 반환
		return list;
	
	}

}

package com.winefine.board.model.service;

import static com.winefine.common.JDBCTemplate.close;
import static com.winefine.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.winefine.board.model.dao.SoulWineDao;
import com.winefine.store.model.vo.Product;

public class SoulWineService {

	public ArrayList<Product> selectSoulWineList(int sweetness, int acidity, int body, int tannin) {

		// 1) Connection 객체 생성
				Connection conn = getConnection();
				
		// 2) Connection 객체와 전달값을 DAO 로 넘기기 및 결과 받기
		ArrayList<Product> list = new SoulWineDao().selectCartList(conn, sweetness, acidity, body, tannin);;
		
		// 3) commit, rollback 처리 (select 문이라 생략)
		
		// 4) Connection 객체 반납
		close(conn);
		
		// 5) 결과 반환
		return list;
	}

}

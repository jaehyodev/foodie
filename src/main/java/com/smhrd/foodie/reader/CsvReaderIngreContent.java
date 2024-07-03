package com.smhrd.foodie.reader;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import com.opencsv.CSVReader;

import static java.lang.Integer.parseInt;

/**
 * CsvReaderIngreContent 클래스는 식재료 정보에 대한 설명이 담긴 csv 파일을 Database에 업데이트하는 기능을 수행.
 */

public class CsvReaderIngreContent {
	public static void main(String[] args) {

		// DB 연결 정보 설정
		String dbDriver = "com.mysql.cj.jdbc.Driver";
		String jdbcUrl = "jdbc:mysql://project-db-cgi.smhrd.com:3307/campus_24SW_FULL_p2_2";
		String username = "campus_24SW_FULL_p2_2";
		String password = "smhrd2";

		// CSV 파일 경로 설정
		String filePath = "C:\\Users\\smhrd\\Desktop\\ingredient_info.csv";

		// 한 번에 처리할 데이터 튜플 개수 설정
		int batchSize = 5;

		Connection conn = null;

		try {
			// JDBC 드라이버 로드 및 DB 연결 설정
			System.out.println("DB 접속 시도");
			Class.forName(dbDriver);
			conn = DriverManager.getConnection(jdbcUrl, username, password);
			conn.setAutoCommit(false); // AutoCommit 비활성화

			// 업데이트를 위한 PreparedStatement 설정
			String sqlUpdate = "UPDATE ingredient_info SET ingre_content = ? WHERE ingre_idx = ?";
			PreparedStatement updateStmt = conn.prepareStatement(sqlUpdate);

			// OpenCSV를 사용하여 CSV 파일 읽기
			CSVReader lineReader = new CSVReader(new FileReader(filePath));
			String[] nextLine = null;
			int count = 0; // 처리한 행의 개수
			int total = 185; // DB에 넣을 총 튜플의 개수

			lineReader.readNext(); // 첫 번째 행은 헤더이므로 건너뜀

			while ((nextLine = lineReader.readNext()) != null && count < total) {
				System.out.println("DB 데이터 받는 중");
				String ingre_idx = nextLine[0].trim(); // CSV 파일의 1번 컬럼 데이터 (ingre_idx)
				String ingre_content = nextLine[1].trim(); // CSV 파일의 2번 컬럼 데이터 (ingre_content)

				// PreparedStatement에 값 설정
				updateStmt.setString(1, ingre_content);
				updateStmt.setInt(2, parseInt(ingre_idx));
				updateStmt.addBatch(); // 배치 삽입

				count++;

				// 배치 크기에 도달하면 배치 실행
				if (count % batchSize == 0) {
					updateStmt.executeBatch(); // 배치 실행
				}
			}

			// 남은 데이터 삽입
			updateStmt.executeBatch();

			// 사용한 자원 해제
			lineReader.close();
			updateStmt.close();

			// 커밋 후 DB 연결 종료
			conn.commit();
			conn.close();

			System.out.println("DB 데이터 추가 완료");

		} catch (Exception exception) {

			System.out.println("DB 접속 실패");

			exception.printStackTrace();
		}
	}
}

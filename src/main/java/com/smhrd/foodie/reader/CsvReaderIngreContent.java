package com.smhrd.foodie.reader;

import java.io.BufferedReader;
import java.io.FileReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.opencsv.CSVReader;

import static java.lang.Integer.parseInt;

public class CsvReaderIngreContent {
	public static void main(String[] args) {

		String dbDriver = "com.mysql.cj.jdbc.Driver";
		String jdbcUrl = "jdbc:mysql://project-db-cgi.smhrd.com:3307/campus_24SW_FULL_p2_2";
		String username = "campus_24SW_FULL_p2_2";
		String password = "smhrd2";

		String filePath = "C:\\Users\\smhrd\\Desktop\\ingredient_info.csv";

		// 데이터를 DB에 넣을 때 한 번마다 넣을 수 있는 튜플의 개수 단위 (5개씩 작업)
		// DB에 들어가는 총 데이터(튜플)의 개수가 아님!!!
		int batchSize = 5;

		Connection conn = null;

		try {
			System.out.println("DB 접속 시도");
			Class.forName(dbDriver);
			conn = DriverManager.getConnection(jdbcUrl, username, password);
			conn.setAutoCommit(false);

			String sqlUpdate = "UPDATE ingredient_info SET ingre_content = ? WHERE ingre_idx = ?";

			PreparedStatement updateStmt = conn.prepareStatement(sqlUpdate);

			// OpenCSV를 사용하여 CSV 파일 읽기
			CSVReader lineReader = new CSVReader(new FileReader(filePath));
			String[] nextLine = null;
			int count = 0;
			int maxLength = 185;

			lineReader.readNext(); // 첫 번째 행은 헤더이므로 건너뛴다.

			while ((nextLine = lineReader.readNext()) != null && count < maxLength) {
				System.out.println("DB 데이터 받는 중");
				String ingre_idx = nextLine[0].trim();
				; // csv파일의 1번 컬럼 데이터
				String ingre_content = nextLine[1].trim();
				; // csv파일의 2번 컬럼 데이터

				updateStmt.setString(1, ingre_content);
				updateStmt.setInt(2, parseInt(ingre_idx));
				updateStmt.addBatch();

				count++;
				if (count % batchSize == 0) {
					updateStmt.executeBatch();
				}

			}

			// 남은 데이터 INSERT
			updateStmt.executeBatch();

			// 사용한 리소스를 닫습니다.
			lineReader.close();
			updateStmt.close();

			// DB 연결 종료
			conn.commit();
			conn.close();

			System.out.println("DB 데이터 추가 완료");
		} catch (

		Exception exception) {
			System.out.println("DB 접속 실패");
			exception.printStackTrace();
		}
	}
}

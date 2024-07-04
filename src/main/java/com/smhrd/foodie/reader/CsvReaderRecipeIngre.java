package com.smhrd.foodie.reader;

import java.io.BufferedReader;
import java.io.FileReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import static java.lang.Integer.parseInt;

/**
 * CsvReaderRecipeIngre 클래스는 레시피-식재료 연결 정보가 담긴 CSV 파일을 읽어와 데이터베이스에 삽입하는 기능을 수행.
 */

public class CsvReaderRecipeIngre {
	public static void main(String[] args) {

		// DB 연결 정보 설정
		String dbDriver = "com.mysql.cj.jdbc.Driver";
		String jdbcUrl = "jdbc:mysql://project-db-cgi.smhrd.com:3307/campus_24SW_FULL_p2_2";
		String username = "campus_24SW_FULL_p2_2";
		String password = "smhrd2";

		// CSV 파일 경로 설정
		String filePath = "C:\\Users\\smhrd\\Desktop\\recipe_ingre_info.csv";

		// 한 번에 처리할 데이터 튜플 개수 설정
		int batchSize = 5;

		Connection conn = null;

		try {
			// JDBC 드라이버 로드 및 DB 연결 설정
			System.out.println("DB 접속 시도");
			Class.forName(dbDriver);
			conn = DriverManager.getConnection(jdbcUrl, username, password);
			conn.setAutoCommit(false); // 자동 커밋 비활성화

			// 중복 체크를 위한 SQL 문장
			String sqlCheckDuplicate = "SELECT COUNT(*) FROM recipe_ingre_info WHERE recipe_ingre_idx = ?";
			PreparedStatement checkDuplicateStmt = conn.prepareStatement(sqlCheckDuplicate);

			// 데이터 삽입을 위한 SQL 문장
			String sqlInsert = "INSERT INTO recipe_ingre_info (recipe_ingre_idx, recipe_idx, ingre_idx) VALUES (?, ?, ?)";
			PreparedStatement insertStmt = conn.prepareStatement(sqlInsert);

			// CSV 파일 읽기를 위한 BufferedReader 설정
			BufferedReader lineReader = new BufferedReader(new FileReader(filePath));
			String lineText = null;
			int count = 0; // 처리한 행의 개수
			int maxLength = 551; // DB에 넣을 총 튜플의 개수

			lineReader.readLine(); // 첫 번째 행은 헤더이므로 건너뛴다.

			while ((lineText = lineReader.readLine()) != null && count < maxLength) {
				System.out.println("DB 데이터 받는 중");
				String[] data = lineText.split(",");
				String recipe_ingre_idx = data[0].trim(); // CSV 파일의 1번 컬럼 데이터 (레시피-식재료 인덱스)
				String recipe_idx = data[1].trim(); // CSV 파일의 2번 컬럼 데이터 (레시피 인덱스)
				String ingre_idx = data[2].trim(); // CSV 파일의 3번 컬럼 데이터 (식재료 인덱스)

				// 중복 체크
				checkDuplicateStmt.setInt(1, parseInt(recipe_ingre_idx));
				ResultSet resultSet = checkDuplicateStmt.executeQuery();
				resultSet.next();
				int existingCount = resultSet.getInt(1);

				// 중복 없으면 데이터 삽입
				if (existingCount == 0) {
					insertStmt.setInt(1, parseInt(recipe_ingre_idx));
					insertStmt.setInt(2, parseInt(recipe_idx));
					insertStmt.setInt(3, parseInt(ingre_idx));
					insertStmt.addBatch(); // 배치 삽입

					count++;
					if (count % batchSize == 0) {
						insertStmt.executeBatch(); // 배치 실행
					}
				}
			}

			// 남은 데이터 삽입
			insertStmt.executeBatch();

			// 사용한 자원 해제
			lineReader.close();
			insertStmt.close();
			checkDuplicateStmt.close();

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

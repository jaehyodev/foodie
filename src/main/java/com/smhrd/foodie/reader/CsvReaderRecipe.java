package com.smhrd.foodie.reader;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.opencsv.CSVReader;

import static java.lang.Integer.parseInt;

/**
 * CsvReaderRecipe 클래스는 레시피 데이터가 담긴 CSV 파일을 읽어와 데이터베이스에 삽입하는 기능을 수행.
 */

public class CsvReaderRecipe {
	public static void main(String[] args) {

		// DB 연결 정보 설정
		String dbDriver = "com.mysql.cj.jdbc.Driver";
		String jdbcUrl = "jdbc:mysql://project-db-cgi.smhrd.com:3307/campus_24SW_FULL_p2_2";
		String username = "campus_24SW_FULL_p2_2";
		String password = "smhrd2";

		// CSV 파일 경로 설정
		String filePath = "C:\\Users\\smhrd\\Desktop\\recipe_info.csv";

		// 한 번에 처리할 데이터 튜플 개수 설정
		int batchSize = 5;

		Connection conn = null;

		try {
			// JDBC 드라이버 로드 및 DB 연결 설정
			System.out.println("DB 접속 시도");
			Class.forName(dbDriver);
			conn = DriverManager.getConnection(jdbcUrl, username, password);
			conn.setAutoCommit(false); // AutoCommit 비활성화

			// 중복 체크를 위한 SQL 문장
			String sqlCheckDuplicate = "SELECT COUNT(*) FROM recipe_info WHERE recipe_idx = ?";
			PreparedStatement checkDuplicateStmt = conn.prepareStatement(sqlCheckDuplicate);

			// 데이터 삽입을 위한 SQL 문장
			String sqlInsert = "INSERT INTO recipe_info " + "(recipe_idx, recipe_name, recipe_cat, recipe_content, "
					+ "recipe_time, recipe_portion, recipe_all_ingre, "
					+ "recipe_cook, recipe_title_img) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement insertStmt = conn.prepareStatement(sqlInsert);

			// OpenCSV를 사용하여 CSV 파일 읽기
			CSVReader lineReader = new CSVReader(new FileReader(filePath));
			String[] nextLine = null;
			int count = 0; // 처리한 행의 개수
			int total = 70; // DB에 넣을 총 튜플의 개수
			
			lineReader.readNext(); // 첫 번째 행은 헤더이므로 건너뛴다.

			while ((nextLine = lineReader.readNext()) != null && count < total) {
				System.out.println("DB 데이터 받는 중");
				String recipe_idx = nextLine[0].trim();
				String recipe_name = nextLine[1].trim();
				String recipe_cat = nextLine[2].trim();
				String recipe_content = nextLine[3].trim();
				String recipe_time = nextLine[4].trim();
				String recipe_portion = nextLine[5].trim();
				String recipe_all_ingre = nextLine[6].trim();
				String recipe_cook = nextLine[7].trim();
				String recipe_title_img = "/recipe/" + nextLine[8].trim() + "_title.jpg";

				// 중복 체크
				checkDuplicateStmt.setInt(1, parseInt(recipe_idx));
				ResultSet resultSet = checkDuplicateStmt.executeQuery();
				resultSet.next();
				int existingCount = resultSet.getInt(1);

				// 중복 없으면 데이터 삽입
				if (existingCount == 0) {
					insertStmt.setInt(1, Integer.parseInt(recipe_idx));
					insertStmt.setString(2, recipe_name);
					insertStmt.setString(3, recipe_cat);
					insertStmt.setString(4, recipe_content);
					insertStmt.setInt(5, Integer.parseInt(recipe_time));
					insertStmt.setInt(6, Integer.parseInt(recipe_portion));
					insertStmt.setString(7, recipe_all_ingre);
					insertStmt.setString(8, recipe_cook);
					insertStmt.setString(9, recipe_title_img);
					insertStmt.addBatch(); // 배치 삽입

					count++;
					
					// 배치 크기에 도달하면 배치 실행
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

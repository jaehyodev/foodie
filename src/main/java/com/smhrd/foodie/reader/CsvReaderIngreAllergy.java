package com.smhrd.foodie.reader;

import java.io.BufferedReader;
import java.io.FileReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import static java.lang.Integer.parseInt;

public class CsvReaderIngreAllergy {
    public static void main(String[] args) {
    	
    	String dbDriver = "com.mysql.cj.jdbc.Driver";
    	String jdbcUrl = "jdbc:mysql://project-db-cgi.smhrd.com:3307/campus_24SW_FULL_p2_2";
    	String username = "campus_24SW_FULL_p2_2";
    	String password = "smhrd2";
    	
    	String filePath = "C:\\Users\\smhrd\\Desktop\\ingre_allergy_info.csv";
    	
    	// 데이터를 DB에 넣을 때 한 번마다 넣을 수 있는 튜플의 개수 단위 (5개씩 작업)
    	// DB에 들어가는 총 데이터(튜플)의 개수가 아님!!!
    	int batchSize = 5;
    	
    	Connection conn = null;
    	
    	try {
    		System.out.println("DB 접속 시도");
    	    Class.forName(dbDriver);
    	    conn = DriverManager.getConnection(jdbcUrl, username, password);
    	    conn.setAutoCommit(false);

    	    String sql = "INSERT INTO ingre_allergy_info (ingre_allergy_idx, ingre_idx, allergy_idx) VALUES (?, ?, ?)";
    	    PreparedStatement statement = conn.prepareStatement(sql);

    	    BufferedReader lineReader = new BufferedReader(new FileReader(filePath));
    	    String lineText = null;
    	    int count = 0;

    	    lineReader.readLine(); // 첫 번째 행은 헤더이므로 건너뛴다.

    	    // count 조건을 주어 넣을 수 있는 데이터(튜플)의 수를 제한
    	    while ((lineText = lineReader.readLine()) != null && count <= 257) {
    	    	System.out.println("DB 데이터 받는 중");
    	        String[] data = lineText.split(",");
    	        String ingre_allergy_idx = data[0]; // csv파일의 1번 컬럼 데이터
    	        String ingre_idx = data[1]; // csv파일의 2번 컬럼 데이터
    	        String allergy_idx = data[2]; // csv파일의 3번 컬럼 데이터

    	        statement.setInt(1, parseInt(ingre_allergy_idx));
    	        statement.setInt(2, parseInt(ingre_idx));
    	        statement.setInt(3, parseInt(allergy_idx));
    	        statement.addBatch();

    	        count++;
    	        if (count % batchSize == 0) {
    	            statement.executeBatch();
    	        }
    	    }
    	    
    	    // 사용한 리소스를 닫습니다.
    	    lineReader.close();
    	    
    	    // DB에 못 들어간 데이터가 있으면 넣기 (5개 미만인 경우)
    	    statement.executeBatch();
    	    
    	    // DB 연결 종료
    	    conn.commit();
    	    conn.close();

    	    System.out.println("DB 데이터 추가 완료");
    	} catch (Exception exception) {
    	    System.out.println("DB 접속 실패");
    	    
    	    exception.printStackTrace();
    	}
    }
}
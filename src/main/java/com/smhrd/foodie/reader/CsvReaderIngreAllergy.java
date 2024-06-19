package com.smhrd.foodie.reader;

import java.io.BufferedReader;
import java.io.FileReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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

            String sqlCheckDuplicate = "SELECT COUNT(*) FROM ingre_allergy_info WHERE ingre_allergy_idx = ?";
            String sqlInsert = "INSERT INTO ingre_allergy_info (ingre_allergy_idx, ingre_idx, allergy_idx) VALUES (?, ?, ?)";
            
            PreparedStatement checkDuplicateStmt = conn.prepareStatement(sqlCheckDuplicate);
            PreparedStatement insertStmt = conn.prepareStatement(sqlInsert);

            BufferedReader lineReader = new BufferedReader(new FileReader(filePath));
            String lineText = null;
            int count = 0;

            lineReader.readLine(); // 첫 번째 행은 헤더이므로 건너뛴다.

            while ((lineText = lineReader.readLine()) != null && count < 266) {
                System.out.println("DB 데이터 받는 중");
                String[] data = lineText.split(",");
                String ingre_allergy_idx = data[0]; // csv파일의 1번 컬럼 데이터
                String ingre_idx = data[1]; // csv파일의 2번 컬럼 데이터
                String allergy_idx = data[2]; // csv파일의 3번 컬럼 데이터

                // 중복 체크 (ingre_allergy_idx 기준)
                checkDuplicateStmt.setInt(1, parseInt(ingre_allergy_idx));
                ResultSet resultSet = checkDuplicateStmt.executeQuery();
                resultSet.next();
                int existingCount = resultSet.getInt(1);

                if (existingCount == 0) { // 중복된 값이 없는 경우에만 INSERT
                    insertStmt.setInt(1, parseInt(ingre_allergy_idx));
                    insertStmt.setInt(2, parseInt(ingre_idx));
                    insertStmt.setInt(3, parseInt(allergy_idx));
                    insertStmt.addBatch();

                    count++;
                    if (count % batchSize == 0) {
                        insertStmt.executeBatch();
                    }
                }
            }
            
            // 남은 데이터 INSERT
            insertStmt.executeBatch();

            // 사용한 리소스를 닫습니다.
            lineReader.close();
            insertStmt.close();
            checkDuplicateStmt.close();
            
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

package com.smhrd.foodie.reader;

import java.io.BufferedReader;
import java.io.FileReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.opencsv.CSVReader;

import static java.lang.Integer.parseInt;

public class CsvReaderRecipe {
    public static void main(String[] args) {
        
        String dbDriver = "com.mysql.cj.jdbc.Driver";
        String jdbcUrl = "jdbc:mysql://project-db-cgi.smhrd.com:3307/campus_24SW_FULL_p2_2";
        String username = "campus_24SW_FULL_p2_2";
        String password = "smhrd2";
        
        String filePath = "C:\\Users\\smhrd\\Desktop\\recipe_info.csv";
        
        // 데이터를 DB에 넣을 때 한 번마다 넣을 수 있는 튜플의 개수 단위 (5개씩 작업)
        // DB에 들어가는 총 데이터(튜플)의 개수가 아님!!!
        int batchSize = 5;
        
        Connection conn = null;
        
        try {
            System.out.println("DB 접속 시도");
            Class.forName(dbDriver);
            conn = DriverManager.getConnection(jdbcUrl, username, password);
            conn.setAutoCommit(false);

            String sqlCheckDuplicate = "SELECT COUNT(*) FROM recipe_info WHERE recipe_idx = ?";
            String sqlInsert = "INSERT INTO recipe_info "
                + "(recipe_idx, recipe_name, recipe_cat, recipe_content, "
                + "recipe_time, recipe_portion, recipe_all_ingre, "
                + "recipe_cook, recipe_title_img) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            
            PreparedStatement checkDuplicateStmt = conn.prepareStatement(sqlCheckDuplicate);
            PreparedStatement insertStmt = conn.prepareStatement(sqlInsert);

            // OpenCSV를 사용하여 CSV 파일 읽기
            CSVReader lineReader = new CSVReader(new FileReader(filePath));
            String[] nextLine = null;
            int count = 0;
            int maxLength = 70;
            lineReader.readNext(); // 첫 번째 행은 헤더이므로 건너뛴다.

            while ((nextLine = lineReader.readNext()) != null && count < maxLength) {
            	System.out.println("DB 데이터 받는 중");
              String recipe_idx = nextLine[0].trim();
              String recipe_name = nextLine[1].trim();
              String recipe_cat = nextLine[2].trim();
              String recipe_content = nextLine[3].trim();
              String recipe_time = nextLine[4].trim();
              String recipe_portion = nextLine[5].trim();
              String recipe_all_ingre = nextLine[6].trim();
              String recipe_cook = nextLine[7].trim();
              String recipe_title_img = "/recipe/" + nextLine[8].trim() + ".jpg";

              // 중복 체크 (ingre_allergy_idx 기준)
              checkDuplicateStmt.setInt(1, parseInt(recipe_idx));
              ResultSet resultSet = checkDuplicateStmt.executeQuery();
              resultSet.next();
              int existingCount = resultSet.getInt(1);

              if (existingCount == 0) { // 중복된 값이 없는 경우에만 INSERT
              	insertStmt.setInt(1, Integer.parseInt(recipe_idx));
              	insertStmt.setString(2, recipe_name);
              	insertStmt.setString(3, recipe_cat);
              	insertStmt.setString(4, recipe_content);
              	insertStmt.setInt(5, Integer.parseInt(recipe_time));
              	insertStmt.setInt(6, Integer.parseInt(recipe_portion));
              	insertStmt.setString(7, recipe_all_ingre);
              	insertStmt.setString(8, recipe_cook);
              	insertStmt.setString(9, recipe_title_img);
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

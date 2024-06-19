package com.smhrd.foodie.reader;

import com.opencsv.CSVReader;
import com.opencsv.exceptions.CsvException;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class CsvReaderRecipe {
    public static void main(String[] args) {
        String dbDriver = "com.mysql.cj.jdbc.Driver";
        String jdbcUrl = "jdbc:mysql://project-db-cgi.smhrd.com:3307/campus_24SW_FULL_p2_2";
        String username = "campus_24SW_FULL_p2_2";
        String password = "smhrd2";

        String filePath = "C:\\Users\\smhrd\\Desktop\\recipe_info.csv";

        Connection conn = null;
        PreparedStatement statement = null;

        try {
            System.out.println("DB 접속 시도");
            Class.forName(dbDriver);
            conn = DriverManager.getConnection(jdbcUrl, username, password);
            conn.setAutoCommit(false);

            String sql = "INSERT INTO recipe_info "
                    + "(recipe_idx, recipe_name, recipe_cat, recipe_content, "
                    + "recipe_time, recipe_portion, recipe_all_ingre, "
                    + "recipe_cook, recipe_title_img) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            statement = conn.prepareStatement(sql);

            // OpenCSV를 사용하여 CSV 파일 읽기
            CSVReader reader = new CSVReader(new FileReader(filePath));
            String[] nextLine;

            // 첫 번째 라인은 헤더이므로 건너뜀
            reader.readNext();

            while ((nextLine = reader.readNext()) != null) {
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

                statement.setInt(1, Integer.parseInt(recipe_idx));
                statement.setString(2, recipe_name);
                statement.setString(3, recipe_cat);
                statement.setString(4, recipe_content);
                statement.setInt(5, Integer.parseInt(recipe_time));
                statement.setInt(6, Integer.parseInt(recipe_portion));
                statement.setString(7, recipe_all_ingre);
                statement.setString(8, recipe_cook);
                statement.setString(9, recipe_title_img);
                statement.addBatch();
            }

            // 배치 실행
            statement.executeBatch();

            // 커밋
            conn.commit();
            System.out.println("DB 데이터 추가 완료");

        } catch (IOException | CsvException | ClassNotFoundException | SQLException e) {
            System.out.println("DB 접속 실패 또는 데이터 처리 오류");
            e.printStackTrace();
        } finally {
            // 리소스 정리
            try {
                if (statement != null) {
                    statement.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}

//package utils;
//
//import java.sql.*;
//import java.util.ArrayList;
//import java.util.LinkedHashMap;
//import java.util.List;
//import java.util.Map;
//
//public class DbUtils {
//
//    private static Connection connection;
//
//    public static Connection connect(String url, String user, String password) {
//        try {
//            if (connection == null || connection.isClosed()) {
//                Class.forName("org.h2.Driver");
//                connection = DriverManager.getConnection(url, user, password);
//                System.out.println("✅ DB Connection successful.");
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//            throw new RuntimeException("❌ Failed to connect to DB: " + e.getMessage());
//        }
//        return connection;
//    }
//
//    public static void closeConnection() {
//        try {
//            if (connection != null && !connection.isClosed()) {
//                connection.close();
//                System.out.println("✅ DB Connection closed.");
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//    }
//
//    public static ResultSet executeQuery(String sql) {
//        try {
//            Statement stmt = connection.createStatement();
//            return stmt.executeQuery(sql);
//        } catch (SQLException e) {
//            throw new RuntimeException("❌ Failed to execute query: " + e.getMessage());
//        }
//    }
//
//    public static int executeUpdate(String sql) {
//        try {
//            Statement stmt = connection.createStatement();
//            return stmt.executeUpdate(sql);
//        } catch (SQLException e) {
//            throw new RuntimeException("❌ Failed to execute update: " + e.getMessage());
//        }
//    }
//    public static List<Map<String, Object>> rows(ResultSet rs) throws SQLException {
//        List<Map<String, Object>> result = new ArrayList<>();
//        ResultSetMetaData meta = rs.getMetaData();
//        int columnCount = meta.getColumnCount();
//
//        while (rs.next()) {
//            Map<String, Object> row = new LinkedHashMap<>();
//            for (int i = 1; i <= columnCount; i++) {
//                row.put(meta.getColumnLabel(i), rs.getObject(i));
//            }
//            result.add(row);
//        }
//
//        return result;
//    }
//
//}

package utils;

import java.sql.*;
import java.util.*;

public class DbUtils {

    public static List<Map<String, Object>> runQuery(String query, String url, String user, String password) throws Exception {
        Class.forName("org.h2.Driver"); // For MySQL: com.mysql.cj.jdbc.Driver
        Connection conn = DriverManager.getConnection(url, user, password);
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(query);

        List<Map<String, Object>> resultList = new ArrayList<>();
        ResultSetMetaData meta = rs.getMetaData();
        int columnCount = meta.getColumnCount();

        while (rs.next()) {
            Map<String, Object> row = new LinkedHashMap<>();
            for (int i = 1; i <= columnCount; i++) {
                row.put(meta.getColumnLabel(i), rs.getObject(i));
            }
            resultList.add(row);
        }

        rs.close();
        stmt.close();
        conn.close();
        return resultList;
    }
}

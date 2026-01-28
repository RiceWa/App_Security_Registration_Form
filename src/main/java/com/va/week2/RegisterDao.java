package com.va.week2;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class RegisterDao {

    private static final String URL  = "jdbc:mariadb://localhost:3306/APPSEC1";
    private static final String USER = "tou";
    private static final String PASS = "123";

    
    private static final String SQL_CHECK_USERID =
            "SELECT 1 FROM registration WHERE userId = ?";

    private static final String SQL_CHECK_EMAIL =
            "SELECT 1 FROM registration WHERE email = ?";

    private static final String SQL_INSERT =
            "INSERT INTO registration " +
            "(userId, password, name, address, country, zip, email, sex, language, about) " +
            "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

    public int registerForm(RegisterForm f) throws ClassNotFoundException {

        Class.forName("org.mariadb.jdbc.Driver");

        try (Connection conn = DriverManager.getConnection(URL, USER, PASS)) {

            if (exists(conn, SQL_CHECK_USERID, f.userId)) {
                return -1;
            }

            if (exists(conn, SQL_CHECK_EMAIL, f.email)) {
                return -2;
            }

            try (PreparedStatement ps = conn.prepareStatement(SQL_INSERT)) {
                ps.setString(1, f.userId);
                ps.setString(2, f.password);
                ps.setString(3, f.name);
                ps.setString(4, f.address);
                ps.setString(5, f.country);
                ps.setString(6, f.zip);
                ps.setString(7, f.email);
                ps.setString(8, f.sex);
                ps.setString(9, f.language);
                ps.setString(10, f.about);

                return ps.executeUpdate();
            }

        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        }
    }

    private boolean exists(Connection conn, String sql, String value) throws SQLException {
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, value);
            try (ResultSet rs = ps.executeQuery()) {
                return rs.next();
            }
        }
    }
}

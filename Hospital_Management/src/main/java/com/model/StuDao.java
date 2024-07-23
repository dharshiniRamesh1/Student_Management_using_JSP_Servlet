package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class StuDao {

    public static List<Student> getRecords(int i, int t) {
        i = i - 1;
        String sql = "SELECT sid, name, city, course, marks FROM Student LIMIT " + i + "," + t;

        List<Student> li = new ArrayList<Student>();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dharshini", "root", "root");
            PreparedStatement pst = con.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                Student s = new Student();
                s.setSid(rs.getInt(1)); 
                s.setName(rs.getString(2));
                s.setCity(rs.getString(3));
                s.setCourse(rs.getString(4));
                s.setMarks(rs.getString(5));
                li.add(s);
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return li;
    }
}



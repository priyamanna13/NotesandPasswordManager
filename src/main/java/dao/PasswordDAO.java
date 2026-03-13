package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.PasswordEntry;

public class PasswordDAO {

    public boolean addPassword(PasswordEntry entry){

        boolean status = false;

        try {

            Connection con = DBConnection.getConnection();

            String sql = "INSERT INTO passwords(application, username, password, user_id) VALUES (?, ?, ?, ?)";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, entry.getApplication());
            ps.setString(2, entry.getUsername());
            ps.setString(3, entry.getPassword());
            ps.setInt(4, entry.getUserId());

            int rows = ps.executeUpdate();

            if(rows > 0){
                status = true;
            }

        } catch(Exception e){
            e.printStackTrace();
        }

        return status;
    }


    public List<PasswordEntry> getPasswordsByUser(int userId){

        List<PasswordEntry> list = new ArrayList<>();

        try {

            Connection con = DBConnection.getConnection();

            String sql = "SELECT * FROM passwords WHERE user_id=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, userId);

            ResultSet rs = ps.executeQuery();

            while(rs.next()){

                PasswordEntry entry = new PasswordEntry();

                entry.setId(rs.getInt("id"));
                entry.setApplication(rs.getString("application"));
                entry.setUsername(rs.getString("username"));
                entry.setPassword(rs.getString("password"));
                entry.setUserId(rs.getInt("user_id"));

                list.add(entry);
            }

        } catch(Exception e){
            e.printStackTrace();
        }

        return list;
    }


    // DELETE PASSWORD METHOD
    public boolean deletePassword(int id){

        boolean status = false;

        try {

            Connection con = DBConnection.getConnection();

            String sql = "DELETE FROM passwords WHERE id=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, id);

            int rows = ps.executeUpdate();

            if(rows > 0){
                status = true;
            }

        } catch(Exception e){
            e.printStackTrace();
        }

        return status;
    }
    public boolean updatePassword(PasswordEntry entry){

        boolean status = false;

        try{

            Connection con = DBConnection.getConnection();

            String sql = "UPDATE passwords SET application=?, username=?, password=? WHERE id=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, entry.getApplication());
            ps.setString(2, entry.getUsername());
            ps.setString(3, entry.getPassword());
            ps.setInt(4, entry.getId());

            int rows = ps.executeUpdate();

            if(rows > 0){
                status = true;
            }

        }catch(Exception e){
            e.printStackTrace();
        }

        return status;
    }
}
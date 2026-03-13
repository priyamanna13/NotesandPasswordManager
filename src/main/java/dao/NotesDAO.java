package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.Note;

public class NotesDAO {

    public boolean addNote(Note note) {

        boolean status = false;

        try {

            Connection con = DBConnection.getConnection();

            String sql = "INSERT INTO notes(title, content, user_id) VALUES (?, ?, ?)";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, note.getTitle());
            ps.setString(2, note.getContent());
            ps.setInt(3, note.getUserId());

            int rows = ps.executeUpdate();

            if(rows > 0) status = true;

        } catch(Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    public boolean deleteNote(int id){

        boolean status=false;

        try{

            Connection con=DBConnection.getConnection();

            String sql="DELETE FROM notes WHERE id=?";

            PreparedStatement ps=con.prepareStatement(sql);

            ps.setInt(1,id);

            int rows=ps.executeUpdate();

            if(rows>0) status=true;

        }catch(Exception e){
            e.printStackTrace();
        }

        return status;
    }
    
    public List<Note> getNotesByUser(int userId){

        List<Note> list = new ArrayList<>();

        try {

            Connection con = DBConnection.getConnection();

            String sql = "SELECT * FROM notes WHERE user_id=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, userId);

            ResultSet rs = ps.executeQuery();

            while(rs.next()){

                Note note = new Note();

                note.setId(rs.getInt("id"));
                note.setTitle(rs.getString("title"));
                note.setContent(rs.getString("content"));
                note.setUserId(rs.getInt("user_id"));

                list.add(note);
            }

        } catch(Exception e){
            e.printStackTrace();
        }

        return list;
    }


public boolean updateNote(Note note){

    boolean status = false;

    try{

        Connection con = DBConnection.getConnection();

        String sql = "UPDATE notes SET title=?, content=? WHERE id=?";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setString(1, note.getTitle());
        ps.setString(2, note.getContent());
        ps.setInt(3, note.getId());

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
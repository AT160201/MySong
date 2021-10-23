/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Natural;
import model.Song;

/**
 *
 * @author ADMIN
 */
public class NaturalDAO extends DBContext1 {

    /**
     *
     * @return
     */
    public List<Natural> getAllNats() {
        List<Natural> list = new ArrayList<>();
        String sql = "Select * from Natural";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Natural(rs.getString("QId"), rs.getString("Name"), rs.getString("img")));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    public Natural getById(String QId){
        String sql="select * from natural";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new Natural(rs.getString("QId"), rs.getString("Name"), rs.getString("img"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
      
        return null;
    }

    public List<Song> getByNatural(String QId) {
        List<Song> list= new ArrayList<>();
        String sql= "Select * from N_S where QId= ?";
        try{
            PreparedStatement st= connection.prepareStatement(sql);
            st.setString(1, QId);
            ResultSet rs= st.executeQuery();
            SongDAO db= new SongDAO();
            while(rs.next()){
                list.add(db.getBySId(rs.getInt("SId")));
            }
        }catch(SQLException ex){
            System.out.println(ex);
        }
        return list;
    }
}

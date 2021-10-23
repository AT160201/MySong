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
import model.CaSi;
import model.Song;
import model.Type;

/**
 *
 * @author ADMIN
 */
public class TypeDAO extends DBContext1 {
    public List<Type> getAll(){
        List<Type> list= new ArrayList<>();
        String sql="select * from type";
        try{
            PreparedStatement st= connection.prepareStatement(sql);
            ResultSet rs= st.executeQuery();
            while(rs.next()){
                list.add(new Type(rs.getString("TId"), rs.getString("Name")));
            }
        }catch(SQLException e){
            System.out.println(e);
        }
        return list;
    }
    
    public List<Song> getByType(String TId){
        List<Song> list= new ArrayList<>();
        String sql="select * from Song as s inner join Type_Song as t on s.SId= t.SId "
                + "inner join CaSi as c on s.CId= c.CId where t.TId=?";
        try{
            PreparedStatement st= connection.prepareStatement(sql);
            st.setString(1, TId);
            ResultSet rs= st.executeQuery();
            while (rs.next()) {
                
                CaSi c= new CaSi();
                c.setNId(rs.getString("CId"));
                c.setName(rs.getString("Cname"));
                c.setImg(rs.getString("Cimg"));
                list.add( new Song(rs.getInt("SId"), rs.getString("name"), rs.getString("mp3"),
                        rs.getInt("luotNghe"), rs.getInt("luotVote"), rs.getString("date"), rs.getString("img"), c));
            }
        }catch(SQLException ex){
            System.out.println(ex);
        }
        return list;
    }
    
    public static void main(String[] args){
        TypeDAO db= new TypeDAO();
        System.out.print(db.getByType("T03").get(2).getName());
    }
}

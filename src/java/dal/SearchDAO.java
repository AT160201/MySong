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

/**
 *
 * @author ADMIN
 */
public class SearchDAO extends DBContext1{
    public List<Song> searchSong(String search){
        List<Song> list= new ArrayList<>();
        String sql="select * from Song as s inner join CaSi as c on s.CId= c.CId where name like N'%"+search+"%'";
        try{
            PreparedStatement st= connection.prepareStatement(sql);
            ResultSet rs= st.executeQuery();
            while(rs.next()){
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
    
    public List<CaSi> searchCaSi(String search){
        List<CaSi> list= new ArrayList<>();
        String sql="select * from CaSi where Cname like N'%"+search+"%'";
         try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new CaSi(rs.getString("CId"), rs.getString("Cname"), rs.getString("Cimg")));
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return list;
    }
    
    public static void main(String[] args){
        SearchDAO sdb= new SearchDAO();
        System.out.println(sdb.searchCaSi("Siro").get(0).getName());
    }
}

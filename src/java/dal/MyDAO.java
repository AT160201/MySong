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
import model.Account;
import model.CaSi;
import model.Song;

/**
 *
 * @author ADMIN
 */
public class MyDAO extends DBContext1{
    
    //MY LIST
    //select My list
    public List<Song> getMyList(Account a){
        List<Song> list= new ArrayList<>();
        String sql="select * from MyList as m inner join Song as s on m.SId= s.SId " +
"inner join CaSi as c on s.CId= c.CId where m.account= '"+ a.getAccount()+"'";
         try {
            PreparedStatement st = connection.prepareStatement(sql);
            
        ResultSet rs = st.executeQuery();
            while (rs.next()) {
                
                CaSi c= new CaSi();
                c.setNId(rs.getString("CId"));
                c.setName(rs.getString("Cname"));
                c.setImg(rs.getString("Cimg"));
                list.add( new Song(rs.getInt("SId"), rs.getString("name"), rs.getString("mp3"),
                        rs.getInt("luotNghe"), rs.getInt("luotVote"), rs.getString("date"), rs.getString("img"), c));
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return list;
    }
    //vote
    public int vote(int SId){
        String sql="update Song set luotVote= luotVote+1 where SId= ?";
        try{
            PreparedStatement st= connection.prepareStatement(sql);
            st.setInt(1,SId);
            return st.executeUpdate();
        }catch(SQLException ex){
            System.out.println(ex);
        }
        return 0;
    }
    //xóa
    public int deleteList(Account a, int SId){
        String sql="delete from MyList where account=? and SId=?";
        try{
            PreparedStatement st= connection.prepareStatement(sql);
            st.setInt(2,SId);
            st.setString(1, a.getAccount());
            return st.executeUpdate();
        }catch(SQLException ex){
            System.out.println(ex);
        }
        return 0;
    }
    //add to list
    public int addList(Account a, int SId){
        String sql="insert into MyList values (?,?)";
        try{
            PreparedStatement st= connection.prepareStatement(sql);
            st.setInt(2,SId);
            st.setString(1, a.getAccount());
            return st.executeUpdate();
        }catch(SQLException ex){
            System.out.println(ex);
        }
        return 0;
    }
    
    //MY SONG
    //select My Song up
    public List<Song> getMySong(Account a){
        List<Song> list= new ArrayList<>();
        String sql="select * from MySongUp as m inner join Song as s on m.SId= s.SId " +
"inner join CaSi as c on s.CId= c.CId where m.account= '"+ a.getAccount()+"'";
         try {
            PreparedStatement st = connection.prepareStatement(sql);
            
        ResultSet rs = st.executeQuery();
            while (rs.next()) {
                
                CaSi c= new CaSi();
                c.setNId(rs.getString("CId"));
                c.setName(rs.getString("Cname"));
                c.setImg(rs.getString("Cimg"));
                list.add( new Song(rs.getInt("SId"), rs.getString("name"), rs.getString("mp3"),
                        rs.getInt("luotNghe"), rs.getInt("luotVote"), rs.getString("date"), rs.getString("img"), c));
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return list;
    }
    
    public static void main(String[] args){
        MyDAO db= new MyDAO();
        System.out.println(db.deleteList(new Account("at", "1234"),1));
}
}

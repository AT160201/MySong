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
public class SongDAO extends DBContext1 {
    //select All
    public List<Song> getAll(){
        List<Song> list= new ArrayList<>();
        String sql = "Select * from Song as s inner join CaSi as c on s.CId= c.CId";
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
    
    //
        public List<Song> getSongByPage(List<Song> list,
            int start,int end){
        List<Song> t=new ArrayList<>();
        for(int i=start;i<end;i++){
            t.add(list.get(i));
        }
        return t;
    }
    
    
//select theo id
    public Song getBySId(int SId) {
        String sql = "Select * from Song as s inner join CaSi as c on s.CId= c.CId where s.SId=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, SId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                CaSi c= new CaSi();
                c.setNId(rs.getString("CId"));
                c.setName(rs.getString("Cname"));
                c.setImg(rs.getString("Cimg"));
                return new Song(rs.getInt("SId"), rs.getString("name"), rs.getString("mp3"),
                        rs.getInt("luotNghe"), rs.getInt("luotVote"), rs.getString("date"), rs.getString("img"), c);
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return null;
    }
// select theo ca si
    public List<Song> getByCId(String CId) {
        List<Song> list = new ArrayList<>();
        String sql = "Select * from Song as s inner join CaSi as c on s.CId= c.CId where s.CId= ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, CId);
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
    
    // nhung bai gan nhat
    public List<Song> getLate(){
        List<Song> list=new ArrayList<>();
        String sql1="Select top 5 * from Song as s inner join CaSi as c on s.CId= c.CId order by date desc";
         try {
            PreparedStatement st = connection.prepareStatement(sql1);
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
    
    //nghe nhiều nhất
    
   public List<Song> NgheNhieu(){
        List<Song> list=new ArrayList<>();
        String sql1="Select top 5 * from Song as s inner join CaSi as c on s.CId= c.CId order by luotNghe desc";
         try {
            PreparedStatement st = connection.prepareStatement(sql1);
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
   //vote nhieu nhat
   
   public List<Song> VoteNhieu(){
        List<Song> list=new ArrayList<>();
        String sql1="Select top 5 * from Song as s inner join CaSi as c on s.CId= c.CId order by luotVote desc";
         try {
            PreparedStatement st = connection.prepareStatement(sql1);
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
   public int getMaxId(){
       String sql= "select max(SId) as SId from Song";
       try{
           PreparedStatement st= connection.prepareStatement(sql);
           ResultSet rs= st.executeQuery();
           if(rs.next()){
               return rs.getInt("SId");
           }
       }catch(SQLException ex){
           System.out.println(ex);
       }return 0;
   } 
   
   
   //update
   public int update(Song s){
       return 0;
   }
   
   //add
   public int add(Song s, Account a){
       String sql="insert into Song values(?,?,?,?,?,?,?,?)";
       try{
           PreparedStatement st= connection.prepareStatement(sql);
           st.setInt(1, s.getSId());
           st.setString(2, s.getName());
           st.setString(3, s.getSinger().getNId());
           st.setString(4, s.getMp3());
           st.setInt(5, s.getLuotNghe());
           st.setInt(6, s.getLuotVode());
           st.setString(7, s.getDate());
           st.setString(8, s.getImg());
           st.executeLargeUpdate();
           
           
       }catch(SQLException ex){
           System.out.print(ex);
       }
       
       String sql1="insert into MySongUp values(?,?)";
       try{
           PreparedStatement st= connection.prepareStatement(sql1);
           st.setString(1, a.getAccount());
           st.setInt(2, s.getSId());
           return st.executeUpdate();
       }catch(SQLException e){
           System.out.println(e);
       }
       
       return 0;
   }
   
   //delete
   public int delete(int SId, Account a){
       
       //xoa bang song-account
       String sql="delete from MySongUp where account=? and SId=?";
        try{
            PreparedStatement st= connection.prepareStatement(sql);
            st.setString(1, a.getAccount());
             st.setInt(2,SId);
            st.executeUpdate();
        }catch(SQLException ex){
            System.out.println(ex);
        }
        
        //xoa song
        String sql1 ="delete from Song where  SId=?";
        try{
            PreparedStatement st= connection.prepareStatement(sql);
            st.setInt(1,SId);
            return st.executeUpdate();
        }catch(SQLException ex){
            System.out.println(ex);
        }
        return 0;
   }
      public static void main(String[] args){
        SongDAO db= new SongDAO();
        System.out.println(db.delete(19,new Account("at", "1234")));
    }
}

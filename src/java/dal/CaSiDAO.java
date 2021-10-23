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

/**
 *
 * @author ADMIN
 */
public class CaSiDAO extends DBContext1 {

    public List<CaSi> getAll() {
        List<CaSi> list = new ArrayList<>();
        String sql = "Select * from CaSi";
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

    public List<CaSi> noiBat() {
        List<CaSi> list = new ArrayList<>();
        String sql = "select * from CaSi where CId in (select top 5 CId from Song  group by CId  order by count(SId) desc)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                list.add(new CaSi(rs.getString("CId"), rs.getString("Cname"), rs.getString("Cimg")));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public CaSi getById(String CId) {
        String sql = "Select * from CaSi where CId=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, CId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new CaSi(CId, rs.getString("Cname"), rs.getString("Cimg"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    
    public CaSi getByName(String name){
        String sql = "Select * from CaSi where Cname=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            ResultSet rs= st.executeQuery();
            return new CaSi(rs.getString("CId"), rs.getString("Cname"), rs.getString("Cimg"));
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    
    public int addNew(CaSi s){
        String sql="insert into CaSi values (?,?,?)";
        try{
            PreparedStatement st= connection.prepareStatement(sql);
            st.setString(1, s.getNId());
            st.setString(2, s.getName());
            st.setString(3, s.getImg());
            return st.executeUpdate();
            
        }catch(SQLException e){
            System.out.println(e);
        }
        return 0;
    }

    public static void main(String[] args) {
        CaSiDAO db = new CaSiDAO();
        System.out.println(db.noiBat().get(0).getImg());
    }
}

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
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import model.Song;

/**
 *
 * @author ADMIN
 */
public class TopDAO extends DBContext1{
     public List<Song> getTopByNatural(String QId) {
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
              //Sắp xếp danh sách theo số điểm giảm dần!
        Collections.sort(list, new Comparator<Song>() {
            @Override
            public int compare(Song sv1, Song sv2) {
                if (sv1.luotVode < sv2.luotVode) {
                    return 1;
                } else {
                    if (sv1.luotVode == sv2.luotVode) {
                        return 0;
                    } else {
                        return -1;
                    }
                }
            }
        });
        }catch(SQLException ex){
            System.out.println(ex);
        }
        
        if(list.size()>=5){
        List<Song> list5= new ArrayList<>();
        list5.add(list.get(0));
        list5.add(list.get(1));
        list5.add(list.get(2));
        list5.add(list.get(3));
        list5.add(list.get(4));
        
        return list5;
        } else return list;
    }
}

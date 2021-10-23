/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import model.Account;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author ADMIN
 */
public class AccountDAO extends DBContext1 {
    //kiem tra tai khoan
    public Account getAccount(String username, String password){
        String sql= "Select * from Account where account= ?"
                + " and password= ?";
        try{
            PreparedStatement st= connection.prepareStatement(sql);
                    st.setString(1, username);
                    st.setString(2, password);
                    ResultSet rs= st.executeQuery();
                    if(rs.next()){
                        return new Account(username, password);
                    }
        }catch(SQLException e){
            System.out.println(e);
        }
        return null;
    }
    public int create(Account a){
        String sql="insert into Account values(?,?)";
        try{
            PreparedStatement st= connection.prepareStatement(sql);
            st.setString(1,a.getAccount());
            st.setString(2, a.getPassword());
            return st.executeUpdate();
        }catch(SQLException e){
            System.out.println(e);
        }
        return 0;
    }
    
    public static void main (String[] args){
        AccountDAO db= new AccountDAO();
        System.out.println(db.create(new Account("fghjk", "1234")));
    }
}

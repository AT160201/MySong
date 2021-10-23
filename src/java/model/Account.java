/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author ADMIN
 */
public class Account {
    private String account, password;

    public Account() {
    }

    public Account(String account, String password) {
        this.account = account;
        this.password = password;
    }


    public String getAccount() {
        return account;
    }

    public String getPassword() {
        return password;
    }


    public void setAccount(String account) {
        this.account = account;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    
}

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
public class Type {
    String TId, name;

    public Type(String TId, String name) {
        this.TId = TId;
        this.name = name;
    }

    public Type() {
    }

    public String getTId() {
        return TId;
    }

    public String getName() {
        return name;
    }

    public void setTId(String TId) {
        this.TId = TId;
    }

    public void setName(String name) {
        this.name = name;
    }
    
}

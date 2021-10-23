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
public class Album {
    private String AId, name,NId, img;

    public Album() {
    }

    public Album(String AId, String name, String NId, String img) {
        this.AId = AId;
        this.name = name;
        this.NId = NId;
        this.img = img;
    }

    public String getAId() {
        return AId;
    }

    public String getName() {
        return name;
    }

    public String getNId() {
        return NId;
    }

    public String getImg() {
        return img;
    }

    public void setAId(String AId) {
        this.AId = AId;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setNId(String NId) {
        this.NId = NId;
    }

    public void setImg(String img) {
        this.img = img;
    }

    
    
}

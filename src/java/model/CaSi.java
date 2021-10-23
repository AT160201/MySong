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
public class CaSi {
    private String NId, name, img;

    public CaSi() {
    }

    public CaSi(String NId, String name, String img) {
        this.NId = NId;
        this.name = name;
        this.img = img;
    }

    public String getNId() {
        return NId;
    }

    public String getName() {
        return name;
    }

    public String getImg() {
        return img;
    }

    public void setNId(String NId) {
        this.NId = NId;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setImg(String img) {
        this.img = img;
    }
    
}

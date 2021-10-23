/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Date;

/**
 *
 * @author ADMIN
 */
public class Song implements java.io.Serializable{

     int SId;
     String name, mp3;
     public int luotNghe, luotVode;
     String date;
     String img;
    CaSi singer;

    public Song() {
    }

    public Song(int SId, String name, String mp3, int luotNghe, int luotVode, String date, String img, CaSi singer) {
        this.SId = SId;
        this.name = name;
        this.mp3 = mp3;
        this.luotNghe = luotNghe;
        this.luotVode = luotVode;
        this.date = date;
        this.img = img;
        this.singer = singer;
    }

    public int getSId() {
        return SId;
    }

    public void setSId(int SId) {
        this.SId = SId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getMp3() {
        return mp3;
    }

    public void setMp3(String mp3) {
        this.mp3 = mp3;
    }

    public int getLuotNghe() {
        return luotNghe;
    }

    public void setLuotNghe(int luotNghe) {
        this.luotNghe = luotNghe;
    }

    public int getLuotVode() {
        return luotVode;
    }

    public void setLuotVode(int luotVode) {
        this.luotVode = luotVode;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public CaSi getSinger() {
        return singer;
    }

    public void setSinger(CaSi singer) {
        this.singer = singer;
    }
    
}

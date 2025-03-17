/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Entity;

/**
 *
 * @author Admin
 */
public class Chef {
    private int chefId;
    private String chefName;
    private String chefAge;
    private String chefNation;
    private String chefAchi;
    private String chefSpec;
    private String chefImg;
    private String facebook;
    private String instagram;
    private String twitter;
    private String linkin;


    public Chef() {
    }

    public Chef(int chefId, String chefName, String chefAge, String chefNation, String chefAchi, String chefSpec, String chefImg, String facebook, String instagram, String twitter, String linkin) {
        this.chefId = chefId;
        this.chefName = chefName;
        this.chefAge = chefAge;
        this.chefNation = chefNation;
        this.chefAchi = chefAchi;
        this.chefSpec = chefSpec;
        this.chefImg = chefImg;
        this.facebook = facebook;
        this.instagram = instagram;
        this.twitter = twitter;
        this.linkin = linkin;
    }

    public int getChefId() {
        return chefId;
    }

    public void setChefId(int chefId) {
        this.chefId = chefId;
    }

    public String getChefName() {
        return chefName;
    }

    public void setChefName(String chefName) {
        this.chefName = chefName;
    }

    public String getChefAge() {
        return chefAge;
    }

    public void setChefAge(String chefAge) {
        this.chefAge = chefAge;
    }

    public String getChefNation() {
        return chefNation;
    }

    public void setChefNation(String chefNation) {
        this.chefNation = chefNation;
    }

    public String getChefAchi() {
        return chefAchi;
    }

    public void setChefAchi(String chefAchi) {
        this.chefAchi = chefAchi;
    }

    public String getChefSpec() {
        return chefSpec;
    }

    public void setChefSpec(String chefSpec) {
        this.chefSpec = chefSpec;
    }

    public String getChefImg() {
        return chefImg;
    }

    public void setChefImg(String chefImg) {
        this.chefImg = chefImg;
    }

    public String getFacebook() {
        return facebook;
    }

    public void setFacebook(String facebook) {
        this.facebook = facebook;
    }

    public String getInstagram() {
        return instagram;
    }

    public void setInstagram(String instagram) {
        this.instagram = instagram;
    }

    public String getTwitter() {
        return twitter;
    }

    public void setTwitter(String twitter) {
        this.twitter = twitter;
    }

    public String getLinkin() {
        return linkin;
    }

    public void setLinkin(String linkin) {
        this.linkin = linkin;
    }
    
    
    
}

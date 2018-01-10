package com.codeup.adlister.dao;

public class Config {

    private String url = "jdbc:mysql://localhost/adlister_db";
    private String user = "adlisteruser";
    private String password = "adlisterpassword";

    public String getUrl() {
        return url;
    }

    public String getUser() {
        return user;
    }

    public String getPassword() {
        return password;
    }
}
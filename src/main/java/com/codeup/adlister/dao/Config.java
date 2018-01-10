package com.codeup.adlister.dao;

public class Config {

    private String url = "jdbc:mysql://localhost/adlister_db";
    private String user = "root";
    private String password = "codeup";

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
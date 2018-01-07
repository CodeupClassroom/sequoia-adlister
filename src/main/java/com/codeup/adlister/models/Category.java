package com.codeup.adlister.models;

public class Category {
    private long id;
    private String classification;

    public Category() {}

    public Category(long id, String classification) {
        this.id = id;
        this.classification = classification;
    }

    public long getId () {
        return id;
    }

    public String getClassification() {
        return classification;
    }
}
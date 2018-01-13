package com.codeup.adlister.models;

import java.util.List;

public class Ad {
    private long id;
    private long userId;
    private String title;
    private String description;
    private String dateCreated;
    private String dateUpdated;
    private String adLocation;
    private boolean active;
    private List<String> categories;

    public Ad(long id, long userId, String title, String description, String dateCreated, String dateUpdated, String adLocation, List<String> categories) {
        this.id = id;
        this.userId = userId;
        this.title = title;
        this.description = description;
        this.dateCreated = dateCreated;
        this.dateUpdated = dateUpdated;
        this.adLocation = adLocation;
        this.categories = categories;
    }

    public Ad(long id, long userId, String title, String description, String dateCreated, String adLocation) {
        this.id = id;
        this.userId = userId;
        this.title = title;
        this.description = description;
        this.dateCreated = dateCreated;
        this.adLocation = adLocation;

    }

    public Ad(long userId, String title, String description, String adLocation) {
        this.userId = userId;
        this.title = title;
        this.description = description;
        this.adLocation = adLocation;
    }

    public List<String> getCategories() {
        return categories;
    }

    public void setCategories(List<String> categories) {
        this.categories = categories;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getUserId() {
        return userId;
    }

    public void setUserId(long userId) {
        this.userId = userId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getDateCreated() {
        return dateCreated;
    }

    public void setDateCreated(String dateCreated) {
        this.dateCreated = dateCreated;
    }

    public String getDateUpdated() {
        return dateUpdated;
    }

    public void setDateUpdated(String dateUpdated) {
        this.dateUpdated = dateUpdated;
    }

    public String getAdLocation() {
        return adLocation;
    }

    public void setAdLocation(String adLocation) {
        this.adLocation = adLocation;
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }
}

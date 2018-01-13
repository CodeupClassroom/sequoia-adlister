package com.codeup.adlister.dao;

public class DaoFactory {
    private static Ads adsDao;
    private static Users usersDao;
    private static Categories adsCategoriesDao;
    private static Config config = new Config();

    public static int hashNumberOfRounds = 12;

    public static Ads getAdsDao() {
        if (adsDao == null) {
            adsDao = new MySQLAdsDao(config);
        }
        return adsDao;
    }

    public static Users getUsersDao() {
        if (usersDao == null) {
            usersDao = new MySQLUsersDao(config);
        }
        return usersDao;
    }

    public static Categories getAdsCategoriesDao() {
        if (adsCategoriesDao == null) {
            adsCategoriesDao = new MySQLAdsCategoriesDao(config);
        }
        return adsCategoriesDao;
    }
}

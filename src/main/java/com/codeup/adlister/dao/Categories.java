package com.codeup.adlister.dao;

import java.util.List;

public interface Categories {
    List<String> getCategories();
    List<Long> getRequestedCatergoryIds(List<String> categoryNames);
    Long insertAdsCategories(Long adId, List<Long> catIds);
}

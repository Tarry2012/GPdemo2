package service;

import common.Page;
import domain.Restaurant;

import java.util.List;

/**
 * Created by tqy on 16/3/16.
 */
public interface RestaurantService {
    String STRING_NAME = "restaurantService";
    List<Restaurant> findRestaurants();

    List<Restaurant> findRestaurantsWithPage(Page page);

    List<Restaurant> findRestaurantByKind(String restaurantMain);

}

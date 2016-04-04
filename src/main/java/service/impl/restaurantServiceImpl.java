package service.impl;

import common.Page;
import dao.RestaurantDAO;
import domain.Restaurant;
import org.springframework.stereotype.Service;
import service.RestaurantService;
import javax.annotation.Resource;
import java.util.List;


/**
 * Created by tqy on 16/3/16.
 */
@Service(RestaurantService.STRING_NAME)
public class restaurantServiceImpl implements RestaurantService {
    @Resource
    RestaurantDAO restaurantDAO;
    public List<Restaurant> findRestaurants(){
        return  this.restaurantDAO.findRestaurants();
    }

    public List<Restaurant> findRestaurantsWithPage(Page page){
        return this.restaurantDAO.findRestaurantsWithPage(page);
    }

    public List<Restaurant> findRestaurantByKind(String restaurantMain){
        return this.restaurantDAO.findRestaurantByKind(restaurantMain);
    }
}

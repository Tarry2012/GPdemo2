package service;

import dao.UserAuthsDAO;
import domain.UserAuthsDO;

import java.util.Map;

/**
 * Created by tqy on 16/4/6.
 */
public interface UserAuthsService {
    public static final String STRING_NANE = "userAuthsService";
    UserAuthsDO getById(Map paramMap);
}

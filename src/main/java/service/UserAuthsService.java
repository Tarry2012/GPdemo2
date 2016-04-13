package service;

import dao.UserAuthsDAO;
import domain.UserAuthsDO;

import java.util.List;
import java.util.Map;

/**
 * Created by tqy on 16/4/6.
 */
public interface UserAuthsService {
    public static final String STRING_NANE = "userAuthsService";

    List getMails();
    boolean add(UserAuthsDO userAuthsDO);
    UserAuthsDO getByName(String loginName);
}

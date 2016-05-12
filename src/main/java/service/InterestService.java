package service;

import domain.InterestDO;

/**
 * Created by songrunyu on 16-5-12.
 */
public interface InterestService {
    public  static final String SPRING_NAME = "interestService";


    Integer add(InterestDO interestDO);
}

package service.impl;

import dao.InterestDAO;
import domain.InterestDO;
import org.springframework.stereotype.Service;
import service.InterestService;

import javax.annotation.Resource;

/**
 * Created by songrunyu on 16-5-12.
 */
@Service(InterestService.SPRING_NAME)
public class InterestServiceImpl implements  InterestService {

    @Resource
    private InterestDAO interestDAO;

    public Integer add(InterestDO interestDO)
    {
        this.interestDAO.add(interestDO);
        return interestDO.getId();
    }

}

package common.interceptor;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Created by tqy on 16/4/25.
 */
public class AuthInterceptor implements HandlerInterceptor {
    private static Logger logger = Logger.getLogger(AuthInterceptor.class);
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        //获取url地址
        String reqUrl = httpServletRequest.getRequestURI().replace(httpServletRequest.getContextPath(), "");
        //当url地址为登录地址或者主页时跳过拦截器
        if (reqUrl.contains("userLogin") || reqUrl.contains("userLogout") || reqUrl.contains("userRegister") || reqUrl.contains("userIsExist")
                || reqUrl.contains("mailIsExist") || reqUrl.contains("video/indexVideo") || reqUrl.contains("video/hotVideo")){
            return true;
        }else{
            HttpSession session = httpServletRequest.getSession();
            //为了调试，先把session验证去掉
            session.setAttribute("username", "hello");
            String obj = (String)session.getAttribute("username");
            if (StringUtils.isEmpty(obj)){

                logger.warn("未登录的: " + reqUrl);
                  httpServletResponse.sendRedirect(httpServletRequest.getContextPath() + "/jsp/user/userLogin.jsp");
                  return false;
            }else{
                return true;
            }
        }
    }

    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}

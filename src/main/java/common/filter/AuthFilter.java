package common.filter;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by tqy on 16/4/25.
 */
public class AuthFilter  implements Filter{
    Logger logger = Logger.getLogger(AuthFilter.class);

    public void init(FilterConfig filterConfig) throws ServletException {
        logger.warn("filter start");
    }

    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest httpServletRequest = (HttpServletRequest) servletRequest;
        HttpServletResponse httpServletResponse = (HttpServletResponse) servletResponse;
        HttpSession httpSession =  httpServletRequest.getSession();
        String reqUrl = httpServletRequest.getRequestURI();
        if(reqUrl.contains("index.jsp")){
            filterChain.doFilter(servletRequest, servletResponse);
        }
        if (reqUrl.endsWith(".png") || reqUrl.endsWith(".css") || reqUrl.endsWith(".js") || reqUrl.endsWith(".jpg")){
            filterChain.doFilter(servletRequest,servletResponse);
        }
        //判断用户是否登录，进行页面的处理
        //为了调式，先把session验证去掉了
        httpSession.setAttribute("username", "test7");
        String session = (String)httpSession.getAttribute("username");
        if(StringUtils.isEmpty(session)){
            //未登录用户，重定向到登录页面
             httpServletResponse.sendRedirect(httpServletRequest.getContextPath() + "/jsp/user/userLogin.jsp");
        } else {
            //已登录用户，允许访问
            filterChain.doFilter(servletRequest, servletResponse);
        }
    }

    public void destroy() {

    }
}

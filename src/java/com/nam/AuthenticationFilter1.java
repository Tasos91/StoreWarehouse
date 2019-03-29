package com.nam;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Tasos
 */
public class AuthenticationFilter1 implements Filter{

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        Filter.super.init(filterConfig); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        
        HttpServletRequest req = (HttpServletRequest)request;
        HttpServletResponse res= (HttpServletResponse)response;
        String uri = req.getRequestURI();
        HttpSession session=req.getSession();
        
        if(session.getAttribute("id")==null && (!uri.endsWith("loginSetEmpty.htm") && !uri.endsWith("handleLogin.htm") )){
            
            res.sendRedirect("loginSetEmpty.htm");
            
        }
        
        else{
            chain.doFilter(request, response);
            
        }
    }

    @Override
    public void destroy() {
        Filter.super.destroy(); //To change body of generated methods, choose Tools | Templates.
    }
    
}

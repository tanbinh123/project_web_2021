package vn.edu.topedu.jwt.security;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.filter.OncePerRequestFilter;

import vn.edu.topedu.dao.AppUserDAO;
import vn.edu.topedu.entity.AppUser;

/**
 * Created by fan.jin on 2016-10-19.
 */
public class TokenAuthenticationFilter extends OncePerRequestFilter {

   
	//@Autowired
    private JWTUtil jwtUtil;
    //@Autowired
    private AppUserDAO appUserDAO;
    public TokenAuthenticationFilter(JWTUtil jwtUtil,AppUserDAO appUserDAO) {
		this.jwtUtil=jwtUtil;
		this.appUserDAO=appUserDAO;
	}

    @Override
    public void doFilterInternal(
            HttpServletRequest request,
            HttpServletResponse response,
            FilterChain chain
    ) throws IOException, ServletException {
        String username =null;
        String authToken = jwtUtil.getToken(request);
        
        if (authToken != null) {
            // get username from token
        	
        	try {
        		username = jwtUtil.getUsernameFromToken(authToken);
				
			} catch (Exception e) {
				//System.out.println("catch jwt error");
			}
            if (username != null) {
                // get user
               AppUser a = appUserDAO.findUserAccount(username);
                if (jwtUtil.validateToken(authToken)) {
                    // create authentication
                	TokenBasedAuthentication authentication = new TokenBasedAuthentication(a);
                	authentication.setToken(authToken);
                	SecurityContextHolder.getContext().setAuthentication(authentication);
                	
                }
            }
        }
        chain.doFilter(request, response);
    }
   

}
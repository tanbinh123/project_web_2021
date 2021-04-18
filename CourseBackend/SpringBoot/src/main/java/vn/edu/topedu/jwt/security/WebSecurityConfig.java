package vn.edu.topedu.jwt.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.www.BasicAuthenticationFilter;

import vn.edu.topedu.dao.AppUserDAO;


@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
	
	@Autowired
	private RestAuthenticationEntryPoint restAuthenticationEntryPoint;

	@Autowired
	JWTUtil jwtUtil;
	 @Autowired
	    AppUserDAO appUserDAO;

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		 //JWTUtil jwtUtil= new JWTUtil();
		http.sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS).and().exceptionHandling()
				.authenticationEntryPoint(restAuthenticationEntryPoint).and().authorizeRequests()
				.antMatchers(HttpMethod.GET, "/", "/auth/**", "/webjars/**", "/*.html", "/favicon.ico", "/**/*.html",
						"/**/*.css", "/**/*.js")
				.permitAll().antMatchers("/login").permitAll().antMatchers("/signup").permitAll()
				.antMatchers("/resource/**").permitAll().antMatchers("/course/**").permitAll()
				.antMatchers("/forgotpassword/**").permitAll()
				.antMatchers("/pay/**").permitAll()
				.antMatchers("/test/**").permitAll()
				.antMatchers("/video/**").permitAll()
				.antMatchers("/stream/**").permitAll()
				.antMatchers("/")
				.permitAll().antMatchers("/mail/**").denyAll().antMatchers("/auth/**").permitAll().anyRequest()
				.authenticated().and()
				.addFilterBefore(new TokenAuthenticationFilter(jwtUtil,appUserDAO), BasicAuthenticationFilter.class);

		http.csrf().disable();
	}

	@Override
	public void configure(WebSecurity web) throws Exception {
		// TokenAuthenticationFilter will ignore the below paths
		web.ignoring().antMatchers(HttpMethod.POST, "/auth/login");
		web.ignoring().antMatchers(HttpMethod.GET, "/", "/webjars/**", "/*.html", "/favicon.ico", "/**/*.html",
				"/**/*.css", "/**/*.js");

	}
}

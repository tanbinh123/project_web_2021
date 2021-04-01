package vn.edu.topedu.jwt.security;

import java.security.Key;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.ExpiredJwtException;
import io.jsonwebtoken.Jws;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.MalformedJwtException;
import io.jsonwebtoken.UnsupportedJwtException;
import io.jsonwebtoken.security.Keys;
import io.jsonwebtoken.security.SignatureException;
import vn.edu.topedu.entity.AppUser;

@Component
public class JWTUtil {

	@Value("${springbootwebfluxjjwt.jjwt.secret}")
	private String secret;

	@Value("${springbootwebfluxjjwt.jjwt.expiration}")
	private String expirationTime;

	private Key key;

	@PostConstruct
	public void init() {
		this.key = Keys.hmacShaKeyFor(secret.getBytes());
	}

	public Claims getAllClaimsFromToken(String token) throws ExpiredJwtException, UnsupportedJwtException, MalformedJwtException, SignatureException, IllegalArgumentException  {
		Jws<Claims> jws;
		jws = Jwts.parserBuilder().setSigningKey(key).build().parseClaimsJws(token);
		return jws.getBody();

	}

	public String getUsernameFromToken(String token) throws ExpiredJwtException, UnsupportedJwtException, MalformedJwtException, SignatureException, IllegalArgumentException {
		return getAllClaimsFromToken(token).getSubject();
	}

	public Date getExpirationDateFromToken(String token) throws ExpiredJwtException, UnsupportedJwtException, MalformedJwtException, SignatureException, IllegalArgumentException  {
		return getAllClaimsFromToken(token).getExpiration();
	}

	private Boolean isTokenExpired(String token) throws ExpiredJwtException, UnsupportedJwtException, MalformedJwtException, SignatureException, IllegalArgumentException {
		final Date expiration = getExpirationDateFromToken(token);
		return expiration.before(new Date());
	}

	public String generateToken(AppUser user) {
		Map<String, Object> claims = new HashMap<>();
		// claims.put("role", appRoleDAO.getRoleNames(user.getUserId()));
		return doGenerateToken(claims, user.getUserName());
	}

	private String doGenerateToken(Map<String, Object> claims, String username) {
		Long expirationTimeLong = Long.parseLong(expirationTime); // in second

		final Date createdDate = new Date();
		final Date expirationDate = new Date(createdDate.getTime() + expirationTimeLong * 1000);

		return Jwts.builder().setClaims(claims).setSubject(username).setIssuedAt(createdDate)
				.setExpiration(expirationDate).signWith(key).compact();
	}

	public Boolean validateToken(String token) throws ExpiredJwtException, UnsupportedJwtException, MalformedJwtException, SignatureException, IllegalArgumentException {
		return !isTokenExpired(token);
	}

	public String getToken(HttpServletRequest request) {

		String authHeader = getAuthHeaderFromHeader(request);
		if (authHeader != null && authHeader.startsWith("Bearer ")) {
			return authHeader.substring(7);
		}

		return null;
	}

	public String getAuthHeaderFromHeader(HttpServletRequest request) {
		return request.getHeader("Authorization");
	}

}

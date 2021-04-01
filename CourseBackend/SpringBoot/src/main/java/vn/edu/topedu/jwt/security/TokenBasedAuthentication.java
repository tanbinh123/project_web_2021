package vn.edu.topedu.jwt.security;

import org.springframework.security.authentication.AbstractAuthenticationToken;

import vn.edu.topedu.entity.AppUser;


public class TokenBasedAuthentication extends AbstractAuthenticationToken {

    private String token;
    private final AppUser principle;
   
    public TokenBasedAuthentication( AppUser principle ) {
        super(principle.getAuthorities());
        //System.out.println(principle.getAuthorities().size());
        this.principle = principle;
    }

    public String getToken() {
        return token;
    }

    public void setToken( String token ) {
        this.token = token;
    }

    @Override
    public boolean isAuthenticated() {
        return true;
    }

    @Override
    public Object getCredentials() {
        return token;
    }

	@Override
	public Object getPrincipal() {
		return principle;
	}

   
}

package vn.edu.topedu.rest;

import javax.servlet.http.HttpServletRequest;

public interface IMyHost {
	
	public default String getUrl(HttpServletRequest httpServletRequest) {
		return String.format("%s://%s:%d/", httpServletRequest.getScheme(),httpServletRequest.getServerName(),httpServletRequest.getServerPort());
	}

}

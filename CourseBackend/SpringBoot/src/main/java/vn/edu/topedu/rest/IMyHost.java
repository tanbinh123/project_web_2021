package vn.edu.topedu.rest;

import javax.servlet.http.HttpServletRequest;

import vn.edu.topedu.consts.VariableConst;

public interface IMyHost {
	public default String getUrlResource(HttpServletRequest httpServletRequest) {
		return String.format("%s://%s:%d/", httpServletRequest.getScheme(),httpServletRequest.getServerName(),httpServletRequest.getServerPort())+VariableConst.RESOURCE_BEFORE;
	}

}

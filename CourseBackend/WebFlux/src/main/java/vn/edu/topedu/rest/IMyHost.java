package vn.edu.topedu.rest;

import org.springframework.http.server.reactive.ServerHttpRequest;

import vn.edu.topedu.consts.VariableConst;

public interface IMyHost {
	public default String getUrlResource(ServerHttpRequest serverHttpRequest) {
		return String.format("%s://%s:%d/", serverHttpRequest.getURI().getScheme(),serverHttpRequest.getURI().getHost(),serverHttpRequest.getURI().getPort())+VariableConst.RESOURCE_BEFORE;
	}

}

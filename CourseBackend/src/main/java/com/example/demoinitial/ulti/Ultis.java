package com.example.demoinitial.ulti;

import com.example.demoinitial.entity.Account;

import fileprocess.FileProcess;

public class Ultis {
	public static void encodeBase64Avatar(Account in) {
		if(in==null) {
			return ;
		}
		in.avatar="data:image/png;base64,"+FileProcess.encodeFileToBase64(in.avatar);
	}

}

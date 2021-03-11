package com.example.demoinitial.rest;



import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.WebSession;

import com.example.demoinitial.config.consts.VariableConst;
import com.example.demoinitial.dao.AccountDAO;
import com.example.demoinitial.entity.Account;
import com.example.demoinitial.form.LoginForm;
import com.fasterxml.jackson.core.JsonProcessingException;

import json.object.ResponseMessageSuccess;
import json.object.ResponseNull;
import response.AccountJson;


@RestController
public class AuthenticationController {
	@Autowired
	AccountDAO accountDAO;
	
	@RequestMapping(value = "api/login" , method=RequestMethod.GET,produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String gLogin( WebSession session ) throws JsonProcessingException {		
		Integer idAccount= (Integer)session.getAttribute(VariableConst.CURRENT_ID_ACCOUNT);	
		if(idAccount==null)return new ResponseNull().toJsonString();
		Account account=accountDAO.getAccount(idAccount);
		
		return account.toAccountJson().toJsonString();
	}
	@RequestMapping(value = "api/logout" , method=RequestMethod.GET,produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String gLogout(WebSession session) {		
		session.getAttributes().remove(VariableConst.CURRENT_ID_ACCOUNT);
		return new ResponseMessageSuccess().toJsonString();
	}
//	
//	
	@RequestMapping(value = "api/login", method=RequestMethod.POST,produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String pLogin(WebSession session,@RequestBody  LoginForm form) {
		System.out.println(form);
		Account account=accountDAO.login(form.getUsername(), form.getPassword());
		if(account==null)return new ResponseNull().toJsonString();
		session.getAttributes().put(VariableConst.CURRENT_ID_ACCOUNT,account.id);
		return account.toAccountJson().toJsonString();
	}
	@RequestMapping(value = "api/account-history" , method=RequestMethod.GET)
	@ResponseBody
	public List<AccountJson> accountHistory(WebSession session) {
		List<Integer> historyId =(List<Integer>)session.getAttribute(VariableConst.LOGIN_HISTORY);
		if(historyId==null)return new ArrayList<AccountJson>();
		List<AccountJson> historyAccount=new ArrayList<>();
		for(Account a:accountDAO.getAccounts(historyId)) {
			historyAccount.add(a.toAccountJson());
		}
		
		
		return historyAccount;
	}
	
	
}

package com.example.demoinitial.rest;



import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;

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

import model.Greeting;
import response.AccountJson;


@RestController
public class AuthorizationController {
	@Autowired
	AccountDAO accountDAO;
//	
	@RequestMapping(value = "api/login" , method=RequestMethod.GET)
	@ResponseBody
	public AccountJson gLogin(WebSession session) {		
		Integer idAccount=(Integer)session.getAttribute(VariableConst.CURRENT_ID_ACCOUNT);	
		if(idAccount==null)return new AccountJson();
		Account account=accountDAO.getAccount(idAccount);
		
		return account.toAccountJson();
	}
	@RequestMapping(value = "api/logout" , method=RequestMethod.GET)
	@ResponseBody
	public void gLogout(WebSession session) {		
		session.getAttributes().remove(VariableConst.CURRENT_ID_ACCOUNT);
	
	}
//	
//	
	@RequestMapping(value = "api/login", method=RequestMethod.POST)
	@ResponseBody
	public AccountJson pLogin(WebSession session,@RequestBody  LoginForm form) {
		System.out.println(form);
		Account account=accountDAO.login(form.getUsername(), form.getPassword());
		
		session.getAttributes().put(VariableConst.CURRENT_ID_ACCOUNT,account.id);
		if(form.isRememberMe()) {
			List<Integer> historyId =(List<Integer>)session.getAttribute(VariableConst.LOGIN_HISTORY);
			if(historyId==null) {
				historyId =new ArrayList<Integer>();
			}
			historyId.add(account.id);
			session.getAttributes().put(VariableConst.LOGIN_HISTORY,historyId);
		}
		return account.toAccountJson();
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
	@RequestMapping(value = "/" , method=RequestMethod.GET)
	@ResponseBody
	public Greeting accountHistory() {
		return new Greeting(1, "Hoang");
	}
}

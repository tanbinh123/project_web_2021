package com.example.demoinitial.dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.example.demoinitial.entity.Account;

@Repository
@Transactional
public class AccountDAO {
	@PersistenceContext
	private EntityManager entityManager;

	public Account getAccount(int id) {

		try {
			String sql = "Select a from " + Account.class.getName() + " a " //
					+ " Where a.id = :id";

			Query query = entityManager.createQuery(sql, Account.class);
			query.setParameter("id", id);

			return (Account) query.getSingleResult();
		} catch (NoResultException e) {
			return null;
		}
	}

	public Account login(String username, String password) {

		try {
			String sql = "Select a from " + Account.class.getName() + " a " //
					+ " Where a.username = :username and a.password = :password";

			Query query = entityManager.createQuery(sql, Account.class);
			query.setParameter("username", username);
			query.setParameter("password", password);

			return (Account) query.getSingleResult();
		} catch (NoResultException e) {
			return null;
		}
	}
	
	public List<Account> getAccounts(List<Integer> historyId) {

		try {
			String sql = "Select a from " + Account.class.getName() + " a " //
					+ " Where a.id = :id";

			Query query = entityManager.createQuery(sql, Account.class);
			 List<Account> historyAccount= new ArrayList<>();
			 Account account=null;
			 for(Integer id: historyId) {
				query.setParameter("id", id);
				account=(Account) query.getSingleResult();
				historyAccount.add(account);
			}
			 

			return historyAccount;
		} catch (NoResultException e) {
			return null;
		}
	}
}

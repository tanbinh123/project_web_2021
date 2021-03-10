package com.example.demoinitial.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import fileprocess.FileProcess;
import response.AccountJson;

@Entity
@Table(name = "accounts")
public class Account {
	@Id
    @GeneratedValue
    @Column(name = "id", nullable = false)
	public int id;
	@Column(name = "username", nullable = false)
    public String username;
	@Column(name = "password", nullable = false)
    public String password;
	@Column(name = "email", nullable = true)
    public String email;
	@Column(name = "active", nullable = false)
    public int active;
	@Column(name = "delete", nullable = false)
    public int delete;
	@Column(name = "level", nullable = false)
    public int level ;
	@Column(name = "avatar", nullable = true)
    public String avatar ;
	
	public AccountJson toAccountJson() {
		AccountJson accountJson= new AccountJson();
		accountJson.setId(this.id);
		accountJson.setLevel(this.level);
		accountJson.setPassword(this.password);
		accountJson.setUsername(this.username);
		accountJson.setAvatar(FileProcess.SRC_IMAGE_BEFORE+FileProcess.encodeFileToBase64(this.avatar));
		return accountJson;
	}
}

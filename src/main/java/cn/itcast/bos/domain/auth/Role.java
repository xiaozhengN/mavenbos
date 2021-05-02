package cn.itcast.bos.domain.auth;

import java.util.HashSet;
import java.util.Set;

import cn.itcast.bos.domain.user.User;

/**
 * 系统角色
 * 
 * @author seawind
 * 
 */
public class Role {
	private String id; // uuid
	private String name; // 角色名称
	private String description; // 角色描述

	// 关联Function
	private Set<Function> functions = new HashSet<Function>();

	// 关联user
	private Set<User> users = new HashSet<User>();

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Set<Function> getFunctions() {
		return functions;
	}

	public void setFunctions(Set<Function> functions) {
		this.functions = functions;
	}

	public Set<User> getUsers() {
		return users;
	}

	public void setUsers(Set<User> users) {
		this.users = users;
	}

}

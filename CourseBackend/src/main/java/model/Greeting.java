package model;

import json.object.JsonResponse;

public class Greeting extends JsonResponse {
	private final int id;
	private final String name;
	public Greeting(int id, String name) {
		super();
		this.id = id;
		this.name = name;
	}
	public int getId() {
		return id;
	}
	public String getName() {
		return name;
	}
	

}

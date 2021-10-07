package com.gaudetb.ninjagoldgame.models;

public class Message {
	private String color;
	private String message;
	
	
	
	/**
	 * @param color
	 * @param message
	 */
	public Message(String color, String message) {
		this.color = color;
		this.message = message;
	}
	/**
	 * @return the color
	 */
	public String getColor() {
		return color;
	}
	/**
	 * @param color the color to set
	 */
	public void setColor(String color) {
		this.color = color;
	}
	/**
	 * @return the message
	 */
	public String getMessage() {
		return message;
	}
	/**
	 * @param message the message to set
	 */
	public void setMessage(String message) {
		this.message = message;
	}

}

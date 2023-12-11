package com.pingosystem.course.entities.enums;

import org.aspectj.weaver.ast.Or;

public enum OrderStatus {

	WAITTING_PAYMENT(1),
	PAID(2),
	SHIPPED(2),
	DELIVERED(4),
	CANCELED(5);
	
	private int code;
	
	private OrderStatus(int code) {
		this.code = code;
	}
	
	public int getCode() {
		return code;
	}
	
	//return string value of send code == 1 -> WAITTING_PAYMENT
	public static OrderStatus valueOf(int code) {
		for (OrderStatus value : OrderStatus.values()) {
			if (value.getCode() == code) {
				return value;
			}
		}
		
		throw new IllegalArgumentException("Invalid OrderStatus code");
	}
}

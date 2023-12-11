package com.pingosystem.course.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.pingosystem.course.entities.OrderItem;

public interface OrderItemRepository extends JpaRepository<OrderItem, Long> {
	
}

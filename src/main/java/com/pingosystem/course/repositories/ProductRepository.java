package com.pingosystem.course.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.pingosystem.course.entities.Product;

public interface ProductRepository extends JpaRepository<Product, Long> {
	
}

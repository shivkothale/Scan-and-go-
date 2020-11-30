package com.shopable.scanandgo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan({"com.shopable.controller","com.shopable.model","com.shopable.Dao","com.shopable.service"})
public class ProjecctApplication {

	public static void main(String[] args) {
		SpringApplication.run(ProjecctApplication.class, args);
	}

}

package com.oferr.ppcdb;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;


@SpringBootApplication
public class PpcdbApplication extends SpringBootServletInitializer  {

	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(PpcdbApplication.class);
	}

	
	private static final Logger logger = LoggerFactory.getLogger(PpcdbApplication.class);

	public static void main(String[] args) throws Exception {
		SpringApplication.run(PpcdbApplication.class, args);
		
		logger.info("Hello Spring Boot");
	}
	

}

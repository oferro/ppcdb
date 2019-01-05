package com.oferr.ppcdb;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.Bean;

import com.oferr.ppcdb.domain.Flight;
import com.oferr.ppcdb.domain.FlightRepository;
import com.oferr.ppcdb.domain.Pilot;
import com.oferr.ppcdb.domain.PilotRepository;
import com.oferr.ppcdb.domain.Ppc;
import com.oferr.ppcdb.domain.PpcRepository;

import java.math.BigDecimal;
import java.sql.Time;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.Date;
import java.util.Optional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


@SpringBootApplication
public class PpcdbApplication extends SpringBootServletInitializer  {

	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(PpcdbApplication.class);
	}

	
	@Autowired
	private PpcRepository ppRepository;
	
	@Autowired
	private PilotRepository piRepository;
	
	@Autowired
	private FlightRepository flRepository;
	
	private static final Logger logger = LoggerFactory.getLogger(PpcdbApplication.class);

	public static void main(String[] args) throws Exception {
		SpringApplication.run(PpcdbApplication.class, args);
		
		logger.info("Hello Spring Boot");
	}
	
//	@Bean
//	CommandLineRunner runner() {
//		return args -> {
//			Pilot ofer = new Pilot("o@b.com", "1", "Ofer", "Rotshtein", "0542555137", null, null);
//			piRepository.save(ofer);
//			
//			Ppc ppc1 = new Ppc("ppcOfer1", "SixShuter", "582 blue", 10.0, 45.0, ofer ,false );
//			Ppc ppc2 = new Ppc("ppcOfer2", "Breez", "912 95hp", 10.0, 60.0, ofer ,false );
//			ppRepository.save(ppc1);
//			ppRepository.save(ppc2);
//			
//			LocalTime t1,t2;
//			t1 = LocalTime.of(9,45);
//			t2 = LocalTime.of(8, 30);
//			LocalDate d1 = LocalDate.parse("2018-12-21");
//			Flight f1 = new Flight (ppc1, ofer, d1 , t1 , t2 , "Yaron","Tal Or", "Netivot", 10.0, 11.1, 17.0, 1.0,0.0, "", "");
//			Flight f2 = new Flight (ppc1, ofer, d1 , t1 , t2 , "Yaron2","Tal Or", "Netivot", 15.0, 10.1, 17.0, 1.0,0.0, "", "");
//
//			flRepository.save(f1);
//			flRepository.save(f2);
// 		};
// 	}

}

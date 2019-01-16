package com.oferr.ppcdb.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.oferr.ppcdb.domain.Flight;
import com.oferr.ppcdb.domain.FlightRepository;

@RestController
public class AndroidController {

	@Autowired
	FlightRepository fRepository;
	
	@RequestMapping("and/flights")
	public Iterable<Flight> listFlights () {
		Iterable<Flight> listFl = fRepository.findAll();
		return listFl;
	}
	
	
	
	
}

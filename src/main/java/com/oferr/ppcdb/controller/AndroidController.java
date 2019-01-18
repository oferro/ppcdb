package com.oferr.ppcdb.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.oferr.ppcdb.domain.Flight;
import com.oferr.ppcdb.domain.FlightRepository;
import com.oferr.ppcdb.domain.Pilot;
import com.oferr.ppcdb.domain.PilotRepository;

@RestController
public class AndroidController {

	@Autowired
	FlightRepository flightRepository;
	
	@Autowired
	PilotRepository pilotRepository;
	
	@RequestMapping("and/flights")
	public List<Flight> listFlights () {
		List<Flight> listFl = flightRepository.findAll();
		return listFl;
	}
	
	@RequestMapping("and/pilots")
	public List<Pilot> listPilots () {
		List<Pilot> listPilot = pilotRepository.findAll();
		return listPilot;
	}
	
	
	
	
}

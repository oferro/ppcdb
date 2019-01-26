package com.oferr.ppcdb.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.oferr.ppcdb.domain.Flight;
import com.oferr.ppcdb.domain.FlightRepository;
import com.oferr.ppcdb.domain.Pilot;
import com.oferr.ppcdb.domain.PilotRepository;
import com.oferr.ppcdb.domain.Ppc;
import com.oferr.ppcdb.domain.PpcRepository;

@RestController
public class AndroidController {

	@Autowired
	FlightRepository flightRepository;
	
	@Autowired
	PilotRepository pilotRepository;

	@Autowired
	PpcRepository ppcRepository;
	
	@RequestMapping("and/flights")
	public List<Flight> listFlights () {
		Sort sort = Sort.by(Sort.Direction.DESC, "flDate").and(new Sort(Sort.Direction.DESC, "flToTime"));
		List<Flight> listFlight = flightRepository.findAll(sort);
		return listFlight;
	}
	
	@RequestMapping("and/pilots")
	public List<Pilot> listPilots () {
		List<Pilot> listPilot = pilotRepository.findAll();
		return listPilot;
	}
	
	@RequestMapping("and/ppcs")
	public List<Ppc> listPpcs () {
		List<Ppc> listPpc = ppcRepository.findAll();
		return listPpc;
	}
	
//	return from updateflight.jsp form 		--------------------------------------------------------
	
	@RequestMapping(value = "and/flightUpdate")
	public Flight flightUpdate(@RequestBody Flight flight) { 
//	Flight obj
		Optional<Flight> optFlight = flightRepository.findById(flight.getId());
		Flight fl = new Flight();
		if (optFlight.isPresent()) {
			fl = optFlight.get();
		}

//	Fill up pilot fl obj
		fl.setFlDate(flight.getFlDate());
		fl.setFlToTime(flight.getFlToTime());
		fl.setFlLndTime(flight.getFlLndTime());
		fl.setFlAirField(flight.getFlAirField());
		fl.setFlRoute(flight.getFlRoute());
//	repository insert
		flightRepository.save(fl);
		return fl;
	}

//	return from addFlight.jsp form 		--------------------------------------------------------
	
	@RequestMapping(value = "and/flightAdd")
	public Flight flightAdd(@RequestBody Flight flight) { 
//	repository insert
		flightRepository.save(flight);
		return flight;
	}

	
//	Delete flight		--------------------------------------------------------------------
	
	@RequestMapping(value = "and/flightDelete/{id}")
	public HttpStatus flightDelete(@PathVariable ("id") int id) { 
		long lId = (long) id;
		System.out.println("ID for repository Delete is : " + lId);
		flightRepository.deleteById(lId);
		System.out.println("delete category id: " + lId);
		return HttpStatus.ACCEPTED;
	}
}

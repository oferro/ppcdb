package com.oferr.ppcdb.controller;

import java.util.Optional;

import javax.persistence.criteria.Order;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.oferr.ppcdb.domain.Flight;
import com.oferr.ppcdb.domain.FlightRepository;
import com.oferr.ppcdb.domain.Pilot;
import com.oferr.ppcdb.domain.PilotRepository;
import com.oferr.ppcdb.domain.Ppc;
import com.oferr.ppcdb.domain.PpcRepository;

@Controller
public class FlightController {

	@Autowired
	FlightRepository repository;

	@Autowired
	PpcRepository ppcRepository;

	@Autowired
	PilotRepository pilotRepository;

	
//	fill up the flight list in index.jsp	------------------------------------------------
	
	@RequestMapping("/")
	public ModelAndView home() {
		Sort sort = Sort.by(Sort.Direction.DESC, "flDate");
		Iterable<Flight> tisot = repository.findAll(sort);
		Iterable<Pilot> pilotList = pilotRepository.findAll();
		Iterable<Ppc> ppcList = ppcRepository.findAll();
		ModelAndView mav = new ModelAndView("index");
		mav.addObject("tisot", tisot).addObject("pilotList", pilotList).addObject("ppcList", ppcList);
		return mav;
	}

	
//	Open flight updateflight.jsp form 		-----------------------------------------------
	
	@RequestMapping("/flightUpdate/{id}")
	public ModelAndView openUpdateFlight(@PathVariable("id") String id) {
		Long lId = Long.parseLong(id);
		System.out.println("ID for repository Update is : " + lId);
		Optional<Flight> optFlight = repository.findById(lId);
		Flight fl = new Flight();
			if(optFlight.isPresent()) {
				fl = optFlight.get();
			}
			System.out.println("List of Flight: "+fl);
			System.out.println("List of Flight: "+optFlight);		
			ModelAndView mav = new ModelAndView("updateflight");
		mav.addObject("tisa" ,fl);
		return mav;
	}

	
//	open addflight.jsp form for new flight   	--------------------------------------------
	
	@RequestMapping("/addflight")
	public ModelAndView openAddFlight() {
		Iterable<Pilot> pilotList = pilotRepository.findAll();
		Iterable<Ppc> ppcList = ppcRepository.findAll();
		ModelAndView mav = new ModelAndView("addflight");
		mav.addObject("pilotList", pilotList).addObject("ppcList", ppcList);
		return mav;
	}

	
//	return from addflight to the flight list 	--------------------------------------------
	
	@RequestMapping(value = "/flight/addFlight", method = RequestMethod.POST)
	public String addFlight(
			@RequestParam("pilotId") String pilotId, 
			@RequestParam("ppcId") String ppcId,
			@RequestParam("flDate") String flDate, 
			@RequestParam("flToTime") String flToTime,
			@RequestParam("flLndTime") String flLndTime, 
			@RequestParam("flAirField") String flAirField,
			@RequestParam("flRoute") String flRoute
			) {
//	Flight obj
		Flight fl = new Flight();

//  Serch for the pilot obj		
		Pilot pilot = new Pilot();
		Optional<Pilot> optPilot = pilotRepository.findById(Long.parseLong(pilotId));
		if (optPilot.isPresent()) {
			pilot = optPilot.get();
		}

//	serch for the ppc obj	
		Ppc ppc = new Ppc();
		Optional<Ppc> optPpc = ppcRepository.findById(Long.parseLong(ppcId));
		if (optPpc.isPresent()) {
			ppc = optPpc.get();
		}

//	Fill up pilot fl obj
		fl.setFlPilot(pilot);
		fl.setFlPpc(ppc);
		fl.setFlDate(flDate);
		fl.setFlToTime(flToTime);
		fl.setFlLndTime(flLndTime);
		fl.setFlAirField(flAirField);
		fl.setFlRoute(flRoute);
//	repository insert
		repository.save(fl);
		return "redirect:/";
	}

	
//	return from updateflight.jsp form 		--------------------------------------------------------
	
	@RequestMapping(value = "/flight/updateflight", method = RequestMethod.POST)
	public String updateFlight(
			@RequestParam("id") String id,
			@RequestParam("flDate") String flDate, 
			@RequestParam("flToTime") String flToTime,
			@RequestParam("flLndTime") String flLndTime, 
			@RequestParam("flAirField") String flAirField,
			@RequestParam("flRoute") String flRoute
			) {
//	Flight obj
		Optional<Flight> optFlight = repository.findById(Long.parseLong(id));
		Flight fl = new Flight();
		if (optFlight.isPresent()) {
			fl = optFlight.get();
		}

//	Fill up pilot fl obj
		fl.setFlDate(flDate);
		fl.setFlToTime(flToTime);
		fl.setFlLndTime(flLndTime);
		fl.setFlAirField(flAirField);
		fl.setFlRoute(flRoute);
//	repository insert
		repository.save(fl);
		return "redirect:/";
	}

	
//	Delete flight		--------------------------------------------------------------------
	
	@RequestMapping(value = "/flightDel/{id}")
	public String deleteFlight(@PathVariable ("id") String id) {
		Long lId = Long.parseLong(id);
		System.out.println("ID for repository Delete is : " + lId);
		repository.deleteById(lId);
		System.out.println("delete category id: " + lId);
		return "redirect:/";
	}

}

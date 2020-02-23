package com.oferr.ppcdb.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.security.auth.message.callback.SecretKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;

import org.eclipse.persistence.jpa.jpql.parser.SubstringExpression;
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
import com.oferr.ppcdb.domain.Partner;
import com.oferr.ppcdb.domain.PartnerRepository;
import com.oferr.ppcdb.domain.Pilot;
import com.oferr.ppcdb.domain.PilotRepository;
import com.oferr.ppcdb.domain.Ppc;
import com.oferr.ppcdb.domain.PpcRepository;
import com.oferr.ppcdb.domain.User;
import com.oferr.ppcdb.domain.UserRepository;

@Controller
public class FlightController {

	@Autowired
	UserRepository userRepository;
	
	@Autowired
	FlightRepository repository;

	@Autowired
	PpcRepository ppcRepository;

	@Autowired
	PilotRepository pilotRepository;

	@Autowired
	PartnerRepository partnerRepository;
	
	
	// User/Pilot from user request --------------------------------------------------------
	
	Pilot reqPilot (String usrReq) {
		User user = userRepository.findByUsername(usrReq);
		Pilot pilot = user.getUsPilot();
		return pilot;
	}
	
	
//	fill up the flight list in welcome.jsp	------------------------------------------------
	
	
	@RequestMapping(value = {"/flights"})
	public ModelAndView home(HttpServletRequest request) {
		String userReq = request.getUserPrincipal().getName();
		String uriName = request.getPathInfo();
		System.out.println("PathInfo: " + uriName);
		if(uriName==null) {
			uriName = "welcome";
		};
		Pilot pilot = reqPilot(userReq);
		Sort sortFlight = Sort.by(Sort.Direction.DESC, "flDate").and(new Sort(Sort.Direction.DESC, "flToTime"));
		Iterable<Flight> tisot = repository.findByFlPilot(pilot, sortFlight);
		Iterable<Partner> pilotList =  partnerRepository.findByPtPilot(pilot); //pilot.getPartners(); //pilotRepository.findAll();
//		Iterable<Ppc> ppcList = pilot.getPpcs(); //ppcRepository.findAll();
		ModelAndView mav = new ModelAndView(uriName);
		mav.addObject("tisot", tisot).addObject("pilotList", pilotList).addObject("pilot", pilot.getFullName());
		return mav;
	}

	@RequestMapping(value = {"/userflights"})
	public ModelAndView home2(HttpServletRequest request) {
		String userReq = request.getUserPrincipal().getName();
		Pilot pilot = reqPilot(userReq);
		Sort sortFlight = Sort.by(Sort.Direction.DESC, "flDate").and(new Sort(Sort.Direction.DESC, "flToTime"));
		Iterable<Flight> tisot = repository.findByFlPilot(pilot, sortFlight);
		Iterable<Partner> pilotList =  partnerRepository.findByPtPilot(pilot); //pilot.getPartners(); //pilotRepository.findAll();
//		Iterable<Ppc> ppcList = pilot.getPpcs(); //ppcRepository.findAll();
		ModelAndView mav = new ModelAndView("userflights");
		mav.addObject("tisot", tisot).addObject("pilotList", pilotList).addObject("pilot", pilot.getFullName());
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
	
	@RequestMapping(value= {"/addflight"}, method = RequestMethod.GET)
	public ModelAndView openAddFlight(HttpServletRequest request) {
		String userReq = request.getUserPrincipal().getName();
		String uriName = request.getServletPath();
		uriName = uriName.substring(1);
		if(uriName=="addflight") {
			uriName = "userflights";
		}
		System.out.println("PathInfo: " + uriName);
		Pilot pilot = reqPilot(userReq);
		List<Pilot> pilotList = new ArrayList<Pilot>(); //pilotRepository.findAll();
		pilotList.add(pilot);
		Iterable<Partner> ppcList =  partnerRepository.findByPtPilot(pilot);
//		Iterable<Ppc> ppcList = ppcRepository.findAll();
		ModelAndView mav = new ModelAndView("addflight");
		mav.addObject("pilotList", pilotList)
			.addObject("ppcList", ppcList)
			.addObject("uriName", "userflights");
		return mav;
	}

	
//	return from addflight to the flight list 	--------------------------------------------
	
	@RequestMapping(value = "/flight/addFlight", method = RequestMethod.POST)
	public String addFlight(
			@RequestParam("pathName") String pathName,
			@RequestParam("pilotId") String pilotId, 
			@RequestParam("ppcId") String ppcId,
			@RequestParam("flDate") String flDate, 
			@RequestParam("flToTime") String flToTime,
			@RequestParam("flLndTime") String flLndTime, 
			@RequestParam("flAirField") String flAirField,
			@RequestParam("flRoute") String flRoute,
			@RequestParam("flPassengerName") String flPassengerName,
			@RequestParam("flEngHourStart") double flEngHourStart,
			@RequestParam("flEngHourEnd") double flEngHourEnd,
			@RequestParam("flFuelQt") double flFuelQt,
			@RequestParam("flOilQt") double flOilQt,
			@RequestParam("flOtherExp") double flOtherExp,
			@RequestParam("flMaitenance") String flMaitenance,
			@RequestParam("flRemark") String flRemark			) {
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
		fl.setFlPassengerName(flPassengerName);
		fl.setFlEngHourStart(flEngHourStart);
		fl.setFlEngHourEnd(flEngHourEnd);
		fl.setFlFuelQt(flFuelQt);
		fl.setFlOilQt(flOilQt);
		fl.setFlOtherExp(flOtherExp);
		fl.setFlMaitenance(flMaitenance);
		fl.setFlRemark(flRemark);
		
//	repository insert
		repository.save(fl);

		System.out.println("Update Flight - PathInfo: " + pathName);
		
		return "redirect:/"+pathName;
	}

	
//	return from updateflight.jsp form 		--------------------------------------------------------
	
	@RequestMapping(value = "/flight/updateflight", method = RequestMethod.POST)
	public String updateFlight(
			@RequestParam("pathName") String pathName,
			@RequestParam("id") String id,
			@RequestParam("flDate") String flDate, 
			@RequestParam("flToTime") String flToTime,
			@RequestParam("flLndTime") String flLndTime, 
			@RequestParam("flAirField") String flAirField,
			@RequestParam("flRoute") String flRoute,
			@RequestParam("flPassengerName") String flPassengerName,
			@RequestParam("flEngHourStart") double flEngHourStart,
			@RequestParam("flEngHourEnd") double flEngHourEnd,
			@RequestParam("flFuelQt") double flFuelQt,
			@RequestParam("flOilQt") double flOilQt,
			@RequestParam("flOtherExp") double flOtherExp,
			@RequestParam("flMaitenance") String flMaitenance,
			@RequestParam("flRemark") String flRemark
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
		fl.setFlPassengerName(flPassengerName);
		fl.setFlEngHourStart(flEngHourStart);
		fl.setFlEngHourEnd(flEngHourEnd);
		fl.setFlFuelQt(flFuelQt);
		fl.setFlOilQt(flOilQt);
		fl.setFlOtherExp(flOtherExp);
		fl.setFlMaitenance(flMaitenance);
		fl.setFlRemark(flRemark);
		
//	repository insert
		repository.save(fl);

		System.out.println("Update Flight - PathInfo: " + pathName);
		
		return "redirect:/"+pathName;
	}

	
//	Delete flight		--------------------------------------------------------------------
	
	@RequestMapping(value = "/flightDel/{id}")
	public String deleteFlight(@PathVariable ("id") String id) {
		Long lId = Long.parseLong(id);
		System.out.println("ID for repository Delete is : " + lId);
		repository.deleteById(lId);
		System.out.println("delete category id: " + lId);
		return "redirect:/welcome";
	}

}

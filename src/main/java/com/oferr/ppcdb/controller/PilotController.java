package com.oferr.ppcdb.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.oferr.ppcdb.domain.Pilot;
import com.oferr.ppcdb.domain.PilotRepository;

@Controller
public class PilotController{

	@Autowired
	PilotRepository repository;
	
//	open addPilot.jsp form for new pilot   	--------------------------------------------
	
	@RequestMapping("/addpilot")
	public String addPilot() {
		return "addPilot";
	}
	
//	return from addpilot to the pilot list 	--------------------------------------------
	
	@RequestMapping(value = "/pilot/addPilot", method = RequestMethod.POST)
	public String addFlight(@RequestParam("piFirstName") String piFirstName, 
			@RequestParam("piLastName") String piLastName,
			@RequestParam("piEmail") String piEmail, 
			@RequestParam("piPw") String piPw,
			@RequestParam("piPhone") String piPhone 
			) {
//	Flight obj
		Pilot pi = new Pilot();


//	Fill up pilot pi obj
		pi.setPiFirstName(piFirstName);
		pi.setPiLastName(piLastName);
		pi.setPiEmail(piEmail);
		pi.setPiPw(piPw);
		pi.setPiPhone(piPhone);
//	repository insert
		repository.save(pi);
		return "redirect:/";
	}

//	Delete Pilot		--------------------------------------------------------------------
	
	@RequestMapping(value = "/pilotDel/{id}")
	public ModelAndView deleteFlight(@PathVariable ("id") String id) {
		Long lId = Long.parseLong(id);
		System.out.println("Pilot ID for repository Delete is : " + lId);
		Pilot delPilot = repository.getOne(lId);
		ModelAndView mav = new ModelAndView();

//	Check if there is flights for this pilot befor delete ?
		if (delPilot.getFlights().isEmpty()) {
			System.out.println("pilot.Flights isEmpty() = " +delPilot.getPpcs().isEmpty());
//			repository.deleteById(lId);
			String msg = "Pilot Deltle : " + delPilot.getFullName();
			System.out.println("deleted Pilot id: " + lId);
			System.out.println(msg);
			mav.setViewName("redirect:/#flights");
		} else {
			String msgError = "Pilot " +delPilot.getFullName() +" - can't delete. there is Flight records for this pilot";
			System.out.println(msgError);
			System.out.println("NOT delete category id: " + lId);
			mav.setViewName("error");
			mav.addObject("message", msgError);
		}
		return mav;
	}

}

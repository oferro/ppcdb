package com.oferr.ppcdb.controller;

import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.oferr.ppcdb.domain.Pilot;
import com.oferr.ppcdb.domain.PilotRepository;
import com.oferr.ppcdb.domain.User;
import com.oferr.ppcdb.domain.UserRepository;

@Controller
public class PilotController{
	
	@Autowired
	PilotRepository repository;
	
	@Autowired
	UserRepository userRepository;
	

	// User/Pilot from user request --------------------------------------------------------
	
		Pilot reqPilot (String usrReq) {
			User user = userRepository.findByUsername(usrReq);
			Pilot pilot = user.getUsPilot();
			return pilot;
		}

	
	
//	open addPilot.jsp form for new pilot   	--------------------------------------------
	
	@RequestMapping("/addpilot")
	public String openAddPilot() {
		return "addPilot";
	}
	
//	return from addpilot to the pilot list 	--------------------------------------------
	
	@RequestMapping(value = "/pilot/addPilot", method = RequestMethod.POST)
	public String addPilot(HttpServletRequest request,
			@RequestParam("piFirstName") String piFirstName, 
			@RequestParam("piLastName") String piLastName,
			@RequestParam("piEmail") String piEmail, 
			@RequestParam("piPhone") String piPhone 
			) {
//	Flight obj
		String userReq = request.getUserPrincipal().getName();
		User user = userRepository.findByUsername(userReq);
		
		Pilot pi = new Pilot();

//	Fill up pilot pi obj
		pi.setPiFirstName(piFirstName);
		pi.setPiLastName(piLastName);
		pi.setPiEmail(piEmail);
		pi.setPiPhone(piPhone);
		pi.setUser(user);
//	repository insert
		repository.saveAndFlush(pi);
		return "redirect:/";
	}
	
//	Open pilot updatepilot.jsp form 		-----------------------------------------------
	
	@RequestMapping("/pilotUpdate/{id}")
	public ModelAndView openUpdatePilot(@PathVariable("id") String id) {
		Long lId = Long.parseLong(id);
		System.out.println("ID for repository Update is : " + lId);
		Optional<Pilot> optPilot = repository.findById(lId);
		Pilot pi = new Pilot();
			if(optPilot.isPresent()) {
				pi = optPilot.get();
			}
			ModelAndView mav = new ModelAndView("updatepilot");
		mav.addObject("pilot" ,pi);
		return mav;
	}

	@RequestMapping("/pilotUpdate")
	public ModelAndView openUpdatePilot2(HttpServletRequest request) {
		String userReq = request.getUserPrincipal().getName();
		Pilot pi = reqPilot(userReq);
			ModelAndView mav = new ModelAndView("updatepilot");
		mav.addObject("pilot" ,pi);
		return mav;
	}

//	return from updatepilot to the pilot list 	--------------------------------------------
	
	@RequestMapping(value = "/pilot/updatePilot", method = RequestMethod.POST)
	public String updatePilot(
			@RequestParam("id") String id,
			@RequestParam("piFirstName") String piFirstName, 
			@RequestParam("piLastName") String piLastName,
			@RequestParam("piEmail") String piEmail, 
			@RequestParam("piPhone") String piPhone 
			) {
//	Flight obj

		Pilot pi = new Pilot();

		if(repository.existsById(Long.parseLong(id))) {
			pi = repository.getOne(Long.parseLong(id));
			}
	
//	Fill up pilot pi obj
		pi.setPiFirstName(piFirstName);
		pi.setPiLastName(piLastName);
		pi.setPiEmail(piEmail);
		pi.setPiPhone(piPhone);
//	repository insert
		repository.save(pi);
		return "redirect:/flights#pilots";
	}

//	Delete Pilot		--------------------------------------------------------------------
	
	@RequestMapping(value = "/pilotDel/{id}")
	public ModelAndView deletePilot(@PathVariable ("id") String id) {
		Long lId = Long.parseLong(id);
		System.out.println("Pilot ID for repository Delete is : " + lId);
		Pilot delPilot = repository.getOne(lId);
		ModelAndView mav = new ModelAndView();

//	Check if there is flights for this pilot befor delete ?
		if (delPilot.getFlights().isEmpty()) {
			System.out.println("pilot.Flights isEmpty() = " +delPilot.getFlights().isEmpty());
			repository.deleteById(lId);
			String msg = "Pilot Deltle : " + delPilot.getFullName();
			System.out.println("deleted Pilot id: " + lId);
			System.out.println(msg);
			mav.setViewName("redirect:/index#flights");
		} else {
			String msgError = "Pilot " +delPilot.getFullName() +" - can't delete. there is Flight records for this pilot";
			System.out.println(msgError);
			System.out.println("NOT delete Pilot, id: " + lId);
			mav.setViewName("error");
			mav.addObject("message", msgError);
		}
		return mav;
	}

}

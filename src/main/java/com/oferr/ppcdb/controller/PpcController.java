package com.oferr.ppcdb.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.oferr.ppcdb.domain.Partner;
import com.oferr.ppcdb.domain.PartnerRepository;
import com.oferr.ppcdb.domain.Pilot;
import com.oferr.ppcdb.domain.Ppc;
import com.oferr.ppcdb.domain.PpcRepository;
import com.oferr.ppcdb.domain.User;
import com.oferr.ppcdb.domain.UserRepository;

@Controller
public class PpcController {
	
	@Autowired
	PpcRepository repository;
	
	@Autowired
	UserRepository userRepository;

	@Autowired
	PartnerRepository partnerRepository;

	
// User/Pilot from user request --------------------------------------------------------
	
	Pilot reqPilot (String usrReq) {
		User user = userRepository.findByUsername(usrReq);
		Pilot pilot = user.getUsPilot();
		return pilot;
	}

//	fill up the ppc list in userppcs.jsp    	--------------------------------------------
	
	@SuppressWarnings("null")
	@RequestMapping(value = {"/userppcs"})
	public ModelAndView home(HttpServletRequest request) {
		String userReq = request.getUserPrincipal().getName();
		Pilot pilot = reqPilot(userReq);
		String uriName = request.getPathInfo();
		System.out.println("PathInfo: " + uriName);
		if(uriName==null) {
			uriName = "welcome";
		};
		uriName = "userppcs";
//		Sort sortFlight = Sort.by(Sort.Direction.DESC, "flDate").and(new Sort(Sort.Direction.DESC, "flToTime"));
//		Iterable<Flight> tisot = repository.findByFlPilot(pilot, sortFlight);
//		Iterable<Partner> pilotList =  partnerRepository.findByPtPilot(pilot); //pilot.getPartners(); //pilotRepository.findAll();
		List<Partner> ppcListPartner = partnerRepository.findByPtPilot(pilot);
		List<Partner> ppcList = new ArrayList<Partner>();
		for(Partner ppc : ppcListPartner) {
			if(ppc.isPtActive()) {
				ppcList.add(ppc) ;
			}
			else {
				if(ppc.getPtPilot() == pilot) {
					ppcList.add(ppc);
				}
			}
		}
//		Collections.sort((List<Ppc>) ppcList,null);
		ModelAndView mav = new ModelAndView(uriName);
		mav
			.addObject("ppcList", ppcList)
			.addObject("pilotName", pilot.getFullName())
			.addObject("pilot", pilot);
		return mav;
	}
	
	
//	open addPpc.jsp form for new pilot   	--------------------------------------------
	
	@RequestMapping("/addPpc")
	public ModelAndView openAddPpc(HttpServletRequest request) {
		String userReq = request.getUserPrincipal().getName();
		Pilot pilot = reqPilot(userReq);
		ModelAndView mav = new ModelAndView("addPpc");
		mav.addObject("pilotName", pilot.getFullName());
		return mav;
	}
	
//	return from addPpc to the ppc list 	--------------------------------------------
	
	@RequestMapping(value = "/ppc/addPpc", method = RequestMethod.POST)
	public ModelAndView addPpc(HttpServletRequest request,
			@RequestParam("ppName") String ppName, 
			@RequestParam("ppManuf") String ppManuf,
			@RequestParam("ppEnginType") String ppEnginType, 
			@RequestParam("ppEngHourStart") String ppEngHourStart,
			@RequestParam("ppFuelQt") String ppFuelQt, 
			@RequestParam("ppNotActive") boolean ppNotActive
			) {
//	Ppc obj

		String userReq = request.getUserPrincipal().getName();
		Pilot pilot = reqPilot(userReq);
		
		Ppc ppc = new Ppc();


//	Fill up ppc obj
		ppc.setPpName(ppName);
		ppc.setPpManuf(ppManuf);
		ppc.setPpEnginType(ppEnginType);
		ppc.setPpEnginType(ppEnginType);
		ppc.setPpFuelQt(ppFuelQt);
		ppc.setPpNotActive(ppNotActive);
		ppc.setPpPilotMang(pilot);
//	repository insert
		repository.save(ppc);
		ModelAndView mav = new ModelAndView("userppcs");

		return mav;
	}

//	Open ppc updateppc.jsp form 		-----------------------------------------------
	
	@RequestMapping("/ppc/ppcUpdate/{id}")
	public ModelAndView openUpdatePpc(@PathVariable("id") String id) {
		Long lId = Long.parseLong(id);
		System.out.println("ID for repository Update is : " + lId);
		Optional<Ppc> optPpc = repository.findById(lId);
		Ppc ppc = new Ppc();
			if(optPpc.isPresent()) {
				ppc = optPpc.get();
			}
			System.out.println("List of Pilot: "+ppc);
			System.out.println("List of Pilot: "+optPpc);		
			ModelAndView mav = new ModelAndView("updateppc");
		mav.addObject("ppc" ,ppc);
		return mav;
	}

//	return from updateppc.jsp form 		--------------------------------------------------------
	
	@RequestMapping(value = "/ppc/updateppc", method = RequestMethod.POST)
	public String updatePpc(
			@RequestParam("id") String id,
			@RequestParam("ppName") String ppName, 
			@RequestParam("ppManuf") String ppManuf,
			@RequestParam("ppEnginType") String ppEnginType, 
			@RequestParam("ppEngHourStart") double ppEngHourStart,
			@RequestParam("ppFuelQt") double ppFuelQt,
			@RequestParam("ppNotActive") boolean ppNotActive
			) {
//	Ppc obj
		Optional<Ppc> optPpc = repository.findById(Long.parseLong(id));
		Ppc ppc = new Ppc();
		if (optPpc.isPresent()) {
			ppc = optPpc.get();
		}

//	Fill up ppc obj
		ppc.setPpName(ppName);
		ppc.setPpManuf(ppManuf);
		ppc.setPpEnginType(ppEnginType);
		ppc.setPpEngHourStart(ppEngHourStart);
		ppc.setPpFuelQt(ppFuelQt);
		ppc.setPpNotActive(ppNotActive);
//	repository insert
		repository.save(ppc);
		return "redirect:/userppcs";
	}

//	Delete Ppc		--------------------------------------------------------------------
	
	@RequestMapping(value = "/ppcDel/{id}")
	public ModelAndView deletePpc(@PathVariable ("id") String id) {
		Long lId = Long.parseLong(id);
		System.out.println("Ppc ID for repository Delete is : " + lId);
		Ppc delPpc = repository.getOne(lId);
		ModelAndView mav = new ModelAndView();

//	Check if there is flights for this PPC befor delete ?
		if (delPpc.getFlights().isEmpty()) {
			System.out.println("ppc.Flights isEmpty() = " +delPpc.getFlights().isEmpty());
			repository.deleteById(lId);
			String msg = "PPC Deltle : " + delPpc.getPpName();
			System.out.println("deleted PPC id: " + lId);
			System.out.println(msg);
			mav.setViewName("redirect:/userppcs");
		} else {
			String msgError = "PPC " +delPpc.getPpName() +" - can't delete. there is Flight records for this PPC";
			System.out.println(msgError);
			System.out.println("NOT delete PPC, id: " + lId);
			mav.setViewName("error");
			mav.addObject("message", msgError);
		}
		return mav;
	}


	
}

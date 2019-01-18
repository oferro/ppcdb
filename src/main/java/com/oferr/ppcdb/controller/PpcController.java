package com.oferr.ppcdb.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.oferr.ppcdb.domain.Ppc;
import com.oferr.ppcdb.domain.PpcRepository;

@Controller
public class PpcController {
	
	@Autowired
	PpcRepository repository;
	
//	open addPpc.jsp form for new pilot   	--------------------------------------------
	
	@RequestMapping("/addPpc")
	public String openAddPpc() {
		return "addPpc";
	}
	
//	return from addPpc to the ppc list 	--------------------------------------------
	
	@RequestMapping(value = "/ppc/addPpc", method = RequestMethod.POST)
	public String addPpc(@RequestParam("ppName") String ppName, 
			@RequestParam("ppManuf") String ppManuf,
			@RequestParam("ppEnginType") String ppEnginType, 
			@RequestParam("ppEngHourStart") String ppEngHourStart,
			@RequestParam("ppFuelQt") String ppFuelQt 
			) {
//	Ppc obj
		Ppc ppc = new Ppc();


//	Fill up ppc obj
		ppc.setPpName(ppName);
		ppc.setPpManuf(ppManuf);
		ppc.setPpEnginType(ppEnginType);
		ppc.setPpEnginType(ppEnginType);
		ppc.setPpFuelQt(ppFuelQt);
//	repository insert
		repository.save(ppc);
		return "redirect:/";
	}

//	Open ppc updateppc.jsp form 		-----------------------------------------------
	
	@RequestMapping("/ppcUpdate/{id}")
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
			@RequestParam("ppEngHourStart") String ppEngHourStart,
			@RequestParam("ppFuelQt") String ppFuelQt
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
//	repository insert
		repository.save(ppc);
		return "redirect:/";
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
			mav.setViewName("redirect:/#ppcs");
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

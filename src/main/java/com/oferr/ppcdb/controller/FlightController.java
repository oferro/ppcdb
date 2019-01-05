package com.oferr.ppcdb.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.oferr.ppcdb.domain.Flight;
import com.oferr.ppcdb.domain.FlightRepository;

@Controller
public class FlightController {

	@Autowired
	FlightRepository repository;
	
	@RequestMapping("/")
	public ModelAndView home() {
		Iterable<Flight> tisot = repository.findAll();
		ModelAndView mav = new ModelAndView("index", "tisot", tisot);
		return mav;
    }
	
	@RequestMapping("/flight")
	@ResponseBody
	public Iterable<Flight> tisot() {
		return repository.findAll();
		
    }
	
	@RequestMapping("/hello")
	public String hello() {
		return "hello";
	}
	
//	@RequestMapping(value="/index/delete/{id}")
//	public String deleteCategory (@PathVariable("id") String id) {
//	   repository.deleteById(Long.parseLong(id));
//	   System.out.println("delete category id: "+id);
//	   return "redirect:/";
//	}
//	
	
	
//	@RequestMapping(value="/category2/update/{id}")
//	public ModelAndView updateCategory (@PathVariable("id") String id) {
//		Iterable<Category> reshima = repository.findByID(Long.parseLong(id));
//		ModelAndView mav = new ModelAndView("formcategory", "reshima", reshima);
//	   System.out.println("update category id: "+id);
//	   return mav;
//	}
	

	
//	@RequestMapping("/flight/id")
//	public ModelAndView updateFlight(@RequestParam("id") long personId) {
//		Iterable<Flight> tisa = repository.findById(personId);
//		ModelAndView mav = new ModelAndView("formflight", "tisa", tisa);
//		return mav;
//    }
	
	
	
}

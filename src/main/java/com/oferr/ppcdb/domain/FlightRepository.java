package com.oferr.ppcdb.domain;

import java.util.List;

import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface FlightRepository extends JpaRepository<Flight, Long> {
	
	// Fetch flights by pilot using SQL
		@Query("select f from Flight f where f.flPilot = ?1")
		List<Flight> findByFlPilot(Pilot flPilot, Sort sort);

		//Fetch flights by PPC
		Iterable<Flight> findByFlPpc(Ppc ppc, Sort sortFlight);

}

package com.oferr.ppcdb.domain;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface PartnerRepository extends JpaRepository<Partner, Long> {
	
	// Fetch partners by pilot using SQL
	@Query("select p from Partner p where p.ptPilot = ?1")
	List<Partner> findByPtPilot(Pilot ptPilot);

	//Fetch pilot on ppc by ppcId as String
	List<Partner> findByPtPpc(Ppc ptPpc);
	
}

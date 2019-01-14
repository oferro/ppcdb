package com.oferr.ppcdb.domain;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

public interface PpcRepository extends JpaRepository<Ppc, Long> {
	
	// Fetch ppc by name
	List<Ppc> findByPpName(String ppName);

}

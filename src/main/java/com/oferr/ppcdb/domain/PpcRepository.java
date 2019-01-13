package com.oferr.ppcdb.domain;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

public interface PpcRepository extends CrudRepository<Ppc, Long> {
	
	// Fetch ppc by name
	List<Ppc> findByPpName(String ppName);

}

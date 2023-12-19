package com.nxsol.bzcomposer.company.repos;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.nxsol.bzcomposer.company.domain.BcaServicetype;

@Repository
public interface BcaServicetypeRepository extends JpaRepository<BcaServicetype, Integer> {

	List<BcaServicetype> findAllByOrderByServiceName();
	
	@Query("SELECT MAX(st.serviceId) FROM BcaServicetype st")
    Integer findMaxServiceId();
}

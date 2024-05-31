package com.nxsol.bzcomposer.company.repos;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.nxsol.bzcomposer.company.domain.BcaCvtype;

@Repository
public interface BcaCvtypeRepository extends JpaRepository<BcaCvtype, Integer> {

	@Query("SELECT cvType.cvtypeId FROM BcaCvtype cvType WHERE cvType.name = :name")
	Integer findByName(@Param("name") String name);
	
}

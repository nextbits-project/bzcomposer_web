package com.nxsol.bzcomposer.company.repos;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.nxsol.bzcomposer.company.domain.BcaCvtype;

@Repository
public interface BcaCvtypeRepository extends JpaRepository<BcaCvtype, Integer> {

	@Query("SELECT cvType.cvtypeId FROM BcaCvtype cvType WHERE cvType.name = :name")
	List<Integer> findByName(@Param("name") String name);

//	@Query( value = "SELECT cvType.CVTypeID FROM bca_cvtype cvType WHERE cvType.name = :name")
//	List<Integer> findByName(@Param("name") String name);
	
}

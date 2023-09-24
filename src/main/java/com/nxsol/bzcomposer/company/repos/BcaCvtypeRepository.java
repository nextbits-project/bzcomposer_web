package com.nxsol.bzcomposer.company.repos;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.nxsol.bzcomposer.company.domain.BcaCvtype;


public interface BcaCvtypeRepository extends JpaRepository<BcaCvtype, Integer> {

	@Query( value = "SELECT CVTypeID from bca_cvtype WHERE name = :customerType")
	List<Integer> findByName(@Param("customerType") String customerType);
}

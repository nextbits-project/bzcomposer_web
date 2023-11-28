package com.nxsol.bzcomposer.company.repos;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.nxsol.bzcomposer.company.domain.BcaCompany;
import com.nxsol.bzcomposer.company.domain.BcaSalestax;

@Repository
public interface BcaSalestaxRepository extends JpaRepository<BcaSalestax, Integer> {

//	String footnoteQuery = "select SalesTaxID,State from bca_salestax where Active=1 and CompanyID=?";
	List<BcaSalestax> findByActiveAndCompany(int active,BcaCompany company);
}

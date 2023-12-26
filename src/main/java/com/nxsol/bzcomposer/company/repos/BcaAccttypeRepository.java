package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.BcaAccttype;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BcaAccttypeRepository extends JpaRepository<BcaAccttype, Integer> {
	BcaAccttype findByacctTypeId(Integer acctTypeID);
}

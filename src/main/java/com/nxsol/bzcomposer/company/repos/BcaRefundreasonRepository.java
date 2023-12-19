package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.BcaCompany;
import com.nxsol.bzcomposer.company.domain.BcaRefundreason;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BcaRefundreasonRepository extends JpaRepository<BcaRefundreason, Integer> {
	List<BcaRefundreason> findByCompanyAndActive(BcaCompany company, Boolean active);

	List<BcaRefundreason> findByCompany(BcaCompany company);

}

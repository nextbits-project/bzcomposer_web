package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.BcaCompany;
import com.nxsol.bzcomposer.company.domain.BcaMasterrmareason;
import com.nxsol.bzcomposer.company.domain.BcaRmareason;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BcaRmareasonRepository extends JpaRepository<BcaRmareason, String> {
    List<BcaRmareason> findByCompanyAndParentReasonAndActive(BcaCompany company, BcaMasterrmareason parentReason, Integer active);

}

package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.BcpFedperallowance;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface BcpFedperallowanceRepository extends JpaRepository<BcpFedperallowance, Integer> {
//	@Query("SELECT DISTINCT b.eYear FROM BcpFedperallowance b ORDER BY b.eYear DESC")
//	List<BcpFedperallowance> findDistinctEYear();
	@Query("SELECT DISTINCT b.eyear FROM BcpFedperallowance b ORDER BY b.eyear DESC")
    List<Integer> findDistinctTaxYears();
}

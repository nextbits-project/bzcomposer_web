package com.nxsol.bzcomposer.company.repos;

import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.nxsol.bzcomposer.company.domain.BcaRma;

public interface BcaRmaRepository extends JpaRepository<BcaRma, Integer> {

	@Query(value="select rma from BcaRma as rma order by rma.dateAdded desc ")
	List<BcaRma> findLastRecordOrderByDateAddedDesc(Pageable pageable);
}

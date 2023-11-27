package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.BcaServicetype;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BcaServicetypeRepository extends JpaRepository<BcaServicetype, Integer> {
	List<BcaServicetype> findAllByOrderByServiceName();
}

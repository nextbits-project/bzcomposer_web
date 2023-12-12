package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.BcaMasterstartingmodule;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BcaMasterstartingmoduleRepository extends JpaRepository<BcaMasterstartingmodule, Integer> {
	List<BcaMasterstartingmodule> findAllByOrderByModuleName();
}

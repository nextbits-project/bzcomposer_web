package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.BcaMastershippingcontainer;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BcaMastershippingcontainerRepository extends JpaRepository<BcaMastershippingcontainer, Integer> {
	List<BcaMastershippingcontainer> findByActive(int active);
}

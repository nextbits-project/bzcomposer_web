package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.BcaMastershippingpackagesize;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BcaMastershippingpackagesizeRepository extends JpaRepository<BcaMastershippingpackagesize, Integer> {
	List<BcaMastershippingpackagesize> findByActive(int active);
}

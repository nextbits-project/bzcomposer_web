package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.BcaMastershippingmailtype;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BcaMastershippingmailtypeRepository extends JpaRepository<BcaMastershippingmailtype, Integer> {
	List<BcaMastershippingmailtype> findByActive(int active);
}

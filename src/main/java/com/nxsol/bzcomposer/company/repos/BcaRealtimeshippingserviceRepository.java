package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.BcaRealtimeshippingservice;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BcaRealtimeshippingserviceRepository extends JpaRepository<BcaRealtimeshippingservice, Integer> {
	Optional<BcaRealtimeshippingservice> findByShippingServiceIdAndActive(int shippingServiceId, int active);
    List<BcaRealtimeshippingservice> findByShippingTypeAndActive(int shippingType, int active);

}

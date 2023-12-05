package com.nxsol.bzcomposer.company.repos;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.nxsol.bzcomposer.company.domain.BcaShippingaddress;

@Repository
public interface BcaShippingaddressRepository extends JpaRepository<BcaShippingaddress, Integer> {

}

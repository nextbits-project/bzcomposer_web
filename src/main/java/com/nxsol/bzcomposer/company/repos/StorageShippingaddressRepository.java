package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.StorageShippingaddress;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface StorageShippingaddressRepository extends JpaRepository<StorageShippingaddress, Integer> {
}

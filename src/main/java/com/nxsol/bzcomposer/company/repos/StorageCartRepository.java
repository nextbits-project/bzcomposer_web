package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.StorageCart;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface StorageCartRepository extends JpaRepository<StorageCart, Integer> {
}

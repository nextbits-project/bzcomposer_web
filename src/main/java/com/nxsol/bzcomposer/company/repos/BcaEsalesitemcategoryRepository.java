package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.BcaEsalesitemcategory;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BcaEsalesitemcategoryRepository extends JpaRepository<BcaEsalesitemcategory, Integer> {
}

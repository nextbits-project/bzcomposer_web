package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.BcaCategory;
import org.springframework.data.jpa.repository.JpaRepository;


public interface BcaCategoryRepository extends JpaRepository<BcaCategory, Integer> {
}
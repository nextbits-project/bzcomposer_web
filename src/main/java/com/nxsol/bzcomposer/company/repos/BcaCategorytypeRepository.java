package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.BcaCategorytype;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BcaCategorytypeRepository extends JpaRepository<BcaCategorytype, Integer> {
    List<BcaCategorytype> findByIsActiveOrderByCategoryTypeNameAsc(Boolean isActive);

}

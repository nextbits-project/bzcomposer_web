package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.BcaCreditcardtype;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BcaCreditcardtypeRepository extends JpaRepository<BcaCreditcardtype, Integer> {
}

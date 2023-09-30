package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.BcaMastercreditcardtype;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BcaMastercreditcardtypeRepository extends JpaRepository<BcaMastercreditcardtype, Integer> {
}

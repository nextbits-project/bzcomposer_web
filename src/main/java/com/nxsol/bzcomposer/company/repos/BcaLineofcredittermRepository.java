package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.BcaLineofcreditterm;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BcaLineofcredittermRepository extends JpaRepository<BcaLineofcreditterm, Integer> {
}

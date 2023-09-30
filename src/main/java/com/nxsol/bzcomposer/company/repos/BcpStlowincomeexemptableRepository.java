package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.BcpStlowincomeexemptable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BcpStlowincomeexemptableRepository extends JpaRepository<BcpStlowincomeexemptable, Integer> {
}

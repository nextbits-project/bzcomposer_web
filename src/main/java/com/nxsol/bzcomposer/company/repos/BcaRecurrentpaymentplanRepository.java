package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.BcaRecurrentpaymentplan;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BcaRecurrentpaymentplanRepository extends JpaRepository<BcaRecurrentpaymentplan, Integer> {
}

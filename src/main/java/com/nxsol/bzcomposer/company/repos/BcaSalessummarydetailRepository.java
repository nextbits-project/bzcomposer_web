package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.BcaSalessummarydetail;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BcaSalessummarydetailRepository extends JpaRepository<BcaSalessummarydetail, Integer> {
}

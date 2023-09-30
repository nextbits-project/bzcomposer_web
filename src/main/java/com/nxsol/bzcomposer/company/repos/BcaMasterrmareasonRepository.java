package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.BcaMasterrmareason;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BcaMasterrmareasonRepository extends JpaRepository<BcaMasterrmareason, Integer> {
}

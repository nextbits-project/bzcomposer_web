package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.BcaBusinessmodules;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BcaBusinessmodulesRepository extends JpaRepository<BcaBusinessmodules, String> {
}

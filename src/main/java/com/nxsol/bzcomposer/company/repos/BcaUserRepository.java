package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.BcaUser;
import org.springframework.data.jpa.repository.JpaRepository;


public interface BcaUserRepository extends JpaRepository<BcaUser, Integer> {
}

package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.BcaUsergroup;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BcaUsergroupRepository extends JpaRepository<BcaUsergroup, Integer> {
}

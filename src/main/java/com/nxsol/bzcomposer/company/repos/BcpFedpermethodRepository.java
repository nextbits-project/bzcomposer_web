package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.BcpFedpermethod;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BcpFedpermethodRepository extends JpaRepository<BcpFedpermethod, Integer> {
}

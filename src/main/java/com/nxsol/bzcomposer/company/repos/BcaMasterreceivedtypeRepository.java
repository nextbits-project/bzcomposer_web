package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.BcaMasterreceivedtype;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BcaMasterreceivedtypeRepository extends JpaRepository<BcaMasterreceivedtype, Integer> {
}

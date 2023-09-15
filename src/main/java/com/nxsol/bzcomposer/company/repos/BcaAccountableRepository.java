package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.BcaAccountable;
import org.springframework.data.jpa.repository.JpaRepository;


public interface BcaAccountableRepository extends JpaRepository<BcaAccountable, Integer> {
}

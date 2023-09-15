package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.BcaAccount;
import org.springframework.data.jpa.repository.JpaRepository;


public interface BcaAccountRepository extends JpaRepository<BcaAccount, Integer> {
}

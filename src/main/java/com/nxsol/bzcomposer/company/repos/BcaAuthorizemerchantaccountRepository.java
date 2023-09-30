package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.BcaAuthorizemerchantaccount;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BcaAuthorizemerchantaccountRepository extends JpaRepository<BcaAuthorizemerchantaccount, Integer> {
}

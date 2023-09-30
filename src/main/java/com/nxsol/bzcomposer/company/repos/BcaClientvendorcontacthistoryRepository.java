package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.BcaClientvendorcontacthistory;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BcaClientvendorcontacthistoryRepository extends JpaRepository<BcaClientvendorcontacthistory, Long> {
}

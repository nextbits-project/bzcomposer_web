package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.BcaInventorycollectedfromstore;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BcaInventorycollectedfromstoreRepository extends JpaRepository<BcaInventorycollectedfromstore, String> {
}

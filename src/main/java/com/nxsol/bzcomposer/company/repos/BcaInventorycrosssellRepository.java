package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.BcaInventorycrosssell;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BcaInventorycrosssellRepository extends JpaRepository<BcaInventorycrosssell, Integer> {
}

package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.BcaInventoryassembly;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BcaInventoryassemblyRepository extends JpaRepository<BcaInventoryassembly, Integer> {
}

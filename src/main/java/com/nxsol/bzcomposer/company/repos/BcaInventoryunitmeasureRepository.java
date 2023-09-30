package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.BcaInventoryunitmeasure;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BcaInventoryunitmeasureRepository extends JpaRepository<BcaInventoryunitmeasure, Integer> {
}

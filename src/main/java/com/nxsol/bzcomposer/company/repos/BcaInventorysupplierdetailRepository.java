package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.BcaInventorysupplierdetail;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BcaInventorysupplierdetailRepository extends JpaRepository<BcaInventorysupplierdetail, Integer> {
}

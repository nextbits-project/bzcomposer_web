package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.ItemCategoryDetails;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ItemCategoryDetailsRepository extends JpaRepository<ItemCategoryDetails, Long> {
}

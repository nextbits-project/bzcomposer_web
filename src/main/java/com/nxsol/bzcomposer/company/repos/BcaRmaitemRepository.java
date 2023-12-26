package com.nxsol.bzcomposer.company.repos;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.nxsol.bzcomposer.company.domain.BcaRmaitem;

@Repository
public interface BcaRmaitemRepository extends JpaRepository<BcaRmaitem, Integer> {

	@Query("select a from BcaRmaitem as a  inner join BcaRmamaster as b on a.rmaNo = b.rmaId where a.cart.cartId  = :cartId and not (b.status = 'Canceled')")
	List<BcaRmaitem> findRmaItemByCardtId(@Param("cartId") int cartId);

}

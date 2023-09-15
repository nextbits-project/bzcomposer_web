
package com.nxsol.bzcomposer.company.specs.pagination;

import java.util.ArrayList;
import java.util.List;

import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Order;

public class PageRequestBuilder {

	private static final int DEFAULT_SIZE_PAGE = 20;

	private PageRequestBuilder() {
	}

	public static PageRequest getPageable(int size, int page, List<String> orderColumn, Sort.Direction sortDirection) {
		List<Sort.Order> orders = new ArrayList<>();
		for (String string : orderColumn) {
			orders.add(Order.by(string));
		}
		int pageSize = (size == 0) ? DEFAULT_SIZE_PAGE : size;
		int curentPage = (page <= 0) ? 1 : page;
		if (orderColumn.isEmpty()) {
			return PageRequest.of((curentPage - 1), pageSize);
		} else {
			if (sortDirection.equals(Sort.Direction.DESC) || sortDirection.equals(Sort.Direction.ASC)) {
//            	sortDirection, orderColumn
				Sort sort = Sort.by(sortDirection).by(orders);
				return PageRequest.of((curentPage - 1), pageSize, sort);
			} else {
				throw new IllegalArgumentException(String
						.format("Value for param 'order' is not valid : %s , must be 'asc' or 'desc'", sortDirection));
			}
		}
	}
}

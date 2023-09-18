package com.nxsol.bzcomposer.company.specs.pagination.filter;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import org.springframework.data.jpa.domain.Specification;

import com.nxsol.bzcomposer.company.specs.pagination.SearchFilters;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

public class FilterSpecifications<T> implements Specification<T> {

	private static final long serialVersionUID = 1L;
	private List<FilterCondition> filterAndConditions;
	private List<FilterCondition> filterOrConditions;

	public FilterSpecifications() {
		filterAndConditions = new ArrayList<>();
		filterOrConditions = new ArrayList<>();
	}

	public void addCondition(SearchFilters searchFilters) {

		if (searchFilters != null && !searchFilters.getFilterAndConditions().isEmpty()) {
			filterAndConditions.addAll(searchFilters.getFilterAndConditions());
		}
		if (searchFilters != null && !searchFilters.getFilterOrConditions().isEmpty()) {
			filterOrConditions.addAll(searchFilters.getFilterOrConditions());
		}
	}

	@Override
	public Predicate toPredicate(Root root, CriteriaQuery criteriaQuery, CriteriaBuilder criteriaBuilder) {

		List<Predicate> predicatesAndClause = new ArrayList<>();
		List<Predicate> predicatesOrClause = new ArrayList<>();

		filterAndConditions.forEach(
				condition -> predicatesAndClause.add(buildPredicate(condition, root, criteriaQuery, criteriaBuilder)));
		filterOrConditions.forEach(
				condition -> predicatesOrClause.add(buildPredicate(condition, root, criteriaQuery, criteriaBuilder)));

		if (!predicatesAndClause.isEmpty() && !predicatesOrClause.isEmpty()) {
			return criteriaBuilder.and(
					criteriaBuilder.and(predicatesAndClause.toArray(new Predicate[predicatesAndClause.size()])),
					criteriaBuilder.or(
							criteriaBuilder.or(predicatesOrClause.toArray(new Predicate[predicatesOrClause.size()]))));
		} else if (!predicatesAndClause.isEmpty()) {
			return criteriaBuilder.and(predicatesAndClause.toArray(new Predicate[predicatesAndClause.size()]));

		} else if (!predicatesOrClause.isEmpty()) {
			return criteriaBuilder.or(predicatesOrClause.toArray(new Predicate[predicatesOrClause.size()]));

		} else {
			return null;
		}

	}

	private Predicate buildPredicate(FilterCondition condition, Root root, CriteriaQuery criteriaQuery,
			CriteriaBuilder criteriaBuilder) {
		Predicate p;

		switch (condition.getOperator()) {
		case EQUAL:
			p = criteriaBuilder.equal(root.get(condition.getField()), condition.getValue());
			break;
		case NOT_EQUAL:
			p = criteriaBuilder.notEqual(root.get(condition.getField()), condition.getValue());
			break;
		/*
		 * Operator for any type
		 */
		case IS_NULL:
			p = criteriaBuilder.isNull(root.get(condition.getField()));
			break;
		case IS_NOT_NULL:
			p = criteriaBuilder.isNotNull(root.get(condition.getField()));
			break;
		/*
		 * Operator for String type
		 */
		case IS_EMPTY:
			p = criteriaBuilder.equal(root.get(condition.getField()), "");
			break;
		case IS_NOT_EMPTY:
			p = criteriaBuilder.notEqual(root.get(condition.getField()), "");
			break;
		case CONTAINS:
			p = criteriaBuilder.like(root.get(condition.getField()).as(String.class), "%" + condition.getValue() + "%");
			break;
		case NOT_CONTAINS:
			p = criteriaBuilder.notLike(root.get(condition.getField()).as(String.class),
					"%" + condition.getValue() + "%");
			break;
		case START_WITH:
			p = criteriaBuilder.like(root.get(condition.getField()).as(String.class), condition.getValue() + "%");
			break;
		case END_WITH:
			p = criteriaBuilder.like(root.get(condition.getField()).as(String.class), "%" + condition.getValue());
			break;
		case GREATER_THAN:
			p = criteriaBuilder.greaterThan(root.get(condition.getField()).as(LocalDateTime.class),
					stringToLocalDateTime((String) condition.getValue()));
			break;
		case GREATER_THAN_OR_EQUAL_TO:
			p = criteriaBuilder.greaterThanOrEqualTo(root.get(condition.getField()).as(LocalDateTime.class),
					stringToLocalDateTime((String) condition.getValue()));
			break;
		case LESS_THAN:
			p = criteriaBuilder.lessThan(root.get(condition.getField()).as(LocalDateTime.class),
					stringToLocalDateTime((String) condition.getValue()));
			break;
		case LESSTHAN_OR_EQUAL_TO:
			p = criteriaBuilder.lessThanOrEqualTo(root.get(condition.getField()).as(LocalDateTime.class),
					stringToLocalDateTime((String) condition.getValue()));
			break;
		case JOIN:
			p = criteriaBuilder.equal(root.join(condition.getField()).get("id"), condition.getValue());
			break;
		default:
			p = criteriaBuilder.equal(root.get(condition.getField()), condition.getValue());
		}
		return p;
	}

	private LocalDateTime stringToLocalDateTime(String dateString) {
		return LocalDateTime.parse(dateString, DateTimeFormatter.ISO_DATE_TIME);
	}


}
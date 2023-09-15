/*
 * Copyright (c) 2020. @aek - (anicetkeric@gmail.com)
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *       http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 *
 */

package com.nxsol.bzcomposer.company.specs.pagination;

import com.nxsol.bzcomposer.company.specs.pagination.filter.FilterCondition;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


import java.util.List;


@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class SearchFilters {

    private List<FilterCondition> filterAndConditions;
    private List<FilterCondition> filterOrConditions;
	public SearchFilters(List<FilterCondition> filterAndConditions, List<FilterCondition> filterOrConditions) {
		super();
		this.filterAndConditions = filterAndConditions;
		this.filterOrConditions = filterOrConditions;
	}
	public List<FilterCondition> getFilterAndConditions() {
		return filterAndConditions;
	}
	public void setFilterAndConditions(List<FilterCondition> filterAndConditions) {
		this.filterAndConditions = filterAndConditions;
	}
	public List<FilterCondition> getFilterOrConditions() {
		return filterOrConditions;
	}
	public void setFilterOrConditions(List<FilterCondition> filterOrConditions) {
		this.filterOrConditions = filterOrConditions;
	}

}

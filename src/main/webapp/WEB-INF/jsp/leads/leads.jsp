<!doctype html>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en" data-layout="twocolumn" data-sidebar="light"
	data-sidebar-size="lg" data-sidebar-image="none"
	data-preloader="disable">

<%@include file="/WEB-INF/jsp/include/nhead.jsp"%>

<body>

	<!-- Begin page -->
	<div id="layout-wrapper">

		<%@include file="/WEB-INF/jsp/include/nheader.jsp"%>



		<!-- ============================================================== -->
		<!-- Start right Content here -->
		<!-- ============================================================== -->
		<div class="main-content">

			<div class="page-content">
				<div class="container-fluid">

					<!-- start page title -->
					<div class="row">
						<div class="col-12">
							<div
								class="page-title-box d-sm-flex align-items-center justify-content-between">
								<h4 class="mb-sm-0"><spring:message code="BzComposer.leads" /></h4>

								<div class="page-title-right">
									<ol class="breadcrumb m-0">
										<li class="breadcrumb-item"><a
											href="javascript: void(0);">Dashboards</a></li>
										<li class="breadcrumb-item active"><spring:message code="BzComposer.leads" /></li>
									</ol>
								</div>

							</div>
						</div>
					</div>
					<!-- end page title -->

					<div class="row">
						<div class="col-lg-12">
							<div class="card">
								<div class="card-header">
									<h5 class="card-title mb-0"><spring:message code="BzComposer.leads" /></h5>
									<div class="text-end"><a class="btn btn-info" href="/Lead"><spring:message code='BzComposer.global.new'/></a></div>
								</div>
								<div class="card-body">
									<table id="scroll-horizontal" class="table nowrap align-middle"
										style="width: 100%">
										<thead>

											<tr>
												<th scope="col" style="width: 10px;">
													<div class="form-check">
														<input class="form-check-input fs-15" type="checkbox"
															id="checkAll" value="option">
													</div>
												</th>
												<th><spring:message code="BzComposer.Customer.ID" /></th>
												<th><spring:message code="BzComposer.lead.status" /></th>
												<th><spring:message code="BzComposer.lead.source" /></th>
												<th><spring:message code="BzComposer.lead.tags" /></th>
												<th><spring:message code="BzComposer.global.phone" /></th>
												<th><spring:message code="BzComposer.global.email" /></th>
												<th><spring:message code="BzComposer.lead.website" /></th>
												<th><spring:message
														code="BzComposer.lead.datecontacted" /></th>
												<th><spring:message code="Bizcomposer.active" /></th>
												<th></th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${leadList}" var="objList" varStatus="loop">
												<tr id='${loop.index}$$'
													onclick="setRowId(${objList.leadId}, ${loop.index}, true);"
													ondblclick="goToCustomerBoard(${objList.leadId});">
													<th scope="row">
														<div class="form-check">
															<input class="form-check-input fs-15" type="checkbox"
																name="checkAll" value="option1">
														</div>
													</th>
													<td><a href="/Lead?LeadId=${objList.leadId}">${objList.leadId}</a>
													</td>
													<td><span class="badge badge-soft-info">${objList.status}</span></td>
													<td>${objList.source}</td>
													<td>${objList.tags}</td>
													<td>${objList.phone}</td>
													<td>${objList.email}</td>
													<td>${objList.website}</td>
													<td>${objList.contactDate}</td>
													<td><span class="badge bg-success">Active</span></td>
													<td>
														<div class="dropdown d-inline-block">
															<button class="btn btn-soft-secondary btn-sm dropdown"
																type="button" data-bs-toggle="dropdown"
																aria-expanded="false">
																<i class="ri-more-fill align-middle"></i>
															</button>
															<ul class="dropdown-menu dropdown-menu-end">
																<li><a href="/Lead?LeadId=${objList.leadId}" class="dropdown-item"><i
																		class="ri-eye-fill align-bottom me-2 text-muted"></i>
																		View</a></li>
																<li><a href="/Lead?LeadId=${objList.leadId}" class="dropdown-item edit-item-btn"><i
																		class="ri-pencil-fill align-bottom me-2 text-muted"></i>
																		Edit</a></li>
																<li><a class="dropdown-item remove-item-btn"> <i
																		class="ri-delete-bin-fill align-bottom me-2 text-muted"></i>
																		Delete
																</a></li>
															</ul>
														</div>
													</td>
												</tr>
											</c:forEach>

										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>


				</div>
				<!-- container-fluid -->
			</div>
			<!-- End Page-content -->

			<%@include file="/WEB-INF/jsp/include/nfooter.jsp"%>

		</div>
		<!-- end main content-->

	</div>
	<!-- END layout-wrapper -->



	<!--start back-to-top-->
	<button onclick="topFunction()" class="btn btn-danger btn-icon"
		id="back-to-top">
		<i class="ri-arrow-up-line"></i>
	</button>
	<!--end back-to-top-->

	<!--preloader-->
	<div id="preloader">
		<div id="status">
			<div class="spinner-border text-primary avatar-sm" role="status">
				<span class="visually-hidden">Loading...</span>
			</div>
		</div>
	</div>

	<%@include file="/WEB-INF/jsp/include/nscript.jsp"%>

</body>

</html>
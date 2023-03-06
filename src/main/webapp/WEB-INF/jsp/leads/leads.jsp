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


		<!-- removeNotificationModal -->
		<div id="removeLeadModal" class="modal fade zoomIn"
			tabindex="-1" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close" id="NotificationModalbtn-close"></button>
					</div>
					<div class="modal-body">
						<div class="mt-2 text-center">
							<lord-icon src="https://cdn.lordicon.com/gsqxdxog.json"
								trigger="loop" colors="primary:#495057,secondary:#f06548"
								style="width:100px;height:100px"></lord-icon>
							<div class="mt-4 pt-2 fs-15 mx-4 mx-sm-5">
								<h4 class="fw-bold">Are you sure ?</h4>
								<p class="text-muted mx-4 mb-0">Are you sure you want to
									remove this Notification ?</p>
							</div>
						</div>
						<div class="d-flex gap-2 justify-content-center mt-4 mb-2">
							<button type="button" class="btn w-sm btn-light" onclick="deletedLeadId = undefined;"
								data-bs-dismiss="modal">Close</button>
							<button type="button" class="btn w-sm btn-danger" onclick="deleteLead()"
								id="delete-notification">Yes, Delete It!</button>
						</div>
					</div>

				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<!-- /.modal -->

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
								<h4 class="mb-sm-0">
									<spring:message code="BzComposer.leads" />
								</h4>

								<div class="page-title-right">
									<ol class="breadcrumb m-0">
										<li class="breadcrumb-item"><a
											href="javascript: void(0);">Dashboards</a></li>
										<li class="breadcrumb-item active"><spring:message
												code="BzComposer.leads" /></li>
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
									<h5 class="card-title mb-0">
										<spring:message code="BzComposer.leads" />
									</h5>
									<div class="text-end">
										<a class="btn btn-info" href="/Lead"><spring:message
												code='BzComposer.global.new' /></a>
										 <button type="button" class="btn btn-success" onclick="alert('Change To Client');"><spring:message code='BzComposer.lead.changetoclient'/></button>
										 <button type="button" class="btn btn-success" onclick="alert('Add Follow up');" ><spring:message code='BzComposer.lead.addfollowup'/></button>
												
									</div>
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
												<tr>
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
																<li><a href="/Lead?LeadId=${objList.leadId}"
																	class="dropdown-item"><i
																		class="ri-eye-fill align-bottom me-2 text-muted"></i>
																		View</a></li>
																<li><a href="/Lead?LeadId=${objList.leadId}"
																	class="dropdown-item edit-item-btn"><i
																		class="ri-pencil-fill align-bottom me-2 text-muted"></i>
																		Edit</a></li>
																<li><a class="dropdown-item remove-item-btn" onclick="showDelete(${objList.leadId})"> <i
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
	
	
	<script type="text/javascript">
	
	var deletedLeadId = undefined;
	
	function showDelete(leadId){
		deletedLeadId = leadId;
		$('#removeLeadModal').modal('show');

	}
	
	function deleteLead(){
		if(deletedLeadId){
			window.location = "Lead/delete?LeadId="+deletedLeadId;
		}
		
	}
	</script>

</body>

</html>
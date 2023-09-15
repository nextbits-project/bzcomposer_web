<!doctype html>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en" data-layout="twocolumn" data-sidebar="light"
	data-sidebar-size="lg" data-sidebar-image="none"
	data-preloader="disable">

<%@include file="/WEB-INF/jsp/include/nhead.jsp"%>


<style>
.bootstrap-tagsinput {
	width: 100% !important;
}

.bootstrap-tagsinput .tag {
	color: #212529
}
</style>

<body>

	<!-- removeNotificationModal -->
	<div id="saveNotificationModal" class="modal fade zoomIn"
		tabindex="-1" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close" id="NotificationModalbtn-close"></button>
				</div>
				<div class="modal-body">
					<div class="mt-2 text-center">
						<lord-icon src="https://cdn.lordicon.com/lupuorrc.json"
							trigger="loop" colors="primary:#f7b84b,secondary:#f06548" 
							style="width:100px;height:100px"></lord-icon>
 						<div class="mt-4 pt-2 fs-15 mx-4 mx-sm-5">
							<h4 class="fw-bold">Are you sure ?</h4>
							<p class="text-muted mx-4 mb-0"><spring:message code="BzComposer.lead.savelead" /></p>
						</div>
					</div>
					<div class="d-flex gap-2 justify-content-center mt-4 mb-2">
						<button type="button" class="btn w-sm btn-light"
							data-bs-dismiss="modal"><spring:message code='BzComposer.global.cancel'/></button>
						<button type="button" class="btn w-sm btn-danger" onclick="saveLead()"
							id="delete-notification"><spring:message code='BzComposer.global.ok'/></button>
					</div>
				</div>

			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->
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
								<h4 class="mb-sm-0">
									<spring:message code="BzComposer.leads" />
								</h4>

								<div class="page-title-right">
									<ol class="breadcrumb m-0">
										<li class="breadcrumb-item"><a
											href="javascript: void(0);">Dashboards</a></li>
										<li class="breadcrumb-item active">CRM</li>
									</ol>
								</div>

							</div>
						</div>
					</div>
					<!-- end page title -->

					<div class="row">
						<div class="col-xxl-12">
							<div class="card">
								<div class="card-header align-items-center d-flex">
									<h4 class="card-title mb-0 flex-grow-1">
										<spring:message code="BzComposer.lead.addleadtitle" />
									</h4>

								</div>
								<!-- end card header -->

								<div class="card-body">
									<div class="live-preview">
										<form:form name="leadForm" method="post" id="frmNewLead"
											modelAttribute="leadDto">
											<form:input path="leadId" type="hidden" />
											<div class="row">
												<div class="col-md-4">
													<div class="mb-3">
														<label for="sstatus" class="form-label">State</label>
														<form:select id="sstatus" path="status"
															class="form-select" data-choices="data-choices"
															data-choices-sorting="true">
															<form:option value="">
																<spring:message code="BzComposer.ComboBox.Select" />
															</form:option>
															<form:option value="NEW">
																<spring:message code="BzComposer.lead.status.new" />
															</form:option>
															<form:option value="CONTACTED">
																<spring:message code="BzComposer.lead.status.contacted" />
															</form:option>
															<form:option value="QUALIFIED">
																<spring:message code="BzComposer.lead.status.qualified" />
															</form:option>
															<form:option value="WORKING">
																<spring:message code="BzComposer.lead.status.working" />
															</form:option>
															<form:option value="PROSENT">
																<spring:message
																	code="BzComposer.lead.status.proposalsent" />
															</form:option>
															<form:option value="CUSTCONVERT">
																<spring:message
																	code="BzComposer.lead.status.customerconverted" />
															</form:option>
														</form:select>



													</div>
												</div>
												<!--end col-->
												<div class="col-md-4">
													<div class="mb-3">
														<label for="source" class="form-label"><spring:message
																code="BzComposer.lead.source" /></label>
														<form:select path="source" class="form-select"
															data-choices="data-choices" data-choices-sorting="true">
															<form:option value="">
																<spring:message code="BzComposer.ComboBox.Select" />
															</form:option>
															<form:option value="FB">
																<spring:message code="BzComposer.lead.source.fb" />
															</form:option>
															<form:option value="GOOGLE">
																<spring:message code="BzComposer.lead.source.google" />
															</form:option>
															<form:option value="GOOGLE">
																<spring:message code="BzComposer.lead.source.sitemeaweb" />
															</form:option>
														</form:select>
													</div>
												</div>
												<!--end col-->
												<div class="col-md-4">
													<div class="mb-3">
														<label for="source" class="form-label"><spring:message
																code="BzComposer.lead.assignedId" /></label>
														<form:select path="assignedId" class="form-select"
															data-choices="data-choices" data-choices-sorting="true">
															<form:option value="">
																<spring:message code="BzComposer.ComboBox.Select" />
															</form:option>
														</form:select>
													</div>
												</div>

												<!--end col-->
												<div class="col-md-12">
													<div class="mb-3">
														<label for="tags" class="form-label"><spring:message
																code="BzComposer.lead.tags" /></label>
														<form:input path="tags" class="form-control"
															data-role="tagsinput" />
													</div>
												</div>
												<!--end col-->
												<div class="col-md-4">
													<div class="mb-3">
														<label for="title" class="form-label"><spring:message
																code="BzComposer.global.titlename" /></label>
														<form:select path="title" class="form-select">
															<form:options items="${titleList}" itemValue="value"
																itemLabel="label" />
														</form:select>
													</div>
												</div>
												<div class="col-md-4">
													<div class="mb-3">
														<label for="emailidInput" class="form-label"><spring:message
																code="BzComposer.global.firstname" /></label>
														<form:input path="firstName" size="20"
															class="form-control" />
													</div>
												</div>
												<!--end col-->
												<div class="col-md-4">
													<div class="mb-3">
														<label for="address1ControlTextarea" class="form-label"><spring:message
																code="BzComposer.global.lastname" /></label>
														<form:input path="lastName" size="20" class="form-control" />
													</div>
												</div>
												<!--end col-->
												<div class="col-md-12">
													<div class="mb-3">
														<label for="position" class="form-label"><spring:message
																code="BzComposer.lead.position" /></label>
														<form:input path="position" class="form-control" />
													</div>
												</div>
												<!--end col-->
												<div class="col-md-12">
													<div class="mb-3">
														<label for="company" class="form-label"><spring:message
																code="BzComposer.global.company" /></label>
														<form:input path="company" class="form-control" />
													</div>
												</div>
												<div class="col-md-12">
													<div class="mb-3">
														<label for="address1" class="form-label"><spring:message
																code="BzComposer.global.address1" /></label>
														<form:input path="address1" class="form-control" />
													</div>
												</div>

												<div class="col-md-12">
													<div class="mb-3">
														<label for="address2" class="form-label"><spring:message
																code="BzComposer.global.address2" /></label>
														<form:input path="address2" class="form-control" />
													</div>
												</div>

												<div class="col-md-4">
													<div class="mb-3">
														<label for="zipCode" class="form-label"> <spring:message
																code="BzComposer.global.zipcode" /></label>
														<form:input class="form-control" path="zipCode"
															onfocusout="loadAddressDetailsByZipcode(this.value, 1)"
															onkeypress="return numbersonly(event,this.value)" />
													</div>
												</div>

												<div class="col-md-4">
													<div class="mb-3">
														<label for="city" class="form-label"> <spring:message
																code="BzComposer.global.city" /></label>
														<form:select path="city" id="cityID" class="form-select">
															<form:option value="0">
																<spring:message code="BzComposer.register.selectcity" />
															</form:option>
															<c:forEach items="${cityList}" var="currObject">
																<form:option value="${currObject.cityId}">${currObject.cityName}</form:option>
															</c:forEach>
														</form:select>
													</div>
												</div>
												<div class="col-md-4">
													<div class="mb-3">
														<label for="city" class="form-label"> <spring:message
																code="BzComposer.global.state" /></label>
														<form:select path="state" id="stateID"
															onchange="loadCitiesByStateID(this.value, 1);"
															class="form-select">
															<form:option value="0">
																<spring:message code="BzComposer.register.selectstate" />
															</form:option>
															<c:forEach items="${stateList}" var="currObject">
																<form:option value="${currObject.stateId}">${currObject.state}</form:option>
															</c:forEach>
														</form:select>
														<form:hidden path="province" />
													</div>
												</div>
												<div class="col-md-4">
													<div class="mb-3">
														<label for="state" class="form-label"> <spring:message
																code="BzComposer.global.state" /></label>
														<form:select path="state" id="stateID"
															onchange="loadCitiesByStateID(this.value, 1);"
															class="form-select">
															<form:option value="0">
																<spring:message code="BzComposer.register.selectstate" />
															</form:option>
															<c:forEach items="${stateList}" var="currObject">
																<form:option value="${currObject.stateId}">${currObject.state}</form:option>
															</c:forEach>
														</form:select>
													</div>
												</div>
												<div class="col-md-4">
													<div class="mb-3">
														<label for="countryID" class="form-label"><spring:message
																code="BzComposer.global.country" /></label>
														<form:select path="country" id="countryID"
															class="form-select"
															onchange="loadStatesByCountryID(this.value, 1);">
															<form:option value="0">
																<spring:message code="BzComposer.register.selectcounry" />
															</form:option>
															<c:forEach items="${countryList}" var="currObject">
																<form:option data-code="${currObject.phoneCode}"
																	value="${currObject.countryId}">${currObject.countryName}</form:option>

															</c:forEach>
														</form:select>
													</div>
												</div>
												<div class="col-md-4">
													<div class="mb-3">
														<label for="state" class="form-label"><spring:message
																code="BzComposer.global.phone" /></label>
														<form:input path="phone" maxlength="16"
															class="form-control"
															onkeypress="return numbersonly(event,this.value)"
															onchange="validateUSAPhoneNumber(this, true);" />
													</div>
												</div>
												<div class="col-md-4">
													<div class="mb-3">
														<label for="email" class="form-label"><spring:message
																code="BzComposer.global.email" /></label>
														<form:input path="email" class="form-control" />

													</div>
												</div>
												<div class="col-md-3">
													<div class="mb-3">
														<label for="website" class="form-label"><spring:message
																code="BzComposer.lead.website" /></label>
														<form:input path="website" class="form-control" />
													</div>
												</div>

												<div class="col-md-4">
													<div class="mb-3">
														<label for="leadValue" class="form-label"><spring:message
																code="BzComposer.lead.leadvalue" /></label>
														<form:input path="leadValue" maxlength="16"
															class="form-control"
															onkeypress="return numbersonly(event,this.value)" />
													</div>
												</div>

												<div class="col-md-12">
													<div class="mb-3">
														<label for="description" class="form-label"><spring:message
																code="BzComposer.global.description" /></label>
														<form:input path="description" maxlength="16"
															class="form-control" />
													</div>
												</div>

												<div class="col-md-4" id="contactDateTr">
													<div class="mb-3">
														<label for="contactDate" class="form-label"><spring:message
																code="BzComposer.lead.datecontacted" /></label>
														<form:input data-provider="flatpickr"
															data-date-format="d M, Y" path="contactDate"
															class="form-control" readonly="true" />

													</div>
												</div>

												<div class="col-md-4">
													<div class="mb-3">
														<form:checkbox path="leadPublic" class="form-check-input" />
														<label for="leadPublic" class="form-label"><spring:message
																code="BzComposer.lead.chkpublic" /></label>

													</div>
												</div>


												<div class="col-md-4">
													<div class="mb-3">
														<form:checkbox class="form-check-input" id="contactToday"
															path="contactToday" />
														<label for="leadPublic" class="form-label"><spring:message
																code="BzComposer.lead.chkcontacttoday" /></label>
													</div>

												</div>


												<div class="col-lg-12">
													<div class="text-end">
														<a class="btn btn-info" href="/Leads"><spring:message
																code='BzComposer.global.cancel' /></a>
														<button type="button" 
															class="btn btn-primary" data-bs-toggle="modal"
															data-bs-target="#saveNotificationModal">
															<spring:message code='BzComposer.global.save' />
														</button>

													</div>
												</div>
												<!--end col-->
											</div>
											<!--end row-->
										</form:form>
									</div>

								</div>
							</div>
						</div>
						<!-- end col -->


					</div>
					<!--end row-->
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
		$(".bootstrap-tagsinput").tagsinput('items')

		var contactToday = "${leadDto.contactToday}";

		$(document).ready(function() {
			if (contactToday && contactToday === 'true') {
				$('#contactDateTr').hide();
			} else {
				$('#contactDateTr').show();
			}

			$("#contactToday").change(function() {
				if (this.checked) {
					$('#contactDateTr').hide();
				} else {
					$('#contactDateTr').show();
				}
			});

		});
		
		function saveLead(){
			document.forms["frmNewLead"].action = "Lead?tabid=AddLead";
			document.forms["frmNewLead"].submit();
		}
	</script>

</body>

</html>
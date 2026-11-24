<!DOCTYPE html>
<%@page import="in.co.rays.proj4.util.DataUtility"%>
<%@page import="in.co.rays.proj4.controller.CourseCtl"%>
<%@page import="in.co.rays.proj4.util.ServletUtility"%>
<html>
<head>
<meta charset="UTF-8">
<title>Course Details</title>
<style>
.custom-gradient-header {
	background: linear-gradient(135deg, #0d6efd 0%, #ffffff 50%, #0dcaf0 100%)
		!important;
}
.pointer-events-none {
	pointer-events: none;
	user-select: none;
}
</style>
</head>
<body class="">

	<jsp:useBean id="bean" class="in.co.rays.proj4.bean.CourseBean"
		scope="request"></jsp:useBean>

	<%
	String succ = ServletUtility.getSuccessMessage(request);
	String error = ServletUtility.getErrorMessage(request);
	String nameErrorMsg = ServletUtility.getErrorMessage("name", request);
	String descriptionErrorMsg = ServletUtility.getErrorMessage("description", request);
	String durationErrorMsg = ServletUtility.getErrorMessage("duration", request);
	%>

	<%@ include file="Header.jsp"%>
	<div class="container-fluid py-3 mb-5">
		<div class="row justify-content-center py-4">
			<div class="col-12 col-sm-10 col-md-8 col-lg-5 col-xl-4">

				<div class="bg-white border-0 rounded-3 shadow-lg overflow-hidden">
					<div class="custom-gradient-header px-5 py-5 text-center">
						<div
							class="d-inline-flex bg-white bg-opacity-10 p-3 border border-2 border-primary rounded-circle text-primary mb-2 shadow-sm fs-4 align-items-center justify-content-center"
							style="width: 60px; height: 60px;">
							<i class="bi bi-mortarboard-fill fw-bold"></i>
						</div>

						<h1
							class="h3 fw-extrabold text-dark m-0 tracking-tight text-uppercase"><%=bean != null && bean.getId() > 0 ? "Update Course" : "Add Course"%>
						</h1>
						<p class="text-secondary mb-0">Manage ORS academic courses</p>
					</div>

					<form action="<%=ORSView.COURSE_CTL%>" method="post"
						class="px-4 py-4 bg-white border-top border-light-subtle">
						<%
						if (succ != null && !succ.isEmpty()) {
						%>
						<div
							class="alert alert-success alert-dismissible fade show border-0 shadow-sm p-3 mb-4 rounded-3"
							role="alert">
							<div class="d-flex align-items-center gap-2">
								<i class="bi bi-check-circle-fill text-success fs-5"></i>
								<div class="fw-bold text-success-emphasis"><%=succ%></div>
							</div>
						</div>
						<%
						}
						%>
						<%
						if (error != null && !error.isEmpty()) {
						%>
						<div
							class="alert alert-danger alert-dismissible fade show border-0 shadow-sm p-3 mb-4 rounded-3"
							role="alert">
							<div class="d-flex align-items-center gap-2">
								<i class="bi bi-exclamation-triangle-fill text-danger fs-5"></i>
								<div class="fw-bold text-danger-emphasis"><%=error%></div>
							</div>
						</div>
						<%
						}
						%>
						<input type="hidden" name="id"
							value="<%=DataUtility.getStringData(bean.getId())%>">

						<table class="mb-3 w-100" align="center">

							<!-- Name Row -->
							<tr>
								<th scope="row"
									class="form-label small fw-bold text-primary tracking-wider pt-2 m-0"
									style="width: 30%; vertical-align: top;"><i
									class="bi bi-book-fill text-primary"></i> Name <span
									class="text-danger fw-bold">*</span></th>
								<td class="pb-3" style="vertical-align: top;"><input
									type="text" name="name" placeholder="enter course name"
									value="<%=DataUtility.getStringData(bean.getName())%>"
									class="form-control shadow-none rounded-3 py-2 fw-medium border-2 <%=nameErrorMsg != null && !nameErrorMsg.trim().equals("")
		? "border-danger bg-danger-subtle bg-opacity-25 text-danger"
		: "border-primary-subtle text-dark"%>">
									<%
									if (nameErrorMsg != null && !nameErrorMsg.trim().equals("")) {
									%> <span
									class="text-danger small mt-1 fw-bold ps-1 d-flex align-items-center gap-1 position-absolute">
										<i class="bi bi-x-circle-fill"></i> <%=ServletUtility.getErrorMessage("name", request)%>
								</span>
									<div class="pt-3"></div> <%
 }
 %></td>
							</tr>

							<!-- Description Row -->
							<tr>
								<th scope="row"
									class="form-label small fw-bold text-primary tracking-wider pt-2 m-0"
									style="vertical-align: top;"><i
									class="bi bi-text-left text-success"></i> Description <span
									class="text-danger fw-bold">*</span></th>
								<td class="pb-3" style="vertical-align: top;"><input
									type="text" name="description" placeholder="enter description"
									value="<%=DataUtility.getStringData(bean.getDescription())%>"
									class="form-control shadow-none rounded-3 py-2 fw-medium border-2 <%=descriptionErrorMsg != null && !descriptionErrorMsg.trim().equals("")
		? "border-danger bg-danger-subtle bg-opacity-25 text-danger"
		: "border-primary-subtle text-dark"%>">
									<%
									if (descriptionErrorMsg != null && !descriptionErrorMsg.trim().equals("")) {
									%> <span
									class="text-danger small mt-1 fw-bold ps-1 d-flex align-items-center gap-1 position-absolute">
										<i class="bi bi-x-circle-fill"></i> <%=ServletUtility.getErrorMessage("description", request)%>
								</span>
									<div class="pt-3"></div> <%
 }
 %></td>
							</tr>

							<!-- Duration Row -->
							<tr>
								<th scope="row"
									class="form-label small fw-bold text-primary tracking-wider pt-2 m-0"
									style="vertical-align: top;"><i
									class="bi bi-clock-fill text-info"></i> Duration <span
									class="text-danger fw-bold">*</span></th>
								<td class="pb-3" style="vertical-align: top;"><input
									type="text" name="duration" placeholder="enter duration"
									value="<%=DataUtility.getStringData(bean.getDuration())%>"
									class="form-control shadow-none rounded-3 py-2 fw-medium border-2 <%=durationErrorMsg != null && !durationErrorMsg.trim().equals("")
		? "border-danger bg-danger-subtle bg-opacity-25 text-danger"
		: "border-primary-subtle text-dark"%>">
									<%
									if (durationErrorMsg != null && !durationErrorMsg.trim().equals("")) {
									%> <span
									class="text-danger small mt-1 fw-bold ps-1 d-flex align-items-center gap-1 position-absolute">
										<i class="bi bi-x-circle-fill"></i> <%=ServletUtility.getErrorMessage("duration", request)%>
								</span>
									<div class="pt-3"></div> <%
 }
 %></td>
							</tr>

							<!-- Action Buttons Row -->
							<tr>
								<td colspan="2">
									<div class="row pt-4 justify-content-center">
										<div class="col-12 position-relative d-inline-block">
											<i
												class="bi bi-floppy-fill position-absolute top-50 translate-middle-y start-0 ps-4 pointer-events-none z-3 text-white fs-5"></i>
											<input type="submit" name="operation"
												value="<%=CourseCtl.OP_SAVE%>"
												class="btn btn-primary w-100 rounded-3 fw-bold shadow py-3 text-uppercase tracking-wide fs-6"
												style="padding-left: 2.7rem; padding-right: 2.5rem;">
										</div>
									</div>
								</td>
							</tr>

						</table>

					</form>
				</div>
			</div>
		</div>

	</div>

	<%@include file="Footer.jsp"%>
</body>
</html>

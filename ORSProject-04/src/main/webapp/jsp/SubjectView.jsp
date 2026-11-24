<%@page import="in.co.rays.proj4.util.HTMLUtility"%>
<%@page import="in.co.rays.proj4.bean.CourseBean"%>
<%@page import="java.util.List"%>
<%@page import="in.co.rays.proj4.util.DataUtility"%>
<%@page import="in.co.rays.proj4.controller.SubjectCtl"%>
<%@page import="in.co.rays.proj4.util.ServletUtility"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Subject Details</title>
<style>
/* Custom linear gradient matching Add Role header */
.custom-gradient-header {
	background: linear-gradient(135deg, #0d6efd 0%, #ffffff 50%, #0dcaf0 100%)
		!important;
}
/* Label icons using Bootstrap Icons font */
th.icon-course::before {
	font-family: "bootstrap-icons" !important;
	margin-right: 6px;
	color: #0d6efd;
}
th.icon-desc::before {
	font-family: "bootstrap-icons" !important;
	margin-right: 6px;
	color: #198754;
}
/* Styles HTMLUtility <select> tag to match Bootstrap 5 form-control */
select[name="courseId"] {
	display: block;
	width: 100%;
	padding: 0.5rem 0.75rem;
	font-size: 1rem;
	font-weight: 500;
	line-height: 1.5;
	color: #212529;
	background-color: #fff;
	border: 2px solid #cfe2ff;
	border-radius: 0.5rem;
	box-shadow: none;
}
select[name="courseId"]:focus {
	border-color: #86b7fe;
	outline: 0;
}
</style>
</head>
<body class="">
	<jsp:useBean id="bean" class="in.co.rays.proj4.bean.SubjectBean"
		scope="request"></jsp:useBean>
	<%
	String succ = ServletUtility.getSuccessMessage(request);
	String error = ServletUtility.getErrorMessage(request);
	List<CourseBean> courseList = (List) request.getAttribute("courseList");

	String courseIdErrorMsg = ServletUtility.getErrorMessage("courseId", request);
	String descriptionErrorMsg = ServletUtility.getErrorMessage("description", request);
	%>
	<%@include file="Header.jsp"%>
	<div align="center" class="container-fluid py-3 mb-5">
		<div
			class="custom-gradient-header px-5 py-5 text-center rounded-top-3 shadow-sm col-12 col-sm-10 col-md-8 col-lg-5 col-xl-4">
			<div
				class="d-inline-flex bg-white bg-opacity-10 p-3 border border-2 border-primary rounded-circle text-primary mb-2 shadow-sm fs-4 align-items-center justify-content-center"
				style="width: 60px; height: 60px;">
				<i class="bi bi-book-fill text-primary"></i>
			</div>
			<h1 class="h3 fw-extrabold text-dark m-0 tracking-tight text-uppercase"><%=bean != null && bean.getId() > 0 ? "Update Subject" : "Add Subject"%></h1>
			<p class="text-secondary mb-0">Manage ORS academic subjects</p>
		</div>
		<h3 style="color: green"
			class="col-12 col-sm-10 col-md-8 col-lg-5 col-xl-4 bg-white m-0 px-4 fs-6 fw-bold <%=succ != null && !succ.isEmpty() ? "pt-3" : ""%>"><%=succ%></h3>
		<h3 style="color: red"
			class="col-12 col-sm-10 col-md-8 col-lg-5 col-xl-4 bg-white m-0 px-4 fs-6 fw-bold <%=error != null && !error.isEmpty() ? "pt-3" : ""%>"><%=error%></h3>
		<form action="<%=ORSView.SUBJECT_CTL%>" method="post"
			class="col-12 col-sm-10 col-md-8 col-lg-5 col-xl-4 px-4 py-4 bg-white border-top border-light-subtle rounded-bottom-3 shadow-lg">

			<table class="mb-3 w-100" align="center">
				<tr>
					<th
						class="bi-book-fill icon-course form-label small fw-bold text-primary tracking-wider pt-2 m-0 text-start"
						style="width: 34%; vertical-align: top;">Course Name <font
						color="red" class="text-danger fw-bold">*</font></th>
					<td class="pb-3" style="vertical-align: top;"><%=HTMLUtility.getList("courseId", DataUtility.getStringData(bean.getCourseId()), courseList)%></td>
					<td style="color: red; vertical-align: top;"
						class="text-danger small fw-bold pt-2 ps-2"><%=ServletUtility.getErrorMessage("courseId", request)%></td>
				</tr>

				<tr>
					<th
						class="bi-text-left icon-desc form-label small fw-bold text-primary tracking-wider pt-2 m-0 text-start"
						style="vertical-align: top;">Description <font color="red"
						class="text-danger fw-bold">*</font></th>
					<td class="pb-3" style="vertical-align: top;"><input
						type="text" name="description" placeholder="enter description"
						value="<%=DataUtility.getStringData(bean.getDescription())%>"
						class="form-control shadow-none rounded-3 py-2 fw-medium border-2 <%=descriptionErrorMsg != null && !descriptionErrorMsg.trim().equals("")
		? "border-danger bg-danger-subtle bg-opacity-25 text-danger"
		: "border-primary-subtle text-dark"%>"></td>
					<td style="color: red; vertical-align: top;"
						class="text-danger small fw-bold pt-2 ps-2"><%=ServletUtility.getErrorMessage("description", request)%>
					</td>
				</tr>

				<tr>
					<td><input type="hidden" name="id" value="<%=bean.getId()%>"></td>
				</tr>

				<tr>
					<th></th>
					<td class="pt-3"><input type="submit" name="operation"
						value="<%=SubjectCtl.OP_SAVE%>"
						class="btn btn-primary w-100 rounded-3 fw-bold shadow py-3 text-uppercase tracking-wide fs-6"></td>
				</tr>
			</table>
		</form>
	</div>
	<%@include file="Footer.jsp"%>
</body>
</html>

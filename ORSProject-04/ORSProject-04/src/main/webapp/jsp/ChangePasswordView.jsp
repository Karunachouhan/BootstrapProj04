<%@page import="in.co.rays.proj4.controller.ChangePasswordCtl"%>
<%@page import="in.co.rays.proj4.util.ServletUtility"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Change Password</title>
<style>
/* Custom linear gradient matching Add Role header */
.custom-gradient-header {
	background: linear-gradient(135deg, #0d6efd 0%, #ffffff 50%, #0dcaf0 100%)
		!important;
}
</style>
</head>
<body class="">
	<%@include file="Header.jsp"%>

	<%
	String succ = ServletUtility.getSuccessMessage(request);
	String error = ServletUtility.getErrorMessage(request);

	String loginErrorMsg = ServletUtility.getErrorMessage("login", request);
	String oldPasswordErrorMsg = ServletUtility.getErrorMessage("oldPassword", request);
	String newPasswordErrorMsg = ServletUtility.getErrorMessage("newPassword", request);
	%>
	<div align="center" class="container-fluid py-3 mb-5">
		<h1
	class="h3 fw-extrabold text-dark m-0 tracking-tight text-uppercase custom-gradient-header px-5 py-5 text-center rounded-top-3 shadow-sm col-12 col-sm-10 col-md-8 col-lg-5 col-xl-4">Change
	Password
	<small class="d-block text-muted fs-6 fw-normal mt-2" style="text-transform: none;">Update your ORS account password</small>
</h1>
		<h3 style="color: green"
			class="col-12 col-sm-10 col-md-8 col-lg-5 col-xl-4 bg-white m-0 px-4 fs-6 fw-bold <%=succ != null && !succ.isEmpty() ? "pt-3" : ""%>"><%=succ%></h3>
		<h3 style="color: red"
			class="col-12 col-sm-10 col-md-8 col-lg-5 col-xl-4 bg-white m-0 px-4 fs-6 fw-bold <%=error != null && !error.isEmpty() ? "pt-3" : ""%>"><%=error%></h3>
		<form action="<%=ORSView.CHANGE_PASSWORD_CTL%>" method="post"
			class="col-12 col-sm-10 col-md-8 col-lg-5 col-xl-4 px-4 py-4 bg-white border-top border-light-subtle rounded-bottom-3 shadow-lg">

			<table class="mb-3 w-100" align="center">
				<tr>
					<th
						class="form-label small fw-bold text-primary tracking-wider pt-2 m-0 text-start"
						style="width: 32%; vertical-align: top;">Login</th>
					<td class="pb-3" style="vertical-align: top;"><input
						type="email" name="login" placeholder="enter your email" value=""
						class="form-control shadow-none rounded-3 py-2 fw-medium border-2 <%=loginErrorMsg != null && !loginErrorMsg.trim().equals("")
		? "border-danger bg-danger-subtle bg-opacity-25 text-danger"
		: "border-primary-subtle text-dark"%>"></td>
					<td style="color: red; vertical-align: top;"
						class="text-danger small fw-bold pt-2 ps-2"><%=ServletUtility.getErrorMessage("login", request)%></td>
				</tr>

				<tr>
					<th
						class="form-label small fw-bold text-primary tracking-wider pt-2 m-0 text-start"
						style="vertical-align: top;">Password</th>
					<td class="pb-3" style="vertical-align: top;"><input
						type="password" name="oldPassword"
						placeholder="enter your old password" value=""
						class="form-control shadow-none rounded-3 py-2 fw-medium border-2 <%=oldPasswordErrorMsg != null && !oldPasswordErrorMsg.trim().equals("")
		? "border-danger bg-danger-subtle bg-opacity-25 text-danger"
		: "border-primary-subtle text-dark"%>"></td>
					<td style="color: red; vertical-align: top;"
						class="text-danger small fw-bold pt-2 ps-2"><%=ServletUtility.getErrorMessage("oldPassword", request)%></td>
				</tr>

				<tr>
					<th
						class="form-label small fw-bold text-primary tracking-wider pt-2 m-0 text-start"
						style="vertical-align: top;">New Password</th>
					<td class="pb-3" style="vertical-align: top;"><input
						type="password" name="newPassword"
						placeholder="enter your new password" value=""
						class="form-control shadow-none rounded-3 py-2 fw-medium border-2 <%=newPasswordErrorMsg != null && !newPasswordErrorMsg.trim().equals("")
		? "border-danger bg-danger-subtle bg-opacity-25 text-danger"
		: "border-primary-subtle text-dark"%>"></td>
					<td style="color: red; vertical-align: top;"
						class="text-danger small fw-bold pt-2 ps-2"><%=ServletUtility.getErrorMessage("newPassword", request)%></td>
				</tr>

				<tr>
					<th></th>
					<td class="pt-3"><input type="submit" name="operation"
						value="<%=ChangePasswordCtl.OP_SAVE%>"
						class="btn btn-primary w-100 rounded-3 fw-bold shadow py-3 text-uppercase tracking-wide fs-6"></td>
				</tr>
			</table>
		</form>
	</div>
	<%@include file="Footer.jsp"%>
</body>
</html>

<!DOCTYPE html>
<%@page import="in.co.rays.proj4.controller.LoginCtl"%>
<%@page import="in.co.rays.proj4.util.ServletUtility"%>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<style>
/* Custom linear gradient starting with Blue (bg-primary), passing through White, ending in Light Blue (bg-info) */
.custom-gradient-header {
	background: linear-gradient(135deg, #0d6efd 0%, #ffffff 50%, #0dcaf0 100%)
		!important;
}
/* Ensures smooth cursor pass-through for absolute-positioned icon overlays */
.pointer-events-none {
	pointer-events: none;
	user-select: none;
}
</style>
</head>
<body class="">

	<%
	String succ = ServletUtility.getSuccessMessage(request);
	String error = ServletUtility.getErrorMessage(request);
	String loginErrorMsg = ServletUtility.getErrorMessage("login", request);
	String passwordErrorMsg = ServletUtility.getErrorMessage("password", request);
	%>

	<%@ include file="Header.jsp"%>
	
	<div class="container-fluid py-4 mb-5">
		<div class="row justify-content-center pb-4">
			<div class="col-12 col-sm-10 col-md-8 col-lg-5 col-xl-4">

				<div class="bg-white border-0 rounded-3 shadow-lg overflow-hidden">
					<div class="custom-gradient-header px-4 py-4 text-center">
						<div
							class="d-inline-flex bg-white bg-opacity-10 p-3 border border-2 border-primary rounded-circle text-primary mb-2 shadow-sm fs-4 align-items-center justify-content-center"
							style="width: 60px; height: 60px;">
							<i class="bi bi-box-arrow-in-right" style="padding-right: 5px;"></i>
						</div>

						<h1 class="h3 fw-extrabold text-dark m-0 tracking-tight text-uppercase">
							<%=ms.get("login.title")%>
						</h1>
						<p class="text-muted small mb-0 mt-1">Welcome back! Please login to continue.</p>
					</div>

					<form action="<%=ORSView.LOGIN_CTL%>" method="post"
						class="px-4 py-4 bg-white border-top border-light-subtle">
						
						<%
						if (succ != null && !succ.isEmpty()) {
						%>
						<div
							class="alert alert-success alert-dismissible fade show border-0 shadow-sm p-2 mb-4 rounded-3"
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
							class="alert alert-danger alert-dismissible fade show border-0 shadow-sm p-2 mb-4 rounded-3"
							role="alert">
							<div class="d-flex align-items-center gap-2">
								<i class="bi bi-exclamation-triangle-fill text-danger fs-5"></i>
								<div class="fw-bold text-danger-emphasis"><%=error%></div>
							</div>
						</div>
						<%
						}
						%>

						<table class="mb-3 w-100" align="center">

							<!-- Login Row -->
							<tr>
								<th scope="row"
									class="form-label small fw-bold text-primary tracking-wider pt-2 m-0"
									style="width: 30%; vertical-align: top;"><i
										class="bi bi-person-circle text-primary"></i>
									<%=ms.get("login.login")%><font color="red">*</font>
								</th>
								<td class="pb-3" style="vertical-align: top;">
									<input type="text" name="login"
									placeholder="enter you login" value=""
									class="form-control shadow-none rounded-3 py-2 fw-medium border-2 <%=loginErrorMsg != null && !loginErrorMsg.trim().equals("")
		? "border-danger bg-danger-subtle bg-opacity-25 text-danger"
		: "border-primary-subtle text-dark"%>">
									<%
									if (loginErrorMsg != null && !loginErrorMsg.trim().equals("")) {
									%> 
									<span class="text-danger small mt-1 fw-bold ps-1 d-flex align-items-center gap-1 position-absolute">
										<i class="bi bi-x-circle-fill"></i> <%=ServletUtility.getErrorMessage("login", request)%>
									</span>
									<div class="pt-3"></div>
									<%
									}
									%>
								</td>
							</tr>

							<!-- Password Row -->
							<tr>
								<th scope="row"
									class="form-label small fw-bold text-primary tracking-wider pt-2 m-0"
									style="width: 30%; vertical-align: top;"><i
										class="bi bi-lock-fill text-primary"></i>
									<%=ms.get("login.password")%><font color="red">*</font>
								</th>
								<td class="pb-3" style="vertical-align: top;">
									<input type="password" name="password"
									placeholder="enter you password" value=""
									class="form-control shadow-none rounded-3 py-2 fw-medium border-2 <%=passwordErrorMsg != null && !passwordErrorMsg.trim().equals("")
		? "border-danger bg-danger-subtle bg-opacity-25 text-danger"
		: "border-primary-subtle text-dark"%>">
									<%
									if (passwordErrorMsg != null && !passwordErrorMsg.trim().equals("")) {
									%> 
									<span class="text-danger small mt-1 fw-bold ps-1 d-flex align-items-center gap-1 position-absolute">
										<i class="bi bi-x-circle-fill"></i> <%=ServletUtility.getErrorMessage("password", request)%>
									</span>
									<div class="pt-3"></div>
									<%
									}
									%>
								</td>
							</tr>

							<!-- Sign In Button Row -->
							<tr>
								<td colspan="2">
									<div class="row pt-4 justify-content-center">
										<div class="col-12 position-relative d-inline-block">
											<i class="bi bi-box-arrow-in-right position-absolute top-50 translate-middle-y start-0 ps-4 pointer-events-none z-3 text-white fs-5"></i>
											<input type="submit" name="operation"
												value="<%=LoginCtl.OP_SIGN_IN%>"
												class="btn btn-primary w-100 rounded-3 fw-bold shadow py-3 text-uppercase tracking-wide fs-6"
												style="padding-left: 2.7rem; padding-right: 2.5rem;">
										</div>
									</div>
								</td>
							</tr>

							<!-- Forget Password Link Row -->
							<tr>
								<td colspan="2" class="text-center pt-3">
									<a href="<%=ORSView.FORGET_PASSWORD_CTL%>"
									   class="text-decoration-none small fw-bold text-primary">
										ForgetPassword
									</a>
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

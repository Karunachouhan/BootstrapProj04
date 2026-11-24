
<!DOCTYPE html>

<%@page import="in.co.rays.proj4.util.HTMLUtility"%>
<%@page import="java.util.HashMap"%>
<%@page import="in.co.rays.proj4.util.DataUtility"%>
<%@page import="in.co.rays.proj4.util.ServletUtility"%>
<%@page import="in.co.rays.proj4.controller.UserRegistrationCtl"%>

<html>

<head>

<meta charset="ISO-8859-1">

<meta name="viewport" content="width=device-width, initial-scale=1">

<title>User Registration</title>

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

/* Ensures HTMLUtility dropdown matches Bootstrap form-select styling seamlessly */
select {
	display: block;
	width: 100%;
	padding: 0.5rem 0.75rem;
	font-size: 1rem;
	font-weight: 500;
	line-height: 1.5;
	color: #212529;
	background-color: #fff;
	border: 2px solid #9ec5fe;
	border-radius: 0.5rem;
	outline: none;
}

/* Registration page spacing only - Footer.jsp is not changed */
.registration-page {
	padding-bottom: 140px !important;
}

/* Keep the registration card completely above the footer */
.registration-card {
	margin-bottom: 40px !important;
}
</style>

</head>

<body>

	<jsp:useBean id="bean" class="in.co.rays.proj4.bean.UserBean"
		scope="request"></jsp:useBean>

	<%
	String succ = ServletUtility.getSuccessMessage(request);

	String error = ServletUtility.getErrorMessage(request);

	HashMap<String, String> map = new HashMap<String, String>();

	map.put("Male", "Male");
	map.put("Female", "Female");
	map.put("Other", "Other");

	String firstNameErrorMsg = ServletUtility.getErrorMessage("firstName", request);

	String lastNameErrorMsg = ServletUtility.getErrorMessage("lastName", request);

	String loginErrorMsg = ServletUtility.getErrorMessage("login", request);

	String passwordErrorMsg = ServletUtility.getErrorMessage("password", request);

	String confirmPasswordErrorMsg = ServletUtility.getErrorMessage("confirmPassword", request);

	String genderErrorMsg = ServletUtility.getErrorMessage("gender", request);

	String dobErrorMsg = ServletUtility.getErrorMessage("dob", request);
	%>

	<%@ include file="Header.jsp"%>


	<!-- Main Registration Container -->

	<div class="container-fluid py-1">

		<div class="row justify-content-center">

			<div class="col-12 col-sm-12 col-md-11 col-lg-6">

				<form action="<%=ORSView.USER_REGISTRATION_CTL%>" method="post">

					<!-- Registration Card -->

					<div class="card border-0 shadow-lg rounded-3 overflow-hidden mb-5">

						<!-- Registration Header -->


						<div class="custom-gradient-header px-3 py-3 text-center">

							<div
								class="d-inline-flex bg-white bg-opacity-10 p-3 border border-2 border-primary rounded-circle text-primary mb-2 shadow-sm fs-4 align-items-center justify-content-center"
								style="width: 60px; height: 60px;">

								<i class="bi bi-person-plus-fill fw-bold"></i>

							</div>

							<h1
								class="h3 fw-extrabold text-dark m-0 tracking-tight text-uppercase">

								<%=ms.get("registration.title")%>

							</h1>
							<small class="text-muted"> Create your ORS account </small>

						</div>


						<!-- Registration Body -->

						<div class="card-body p-3 px-md-5 pt-md-5 pb-md-3">


							<!-- Success Message -->

							<%
							if (succ != null && !succ.isEmpty()) {
							%>

							<div class="alert alert-success border-0 shadow-sm rounded-3">

								<i class="bi bi-check-circle-fill me-2"></i>

								<%=succ%>

							</div>

							<%
							}
							%>


							<!-- Error Message -->

							<%
							if (error != null && !error.isEmpty()) {
							%>

							<div class="alert alert-danger border-0 shadow-sm rounded-3">

								<i class="bi bi-exclamation-triangle-fill me-2"></i>

								<%=error%>

							</div>

							<%
							}
							%>


							<div class="row g-4">


								<!-- First Name -->

								<div class="col-md-6 mt-0">

									<label class="form-label  fw-bold fs-6"> <i
										class="bi bi-person-fill text-primary me-1"></i> <%=ms.get("registration.firstName")%>

										<span class="text-danger">*</span>

									</label> <input type="text" name="firstName"
										value="<%=DataUtility.getStringData(bean.getFirstName())%>"
										placeholder="Enter your first name"
										class="form-control form-control-sm
                                        <%=firstNameErrorMsg != null && !firstNameErrorMsg.trim().equals("") ? "is-invalid" : ""%>">

									<%
									if (firstNameErrorMsg != null && !firstNameErrorMsg.trim().equals("")) {
									%>

									<div class="invalid-feedback d-block fw-bold">

										<i class="bi bi-x-circle-fill"></i>

										<%=firstNameErrorMsg%>

									</div>

									<%
									}
									%>

								</div>


								<!-- Last Name -->

								<div class="col-md-6 mt-0">

									<label class="form-label fw-bold fs-6"> <i
										class="bi bi-person-fill text-primary me-1"></i> <%=ms.get("registration.lastName")%>

										<span class="text-danger">*</span>

									</label> <input type="text" name="lastName"
										value="<%=DataUtility.getStringData(bean.getLastName())%>"
										placeholder="Enter your last name"
										class="form-control form-control-sm
                                        <%=lastNameErrorMsg != null && !lastNameErrorMsg.trim().equals("") ? "is-invalid" : ""%>">

									<%
									if (lastNameErrorMsg != null && !lastNameErrorMsg.trim().equals("")) {
									%>

									<div class="invalid-feedback d-block fw-bold">

										<i class="bi bi-x-circle-fill"></i>

										<%=lastNameErrorMsg%>

									</div>

									<%
									}
									%>

								</div>


								<!-- Login -->

								<div class="col-12 mt-2">

									<label class="form-label fw-bold fs-6"> <i
										class="bi bi-person-circle text-primary me-1"></i> <%=ms.get("registration.login")%>

										<span class="text-danger">*</span>

									</label> <input type="text" name="login"
										value="<%=DataUtility.getStringData(bean.getLogin())%>"
										placeholder="Enter valid login ID"
										class="form-control form-control-sm
                                        <%=loginErrorMsg != null && !loginErrorMsg.trim().equals("") ? "is-invalid" : ""%>">

									<%
									if (loginErrorMsg != null && !loginErrorMsg.trim().equals("")) {
									%>

									<div class="invalid-feedback d-block fw-bold">

										<i class="bi bi-x-circle-fill"></i>

										<%=loginErrorMsg%>

									</div>

									<%
									}
									%>

								</div>


								<!-- Password -->

								<div class="col-md-6 mt-2">

									<label class="form-label fw-bold fs-6"> <i
										class="bi bi-lock-fill text-primary me-1"></i> <%=ms.get("registration.password")%>

										<span class="text-danger">*</span>

									</label> <input type="password" name="password"
										placeholder="Enter password"
										class="form-control form-control-sm
                                        <%=passwordErrorMsg != null && !passwordErrorMsg.trim().equals("") ? "is-invalid" : ""%>">

									<%
									if (passwordErrorMsg != null && !passwordErrorMsg.trim().equals("")) {
									%>

									<div class="invalid-feedback d-block fw-bold">

										<i class="bi bi-x-circle-fill"></i>

										<%=passwordErrorMsg%>

									</div>

									<%
									}
									%>

								</div>


								<!-- Confirm Password -->

								<div class="col-md-6 mt-2">

									<label class="form-label fw-bold fs-6"> <i
										class="bi bi-shield-lock-fill text-primary me-1"></i> <%=ms.get("registration.confirmPassword")%>

										<span class="text-danger">*</span>

									</label> <input type="password" name="confirmPassword"
										placeholder="Re-enter your password"
										class="form-control form-control-sm
                                        <%=confirmPasswordErrorMsg != null && !confirmPasswordErrorMsg.trim().equals("") ? "is-invalid" : ""%>">

									<%
									if (confirmPasswordErrorMsg != null && !confirmPasswordErrorMsg.trim().equals("")) {
									%>

									<div class="invalid-feedback d-block fw-bold">

										<i class="bi bi-x-circle-fill"></i>

										<%=confirmPasswordErrorMsg%>

									</div>

									<%
									}
									%>

								</div>


								<!-- Gender -->

								<div class="col-md-6 mt-2">

									<label class="form-label fw-bold fs-6"> <i
										class="bi bi-gender-ambiguous text-primary me-1"></i> <%=ms.get("registration.gender")%>

										<span class="text-danger">*</span>

									</label>

									<%=HTMLUtility.getList("gender", DataUtility.getStringData(bean.getGender()), map)%>

									<%
									if (genderErrorMsg != null && !genderErrorMsg.trim().equals("")) {
									%>

									<div class="text-danger small fw-bold mt-1">

										<i class="bi bi-x-circle-fill"></i>

										<%=genderErrorMsg%>

									</div>

									<%
									}
									%>

								</div>


								<!-- Date Of Birth -->

								<div class="col-md-6 mt-2">

									<label class="form-label fw-bold fs-6"> <i
										class="bi bi-calendar-event-fill text-primary me-1"></i> <%=ms.get("registration.dob")%>

										<span class="text-danger">*</span>

									</label> <input type="text" name="dob"
										value="<%=DataUtility.getStringData(bean.getDob())%>"
										placeholder="Enter your date of birth"
										class="form-control form-control-sm
                                        <%=dobErrorMsg != null && !dobErrorMsg.trim().equals("") ? "is-invalid" : ""%>">

									<%
									if (dobErrorMsg != null && !dobErrorMsg.trim().equals("")) {
									%>

									<div class="invalid-feedback d-block fw-bold">

										<i class="bi bi-x-circle-fill"></i>

										<%=dobErrorMsg%>

									</div>

									<%
									}
									%>

								</div>


								<!-- Signup Button -->

								<div class="col-12 text-center pt-3">
									<label class="btn btn-primary btn-sm px-5 shadow"
										style="font-size: 15px;"> <i
										class="bi bi-person-plus-fill me-2"></i> <input type="submit"
										name="operation" value="<%=UserRegistrationCtl.OP_SIGN_UP%>"
										class="bg-transparent border-0 text-white"> </input>
									</label>

								</div>


							</div>

						</div>

					</div>

				</form>

			</div>

		</div>

	</div>


	<%@include file="Footer.jsp"%>


</body>

</html>

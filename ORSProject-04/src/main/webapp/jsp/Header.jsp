<%@page import="in.co.rays.proj4.util.MessageSource"%>

<%@page import="in.co.rays.proj4.bean.RoleBean"%>

<%@page import="in.co.rays.proj4.controller.ORSView"%>

<%@page import="in.co.rays.proj4.bean.UserBean"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Insert title here</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>

<style type="text/css">
html, body {
	margin: 0;
	padding: 0;
	height: 100%;
	width: 100%;
}

body {
	background: linear-gradient(rgba(240, 244, 255, 0.75),
		rgba(232, 240, 254, 0.8)),
		url('<%=request.getContextPath()%>/img/applicatin-bg.png') center/cover
		no-repeat fixed;
	position: relative;
}
</style>

</head>

<body>

	<%
	MessageSource ms = MessageSource.getInstance();

	UserBean user = (UserBean) session.getAttribute("user");

	String role = (String) session.getAttribute("role");

	boolean isLogin = user != null;

	String welcomeMsg = ms.get("header.hii");

	String locale = ms.getLanguage();

	boolean isAdmin = isLogin && user.getRoleId() == RoleBean.ADMIN;
	boolean isStudent = isLogin && user.getRoleId() == RoleBean.STUDENT;
	boolean isCollege = isLogin && user.getRoleId() == RoleBean.COLLEGE;
	boolean isKiosk = isLogin && user.getRoleId() == RoleBean.KIOSK;
	boolean isFaculty = isLogin && user.getRoleId() == RoleBean.FACULTY;
	%>


	<!-- ================= BOOTSTRAP 5 NAVBAR ================= -->

	<!-- py-3 = more padding above and below (was py-2). Use py-4 for even more. -->

	<nav class="navbar navbar-expand-lg navbar-light px-3 py-3"
		style="background: linear-gradient(135deg, #0d2137 0%, #1565c0 100%); min-height: 58px; box-shadow: 0 6px 20px rgba(0, 0, 0, 0.45);">

		<!-- Left: B logo -->

		<a class="navbar-brand text-white" href="<%=ORSView.WELCOME_CTL%>">
			<img src="<%=request.getContextPath()%>/img/headerLogo.jpg"
			alt="logo" width="120" height="35"
			class="d-inline-block align-text-top">
		</a>

		<div class="container-fluid ms-5">

			<!-- Welcome heading (smaller now: fs-5 instead of h2 size) -->

			<%
			if (isLogin) {
			%>

			<div class="collapse navbar-collapse" id="orsNavbar">

				<ul class="navbar-nav flex-wrap me-auto align-items-lg-center">

					<%
					if (isAdmin) {
					%>

					<!-- Role -->
					<li class="nav-item me-1 my-1">

						<div class="btn-group">

							<a class="btn btn-info btn-sm dropdown-toggle" href="#"
								role="button" data-bs-toggle="dropdown" aria-expanded="false">
								Role </a>

							<ul class="dropdown-menu">

								<li><a class="dropdown-item" href="<%=ORSView.ROLE_CTL%>">
										<%=ms.get("header.addRole")%>
								</a></li>

								<li><a class="dropdown-item"
									href="<%=ORSView.ROLE_LIST_CTL%>"> <%=ms.get("header.roleList")%>
								</a></li>

							</ul>

						</div>

					</li>

					<!-- User -->

					<li class="nav-item me-1 my-1">

						<div class="btn-group">

							<a class="btn btn-info btn-sm dropdown-toggle" href="#"
								role="button" data-bs-toggle="dropdown" aria-expanded="false">
								User </a>


							<ul class="dropdown-menu">

								<li><a class="dropdown-item" href="<%=ORSView.USER_CTL%>">
										<%=ms.get("header.addUser")%>
								</a></li>

								<li><a class="dropdown-item"
									href="<%=ORSView.USER_LIST_CTL%>"> <%=ms.get("header.userList")%>
								</a></li>

							</ul>

						</div>

					</li>

					<!-- College -->

					<li class="nav-item me-1 my-1">

						<div class="btn-group">

							<a class="btn btn-info btn-sm dropdown-toggle" href="#"
								role="button" data-bs-toggle="dropdown" aria-expanded="false">
								College </a>


							<ul class="dropdown-menu">

								<li><a class="dropdown-item"
									href="<%=ORSView.COLLEGE_CTL%>"> <%=ms.get("header.addCollege")%>
								</a></li>

								<li><a class="dropdown-item"
									href="<%=ORSView.COLLEGE_LIST_CTL%>"> <%=ms.get("header.collegeList")%>
								</a></li>

							</ul>

						</div>

					</li>

					<!-- Course -->

					<li class="nav-item me-1 my-1">

						<div class="btn-group">

							<a class="btn btn-info btn-sm dropdown-toggle" href="#"
								role="button" data-bs-toggle="dropdown" aria-expanded="false">
								Course </a>


							<ul class="dropdown-menu">

								<li><a class="dropdown-item" href="<%=ORSView.COURSE_CTL%>">
										<%=ms.get("header.addCourse")%>
								</a></li>

								<li><a class="dropdown-item"
									href="<%=ORSView.COURSE_LIST_CTL%>"> <%=ms.get("header.courseList")%>
								</a></li>

							</ul>

						</div>

					</li>

					<!-- Faculty -->

					<li class="nav-item me-1 my-1">

						<div class="btn-group">

							<a class="btn btn-info btn-sm dropdown-toggle" href="#"
								role="button" data-bs-toggle="dropdown" aria-expanded="false">
								Faculty </a>


							<ul class="dropdown-menu">

								<li><a class="dropdown-item"
									href="<%=ORSView.FACULTY_CTL%>"> <%=ms.get("header.addFaculty")%>
								</a></li>

								<li><a class="dropdown-item"
									href="<%=ORSView.FACULTY_LIST_CTL%>"> <%=ms.get("header.facultyList")%>
								</a></li>

							</ul>

						</div>

					</li>

					<!-- Marksheet -->

					<li class="nav-item me-1 my-1">

						<div class="btn-group">

							<a class="btn btn-info btn-sm dropdown-toggle" href="#"
								role="button" data-bs-toggle="dropdown" aria-expanded="false">
								Marksheet </a>

							<ul class="dropdown-menu">

								<li><a class="dropdown-item"
									href="<%=ORSView.MARKSHEET_CTL%>"> <%=ms.get("header.addMarksheet")%>
								</a></li>

								<li><a class="dropdown-item"
									href="<%=ORSView.MARKSHEET_LIST_CTL%>"> <%=ms.get("header.marksheetList")%>
								</a></li>

							</ul>

						</div>

					</li>

					<!-- Subject -->

					<li class="nav-item me-1 my-1">

						<div class="btn-group">

							<a class="btn btn-info btn-sm dropdown-toggle" href="#"
								role="button" data-bs-toggle="dropdown" aria-expanded="false">
								Subject </a>


							<ul class="dropdown-menu">

								<li><a class="dropdown-item"
									href="<%=ORSView.SUBJECT_CTL%>"> <%=ms.get("header.addSubject")%>
								</a></li>

								<li><a class="dropdown-item"
									href="<%=ORSView.SUBJECT_LIST_CTL%>"> <%=ms.get("header.subjectList")%>
								</a></li>

							</ul>

						</div>

					</li>

					<!-- Student -->

					<li class="nav-item me-1 my-1">

						<div class="btn-group">

							<a class="btn btn-info btn-sm dropdown-toggle" href="#"
								role="button" data-bs-toggle="dropdown" aria-expanded="false">
								Student </a>

							<ul class="dropdown-menu">

								<li><a class="dropdown-item"
									href="<%=ORSView.STUDENT_CTL%>"> <%=ms.get("header.addStudent")%>
								</a></li>

								<li><a class="dropdown-item"
									href="<%=ORSView.STUDENT_LIST_CTL%>"> <%=ms.get("header.studentList")%>
								</a></li>

							</ul>

						</div>

					</li>


					<!-- Module -->


					<li class="nav-item dropdown me-1 my-1"><a
						class="btn btn-info btn-sm dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> Module </a>

						<ul class="dropdown-menu dropdown-menu-end">

							<li><a class="dropdown-item"
								href="<%=ORSView.HOSPITAL_CTL%>"> <%=ms.get("header.addHospital")%>
							</a></li>

							<li><a class="dropdown-item"
								href="<%=ORSView.HOSPITAL_LIST_CTL%>"> <%=ms.get("header.hospitalList")%>
							</a></li>

							<li><a class="dropdown-item" href="<%=ORSView.ATM_CTL%>">
									<%=ms.get("header.addATM")%>
							</a></li>

							<li><a class="dropdown-item"
								href="<%=ORSView.ATM_LIST_CTL%>"> <%=ms.get("header.atmList")%>
							</a></li>

							<li><a class="dropdown-item" href="<%=ORSView.RAILWAY_CTL%>">
									<%=ms.get("header.addRailway")%>
							</a></li>

							<li><a class="dropdown-item"
								href="<%=ORSView.RAILWAY_LIST_CTL%>"> <%=ms.get("header.railwayList")%>
							</a></li>

							<li><a class="dropdown-item"
								href="<%=ORSView.ONLINE_SHOPPING_CTL%>"> <%=ms.get("header.addOnlineShopping")%>
							</a></li>

							<li><a class="dropdown-item"
								href="<%=ORSView.ONLINE_SHOPPING_LIST_CTL%>"> <%=ms.get("header.OnlineShoppingList")%>
							</a></li>
						</ul></li>



					<%
					}

					if (isStudent) {
					%>

					<!-- Student -->

					<li class="nav-item me-1 my-1">

						<div class="btn-group">

							<a class="btn btn-info btn-sm dropdown-toggle" href="#"
								role="button" data-bs-toggle="dropdown" aria-expanded="false">
								Student </a>


							<ul class="dropdown-menu">

								<li><a class="dropdown-item"
									href="<%=ORSView.STUDENT_LIST_CTL%>"> <%=ms.get("header.studentList")%>
								</a></li>

							</ul>

						</div>

					</li>

					<!-- College -->

					<li class="nav-item me-1 my-1">

						<div class="btn-group">

							<a class="btn btn-info btn-sm dropdown-toggle" href="#"
								role="button" data-bs-toggle="dropdown" aria-expanded="false">
								College </a>


							<ul class="dropdown-menu">

								<li><a class="dropdown-item"
									href="<%=ORSView.COLLEGE_CTL%>"> <%=ms.get("header.addCollege")%>
								</a></li>

								<li><a class="dropdown-item"
									href="<%=ORSView.COLLEGE_LIST_CTL%>"> <%=ms.get("header.collegeList")%>
								</a></li>

							</ul>

						</div>

					</li>

					<!-- Course -->

					<li class="nav-item me-1 my-1">

						<div class="btn-group">

							<a class="btn btn-info btn-sm dropdown-toggle" href="#"
								role="button" data-bs-toggle="dropdown" aria-expanded="false">
								Course </a>


							<ul class="dropdown-menu">

								<li><a class="dropdown-item" href="<%=ORSView.COURSE_CTL%>">
										<%=ms.get("header.addCourse")%>
								</a></li>

								<li><a class="dropdown-item"
									href="<%=ORSView.COURSE_LIST_CTL%>"> <%=ms.get("header.courseList")%>
								</a></li>

							</ul>

						</div>

					</li>

					<!-- Faculty -->

					<li class="nav-item me-1 my-1">

						<div class="btn-group">

							<a class="btn btn-info btn-sm dropdown-toggle" href="#"
								role="button" data-bs-toggle="dropdown" aria-expanded="false">
								Faculty </a>


							<ul class="dropdown-menu">

								<li><a class="dropdown-item"
									href="<%=ORSView.FACULTY_CTL%>"> <%=ms.get("header.addFaculty")%>
								</a></li>

								<li><a class="dropdown-item"
									href="<%=ORSView.FACULTY_LIST_CTL%>"> <%=ms.get("header.facultyList")%>
								</a></li>

							</ul>

						</div>

					</li>

					<!-- Subject -->

					<li class="nav-item me-1 my-1">

						<div class="btn-group">

							<a class="btn btn-info btn-sm dropdown-toggle" href="#"
								role="button" data-bs-toggle="dropdown" aria-expanded="false">
								Subject </a>


							<ul class="dropdown-menu">

								<li><a class="dropdown-item"
									href="<%=ORSView.SUBJECT_CTL%>"> <%=ms.get("header.addSubject")%>
								</a></li>

								<li><a class="dropdown-item"
									href="<%=ORSView.SUBJECT_LIST_CTL%>"> <%=ms.get("header.subjectList")%>
								</a></li>

							</ul>

						</div>

					</li>

					<%
					}

					if (isKiosk) {
					%>

					<!-- College -->

					<li class="nav-item me-1 my-1">

						<div class="btn-group">

							<a class="btn btn-info btn-sm dropdown-toggle" href="#"
								role="button" data-bs-toggle="dropdown" aria-expanded="false">
								College </a>

							<ul class="dropdown-menu">

								<li><a class="dropdown-item"
									href="<%=ORSView.COLLEGE_CTL%>"> <%=ms.get("header.addCollege")%>
								</a></li>

								<li><a class="dropdown-item"
									href="<%=ORSView.COLLEGE_LIST_CTL%>"> <%=ms.get("header.collegeList")%>
								</a></li>

							</ul>

						</div>

					</li>

					<!-- Course -->

					<li class="nav-item me-1 my-1">

						<div class="btn-group">

							<a class="btn btn-info btn-sm dropdown-toggle" href="#"
								role="button" data-bs-toggle="dropdown" aria-expanded="false">
								Course </a>

							<ul class="dropdown-menu">

								<li><a class="dropdown-item" href="<%=ORSView.COURSE_CTL%>">
										<%=ms.get("header.addCourse")%>
								</a></li>

								<li><a class="dropdown-item"
									href="<%=ORSView.COURSE_LIST_CTL%>"> <%=ms.get("header.courseList")%>
								</a></li>

							</ul>

						</div>

					</li>

					<%
					}

					if (isFaculty) {
					%>

					<!-- Marksheet -->

					<li class="nav-item me-1 my-1">

						<div class="btn-group">

							<a class="btn btn-info btn-sm dropdown-toggle" href="#"
								role="button" data-bs-toggle="dropdown" aria-expanded="false">
								Marksheet </a>

							<ul class="dropdown-menu">

								<li><a class="dropdown-item"
									href="<%=ORSView.MARKSHEET_CTL%>"> <%=ms.get("header.addMarksheet")%>
								</a></li>

								<li><a class="dropdown-item"
									href="<%=ORSView.MARKSHEET_LIST_CTL%>"> <%=ms.get("header.marksheetList")%>
								</a></li>

							</ul>

						</div>

					</li>

					<!-- Subject -->

					<li class="nav-item me-1 my-1">

						<div class="btn-group">

							<a class="btn btn-info btn-sm dropdown-toggle" href="#"
								role="button" data-bs-toggle="dropdown" aria-expanded="false">
								Subject </a>

							<ul class="dropdown-menu">

								<li><a class="dropdown-item"
									href="<%=ORSView.SUBJECT_CTL%>"> <%=ms.get("header.addSubject")%>
								</a></li>

								<li><a class="dropdown-item"
									href="<%=ORSView.SUBJECT_LIST_CTL%>"> <%=ms.get("header.subjectList")%>
								</a></li>

							</ul>

						</div>

					</li>

					<!-- Student -->

					<li class="nav-item me-1 my-1">

						<div class="btn-group">

							<a class="btn btn-info btn-sm dropdown-toggle" href="#"
								role="button" data-bs-toggle="dropdown" aria-expanded="false">
								Student </a>

							<ul class="dropdown-menu">

								<li><a class="dropdown-item"
									href="<%=ORSView.STUDENT_CTL%>"> <%=ms.get("header.addStudent")%>
								</a></li>

								<li><a class="dropdown-item"
									href="<%=ORSView.STUDENT_LIST_CTL%>"> <%=ms.get("header.studentList")%>
								</a></li>

							</ul>

						</div>

					</li>

					<!-- Course -->

					<li class="nav-item me-1 my-1">

						<div class="btn-group">

							<a class="btn btn-info btn-sm dropdown-toggle" href="#"
								role="button" data-bs-toggle="dropdown" aria-expanded="false">
								Course </a>

							<ul class="dropdown-menu">

								<li><a class="dropdown-item"
									href="<%=ORSView.COURSE_LIST_CTL%>"> <%=ms.get("header.courseList")%>
								</a></li>

							</ul>

						</div>

					</li>

					<!-- College -->

					<li class="nav-item me-1 my-1">

						<div class="btn-group">

							<a class="btn btn-info btn-sm dropdown-toggle" href="#"
								role="button" data-bs-toggle="dropdown" aria-expanded="false">
								College </a>

							<ul class="dropdown-menu">

								<li><a class="dropdown-item"
									href="<%=ORSView.COLLEGE_LIST_CTL%>"> <%=ms.get("header.collegeList")%>
								</a></li>

							</ul>

						</div>

					</li>

					<%
					}

					if (isCollege) {
					%>

					<!-- Marksheet -->

					<li class="nav-item me-1 my-1">

						<div class="btn-group">

							<a class="btn btn-info btn-sm dropdown-toggle" href="#"
								role="button" data-bs-toggle="dropdown" aria-expanded="false">
								Marksheet </a>

							<ul class="dropdown-menu">

								<li><a class="dropdown-item"
									href="<%=ORSView.MARKSHEET_CTL%>"> <%=ms.get("header.addMarksheet")%>
								</a></li>

								<li><a class="dropdown-item"
									href="<%=ORSView.MARKSHEET_LIST_CTL%>"> <%=ms.get("header.marksheetList")%>
								</a></li>

							</ul>

						</div>

					</li>

					<!-- Student -->

					<li class="nav-item me-1 my-1">

						<div class="btn-group">

							<a class="btn btn-info btn-sm dropdown-toggle" href="#"
								role="button" data-bs-toggle="dropdown" aria-expanded="false">
								Student </a>

							<ul class="dropdown-menu">

								<li><a class="dropdown-item"
									href="<%=ORSView.STUDENT_CTL%>"> <%=ms.get("header.addStudent")%>
								</a></li>

								<li><a class="dropdown-item"
									href="<%=ORSView.STUDENT_LIST_CTL%>"> <%=ms.get("header.studentList")%>
								</a></li>

							</ul>

						</div>

					</li>

					<!-- Course -->

					<li class="nav-item me-1 my-1">

						<div class="btn-group">

							<a class="btn btn-info btn-sm dropdown-toggle" href="#"
								role="button" data-bs-toggle="dropdown" aria-expanded="false">
								Course </a>

							<ul class="dropdown-menu">

								<li><a class="dropdown-item"
									href="<%=ORSView.COURSE_LIST_CTL%>"> <%=ms.get("header.courseList")%>
								</a></li>

							</ul>

						</div>

					</li>

					<!-- Faculty -->

					<li class="nav-item me-1 my-1">

						<div class="btn-group">

							<a class="btn btn-info btn-sm dropdown-toggle" href="#"
								role="button" data-bs-toggle="dropdown" aria-expanded="false">
								Faculty </a>
							<ul class="dropdown-menu">

								<li><a class="dropdown-item"
									href="<%=ORSView.FACULTY_LIST_CTL%>"> <%=ms.get("header.facultyList")%>
								</a></li>

							</ul>

						</div>

					</li>

					<%
					}
					%>
					<!-- Java Doc -->
					<%-- <a class="btn btn-info btn-sm dropdown-toggle" href="#"
								role="button" data-bs-toggle="dropdown" aria-expanded="false">
								 </a>
					<li><a class="dropdown-item"
								href="<%=ORSView.JAVA_DOC_VIEW%>" target="_blank">Java Doc
							</a></li> --%>
					<li class="nav-item me-1 my-1"><a
						class="nav-link bg-danger text-white"
						href="<%=ORSView.JAVA_DOC_VIEW%>" target="_blank">Java Doc</a></li>

					<!-- Single buttons -->

					<li class="nav-item me-1 my-1"><a
						class="btn btn-danger btn-sm"
						href="<%=ORSView.LOGIN_CTL + "?operation=logout"%>"> <%=ms.get("header.logout")%>
					</a></li>

					<%
					} else {
					%>

					<h2 class="navbar-brand text-white mb-0 fs-5 me-3">
						<%=welcomeMsg + ms.get("header.guest")%>
					</h2>
					<li class="nav-item d-flex text-white align-items-center"><a
						class="nav-link text-white" href="<%=ORSView.LOGIN_CTL%>"> <%=ms.get("login.title")%>
					</a> |</li>

					<li class="nav-item d-flex text-white align-items-center"><a
						class="nav-link text-white"
						href="<%=ORSView.USER_REGISTRATION_CTL%>"> <%=ms.get("header.signUp")%>
					</a> |</li>

					<%
					}
					%>

					<li class="nav-item d-flex align-items-center"><a
						class="nav-link text-white px-2" href="<%=ORSView.WELCOME_CTL%>">
							<%=ms.get("header.welcome")%>
					</a></li>

				</ul>


				<%-- OLD Language Dropdown inside navbar (kept, not deleted; replaced by the btn-primary dropdown below)

      <form class="d-flex ms-lg-auto mb-0">
        <select name="lang" class="form-select form-select-sm" style="width:auto;" onchange="this.form.submit()">

            <option value="en" <%=("en".equals(locale)) ? "selected" : ""%>>
                English
            </option>

            <option value="hi" <%=("hi".equals(locale)) ? "selected" : ""%>>
                Hindi
            </option>

        </select>
      </form>

--%>

				<!-- NEW: Language Dropdown styled as btn-primary (right side of the navbar).
           Each item links to ?lang=xx, which sends the same "lang" parameter the old select form sent. -->
				<div class="d-flex align-items-center ms-lg-auto gap-2">

					<%
					if (isLogin) {
					%>
					<ul class="navbar-nav flex-wrap me-auto align-items-lg-center">

						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle text-white" href="#"
							id="profileDropdown" role="button" data-bs-toggle="dropdown"
							aria-expanded="false"> <b> <%=welcomeMsg + user.getFirstName() + " (" + role + ")"%>
							</b>

						</a>

							<ul class="dropdown-menu dropdown-menu-end">

								<li><a class="dropdown-item"
									href="<%=ORSView.MY_PROFILE_CTL + "?id=" + user.getId()%>">

										My Profile </a></li>

								<li><a class="dropdown-item"
									href="<%=ORSView.CHANGE_PASSWORD_CTL%>"> Change Password </a></li>

							</ul></li>
					</ul>
					<%
					}
					%>


					<form style="margin: 0;">
						<select name="lang"
							class="form-select form-select-sm bg-info text-white border-0 "
							onchange="this.form.submit()" style="width: auto;">

							<option class="bg-white text-dark" value="en"
								<%=("en".equals(locale)) ? "selected" : ""%>>English</option>

							<option class="bg-white text-dark" value="hi"
								<%=("hi".equals(locale)) ? "selected" : ""%>>Hindi</option>

						</select>
					</form>
				</div>

			</div>
	</nav>

	<!-- ================= END NAVBAR ================= -->

	<%-- OLD Language Dropdown (kept, not deleted; now lives inside the navbar above)

<!-- Language Dropdown -->

<div align="right">

    <table>

        <tr>

            <td style="width:120px; text-align:center;">

                <form style="margin:0;">

                    <select name="lang" onchange="this.form.submit()">

                        <option value="en" <%=("en".equals(locale)) ? "selected" : ""%>>
                            English
                        </option>

                        <option value="hi" <%=("hi".equals(locale)) ? "selected" : ""%>>
                            Hindi
                        </option>

                    </select>

                </form>

            </td>

        </tr>

    </table>

</div>
--%>

	<hr class="mt-0">

</body>

</html>
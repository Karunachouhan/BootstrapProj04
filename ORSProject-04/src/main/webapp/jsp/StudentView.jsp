<%@page import="in.co.rays.proj4.util.HTMLUtility"%>
<%@page import="in.co.rays.proj4.bean.CollegeBean"%>
<%@page import="java.util.List"%>
<%@page import="in.co.rays.proj4.controller.StudentCtl"%>
<%@page import="in.co.rays.proj4.util.DataUtility"%>
<%@page import="in.co.rays.proj4.util.ServletUtility"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Student</title>

<style>

/* Registration Header Gradient */

.custom-gradient-header {
    background: linear-gradient(135deg, #0d6efd 0%, #ffffff 50%, #0dcaf0 100%) !important;
}

/* Dropdown Styling */

select {
    display: block;
    width: 100%;
    padding: 0.375rem 0.75rem;
    font-size: 0.875rem;
    font-weight: 400;
    line-height: 1.5;
    color: #212529;
    background-color: #fff;
    border: 1px solid #ced4da;
    border-radius: 0.375rem;
    outline: none;
}

/* Registration Page Spacing */

.registration-page {
    padding-bottom: 140px !important;
}

/* Registration Card */

.registration-card {
    margin-bottom: 40px !important;
}

</style>

</head>

<body>

    <jsp:useBean id="bean" class="in.co.rays.proj4.bean.StudentBean"
        scope="request"></jsp:useBean>

    <%
    String succ = ServletUtility.getSuccessMessage(request);

    String error = ServletUtility.getErrorMessage(request);

    List<CollegeBean> collegeList =
        (List) request.getAttribute("collegeList");

    String collegeErrorMsg =
        ServletUtility.getErrorMessage("collegeId", request);

    String firstNameErrorMsg =
        ServletUtility.getErrorMessage("firstName", request);

    String lastNameErrorMsg =
        ServletUtility.getErrorMessage("lastName", request);

    String emailErrorMsg =
        ServletUtility.getErrorMessage("email", request);

    String mobileNoErrorMsg =
        ServletUtility.getErrorMessage("mobileNo", request);

    String dobErrorMsg =
        ServletUtility.getErrorMessage("dateOfBirth", request);
    %>

    <%@include file="Header.jsp"%>


    <!-- Main Student Container -->

    <div class="container-fluid py-1 registration-page">

        <div class="row justify-content-center">

            <div class="col-12 col-sm-12 col-md-11 col-lg-6">

                <!-- Student Registration Card -->

                <div class="card border-0 shadow-lg rounded-3 overflow-hidden registration-card">


                    <!-- Card Header -->

                    <div class="custom-gradient-header px-3 py-3 text-center">

                        <div
                            class="d-inline-flex bg-white bg-opacity-10 p-3 border border-2 border-primary rounded-circle text-primary mb-2 shadow-sm fs-4 align-items-center justify-content-center"
                            style="width: 60px; height: 60px;">

                            <i class="bi bi-mortarboard-fill fw-bold"></i>

                        </div>

                        <h1 class="h3 fw-bold text-dark m-0 text-uppercase">

                            <%=bean != null && bean.getId() > 0
                                ? "Update Student" : "Add Student"%>

                        </h1>

                        <small class="text-muted">
                            Create or manage student details
                        </small>

                    </div>


                    <!-- Card Body -->

                    <div class="card-body p-3 px-md-5 pt-md-4 pb-md-3">


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


                        <!-- Student Form -->

                        <form action="<%=ORSView.STUDENT_CTL%>" method="post">

                            <div class="row g-3">


                                <!-- College -->

                                <div class="col-12 mt-0">

                                    <label class="form-label fw-bold fs-6">

                                        <i class="bi bi-building-fill text-primary me-1"></i>

                                        College

                                        <span class="text-danger">*</span>

                                    </label>

                                    <%=HTMLUtility.getList("collegeId",
                                        DataUtility.getStringData(bean.getCollegeId()),
                                        collegeList)%>

                                    <%
                                    if (collegeErrorMsg != null && !collegeErrorMsg.trim().equals("")) {
                                    %>

                                    <div class="text-danger small fw-bold mt-1">

                                        <i class="bi bi-x-circle-fill"></i>

                                        <%=collegeErrorMsg%>

                                    </div>

                                    <%
                                    }
                                    %>

                                </div>


                                <!-- First Name -->

                                <div class="col-md-6 mt-2">

                                    <label class="form-label fw-bold fs-6">

                                        <i class="bi bi-person-fill text-primary me-1"></i>

                                        First Name

                                        <span class="text-danger">*</span>

                                    </label>

                                    <input type="text" name="firstName"
                                        placeholder="Enter your first name"
                                        value="<%=DataUtility.getStringData(bean.getFirstName())%>"
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

                                <div class="col-md-6 mt-2">

                                    <label class="form-label fw-bold fs-6">

                                        <i class="bi bi-person-fill text-primary me-1"></i>

                                        Last Name

                                        <span class="text-danger">*</span>

                                    </label>

                                    <input type="text" name="lastName"
                                        placeholder="Enter your last name"
                                        value="<%=DataUtility.getStringData(bean.getLastName())%>"
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


                                <!-- Email -->

                                <div class="col-md-6 mt-2">

                                    <label class="form-label fw-bold fs-6">

                                        <i class="bi bi-envelope-fill text-primary me-1"></i>

                                        Email

                                        <span class="text-danger">*</span>

                                    </label>

                                    <input type="email" name="email"
                                        placeholder="Enter your email"
                                        value="<%=DataUtility.getStringData(bean.getEmail())%>"
                                        class="form-control form-control-sm
                                        <%=emailErrorMsg != null && !emailErrorMsg.trim().equals("") ? "is-invalid" : ""%>">

                                    <%
                                    if (emailErrorMsg != null && !emailErrorMsg.trim().equals("")) {
                                    %>

                                    <div class="invalid-feedback d-block fw-bold">

                                        <i class="bi bi-x-circle-fill"></i>

                                        <%=emailErrorMsg%>

                                    </div>

                                    <%
                                    }
                                    %>

                                </div>


                                <!-- Mobile Number -->

                                <div class="col-md-6 mt-2">

                                    <label class="form-label fw-bold fs-6">

                                        <i class="bi bi-telephone-fill text-primary me-1"></i>

                                        Mobile No.

                                        <span class="text-danger">*</span>

                                    </label>

                                    <input type="number" name="mobileNo"
                                        placeholder="Enter your mobile number"
                                        value="<%=DataUtility.getStringData(bean.getMobileNo())%>"
                                        class="form-control form-control-sm
                                        <%=mobileNoErrorMsg != null && !mobileNoErrorMsg.trim().equals("") ? "is-invalid" : ""%>">

                                    <%
                                    if (mobileNoErrorMsg != null && !mobileNoErrorMsg.trim().equals("")) {
                                    %>

                                    <div class="invalid-feedback d-block fw-bold">

                                        <i class="bi bi-x-circle-fill"></i>

                                        <%=mobileNoErrorMsg%>

                                    </div>

                                    <%
                                    }
                                    %>

                                </div>


                                <!-- Date Of Birth -->

                                <div class="col-12 mt-2">

                                    <label class="form-label fw-bold fs-6">

                                        <i class="bi bi-calendar-event-fill text-primary me-1"></i>

                                        Date Of Birth

                                        <span class="text-danger">*</span>

                                    </label>

                                    <input type="date" name="dateOfBirth"
                                        placeholder="Enter your date of birth"
                                        value="<%=DataUtility.getStringData(bean.getDateOfBirth())%>"
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


                                <!-- Hidden ID -->

                                <input type="hidden" name="id"
                                    value="<%=bean.getId()%>">


                                <!-- Save Button -->

                                <div class="col-12 text-center pt-3">

                                    <button type="submit" name="operation"
                                        value="<%=StudentCtl.OP_SAVE%>"
                                        class="btn btn-primary btn-sm px-5 shadow"
                                        style="font-size: 15px;">

                                        <i class="bi bi-mortarboard-fill me-2"></i>

                                        <%=bean != null && bean.getId() > 0
                                            ? "Update Student" : "Add Student"%>

                                    </button>

                                </div>


                            </div>

                        </form>

                    </div>

                </div>

            </div>

        </div>

    </div>


    <%@include file="Footer.jsp"%>

</body>

</html>
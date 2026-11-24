<%@page import="in.co.rays.proj4.controller.BaseCtl"%>
<%@page import="in.co.rays.proj4.controller.ORSView"%>
<%@page import="in.co.rays.proj4.util.HTMLUtility"%>
<%@page import="in.co.rays.proj4.util.DataUtility"%>
<%@page import="in.co.rays.proj4.util.ServletUtility"%>
<%@page import="in.co.rays.proj4.bean.UserBean"%>
<%@page import="java.util.HashMap"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>My Profile</title>

<style>

/* Gradient Header */
.custom-gradient-header {
    background: linear-gradient(135deg, #0d6efd 0%, #ffffff 50%, #0dcaf0 100%) !important;
}

/* Profile Page */
.profile-page {
    padding-bottom: 140px !important;
}

/* Profile Card */
.profile-card {
    margin-bottom: 40px !important;
}

/* Profile Image */
.profile-photo {
    width: 80px;
    height: 80px;
    object-fit: cover;
    border-radius: 50%;
    border: 2px solid #0d6efd;
}

/* Form Labels */
.profile-form label {
    font-weight: bold;
    font-size: 14px;
}

/* Form Inputs */
.profile-form .form-control {
    border-radius: 5px;
}

/* Gender Dropdown */
.profile-form select {
    display: block;
    width: 100%;
    padding: 0.375rem 0.75rem;
    font-size: 0.875rem;
    line-height: 1.5;
    color: #212529;
    background-color: #fff;
    border: 1px solid #ced4da;
    border-radius: 0.375rem;
}

/* Error Messages */
.profile-error {
    color: red;
    font-size: 12px;
    font-weight: bold;
}

/* Profile Heading */
.profile-title {
    font-weight: 700;
    color: #212529;
}

</style>

</head>

<body>

    <jsp:useBean id="bean" class="in.co.rays.proj4.bean.UserBean"
        scope="request">
    </jsp:useBean>

    <%
    String succ = ServletUtility.getSuccessMessage(request);
    String error = ServletUtility.getErrorMessage(request);

    HashMap<String, String> map = new HashMap<String, String>();

    map.put("male", "Male");
    map.put("female", "Female");
    map.put("other", "Other");
    %>

    <%@ include file="Header.jsp"%>

    <div class="container-fluid py-2 profile-page">

        <div class="row justify-content-center">

            <div class="col-12 col-sm-12 col-md-11 col-lg-6">

                <form action="<%=ORSView.MY_PROFILE_CTL%>" method="post">

                    <!-- Profile Card -->

                    <div class="card border-0 shadow-lg rounded-3 overflow-hidden profile-card">

                        <!-- Profile Header -->

                        <div class="custom-gradient-header px-3 py-3 text-center">

                            <div
                                class="d-inline-flex bg-white bg-opacity-10 p-3 border border-2 border-primary rounded-circle text-primary mb-2 shadow-sm fs-4 align-items-center justify-content-center"
                                style="width: 60px; height: 60px;">

                                <i class="bi bi-person-fill fw-bold"></i>

                            </div>

                            <h1 class="h3 fw-bold text-dark m-0 text-uppercase profile-title">
                                My Profile
                            </h1>

                            <small class="text-muted">
                                Manage your personal information
                            </small>

                        </div>

                        <!-- Profile Body -->

                        <div class="card-body p-3 px-md-5 pt-md-4 pb-md-4">

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

                            <!-- Profile Photo -->

                            <%
                            if (bean.getId() > 0) {
                            %>

                            <form action="<%=ORSView.UPLOAD_PHOTO_CTL%>" method="POST"
                                enctype="multipart/form-data">

                                <input type="hidden" name="id"
                                    value="<%=bean.getId()%>">

                                <div class="row justify-content-center text-center mb-3">

                                    <div class="col-12">


                                        <div>

                                            <img
                                                src="<%=ORSView.UPLOAD_PHOTO_CTL%>?id=<%=bean.getId()%>"
                                                onerror="this.style.display='none';"
                                                alt="User Photo"
                                                class="profile-photo">

                                        </div>
                                        <label class="form-label fw-bold">
                                            <i class="bi bi-camera-fill text-primary me-1"></i>
                                            Photo
                                        </label>

                                    </div>

                                </div>

                            </form>

                            <%
                            }
                            %>

                            <!-- Profile Form Fields -->

                            <div class="row g-3 profile-form">

                                <!-- First Name -->

                                <div class="col-md-6">

                                    <label class="form-label">
                                        <i class="bi bi-person-fill text-primary me-1"></i>
                                        First Name
                                        <span class="text-danger">*</span>
                                    </label>

                                    <input type="text" name="firstName"
                                        placeholder="Enter your first name"
                                        value="<%=DataUtility.getStringData(bean.getFirstName())%>"
                                        class="form-control form-control-sm">

                                    <div class="profile-error">
                                        <%=ServletUtility.getErrorMessage("firstName", request)%>
                                    </div>

                                </div>

                                <!-- Last Name -->

                                <div class="col-md-6">

                                    <label class="form-label">
                                        <i class="bi bi-person-fill text-primary me-1"></i>
                                        Last Name
                                        <span class="text-danger">*</span>
                                    </label>

                                    <input type="text" name="lastName"
                                        placeholder="Enter your last name"
                                        value="<%=DataUtility.getStringData(bean.getLastName())%>"
                                        class="form-control form-control-sm">

                                    <div class="profile-error">
                                        <%=ServletUtility.getErrorMessage("lastName", request)%>
                                    </div>

                                </div>

                                <!-- Login -->

                                <div class="col-12">

                                    <label class="form-label">
                                        <i class="bi bi-person-circle text-primary me-1"></i>
                                        Login
                                        <span class="text-danger">*</span>
                                    </label>

                                    <input type="email" name="login" readonly
                                        value="<%=DataUtility.getStringData(bean.getLogin())%>"
                                        class="form-control form-control-sm">

                                    <div class="profile-error">
                                        <%=ServletUtility.getErrorMessage("login", request)%>
                                    </div>

                                </div>

                                <!-- Password -->

                                <div class="col-md-6">

                                    <label class="form-label">
                                        <i class="bi bi-lock-fill text-primary me-1"></i>
                                        Password
                                        <span class="text-danger">*</span>
                                    </label>

                                    <input type="password" name="password"
                                        value="<%=DataUtility.getStringData(bean.getPassword())%>"
                                        class="form-control form-control-sm">

                                    <div class="profile-error">
                                        <%=ServletUtility.getErrorMessage("password", request)%>
                                    </div>

                                </div>

                                <!-- Gender -->

                                <div class="col-md-6">

                                    <label class="form-label">
                                        <i class="bi bi-gender-ambiguous text-primary me-1"></i>
                                        Gender
                                        <span class="text-danger">*</span>
                                    </label>

                                    <%=HTMLUtility.getList("gender",
                                        DataUtility.getStringData(bean.getGender()).trim().toLowerCase(), map)%>

                                    <div class="profile-error">
                                        <%=ServletUtility.getErrorMessage("gender", request)%>
                                    </div>

                                </div>

                                <!-- DOB -->

                                <div class="col-md-6">

                                    <label class="form-label">
                                        <i class="bi bi-calendar-event-fill text-primary me-1"></i>
                                        DOB
                                        <span class="text-danger">*</span>
                                    </label>

                                    <input type="date" name="dob"
                                        value="<%=DataUtility.getDateString(bean.getDob())%>"
                                        class="form-control form-control-sm">

                                    <div class="profile-error">
                                        <%=ServletUtility.getErrorMessage("dob", request)%>
                                    </div>

                                </div>

                                <!-- Hidden Fields -->

                                <div class="col-12">

                                    <input type="hidden" name="id"
                                        value="<%=bean.getId()%>">

                                    <input type="hidden" name="roleId"
                                        value="<%=bean.getRoleId()%>">

                                </div>

                                <!-- Save Button -->

                                <div class="col-12 text-center ">

                                    <label class="btn btn-primary btn-sm px-5 shadow"
                                        style="font-size: 15px;">

                                        <i class="bi bi-save-fill me-2"></i>

                                        <input type="submit" name="operation"
                                            value="<%=BaseCtl.OP_SAVE%>"
                                            class="bg-transparent border-0 text-white">

                                    </label>

                                </div>

                            </div>

                        </div>

                    </div>

                </form>

            </div>

        </div>

    </div>

    <%@ include file="Footer.jsp"%>

</body>
</html>
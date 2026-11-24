<%@page import="in.co.rays.proj4.util.DataUtility"%>
<%@page import="in.co.rays.proj4.util.ServletUtility"%>
<%@page import="in.co.rays.proj4.controller.HospitalCtl"%>
<%@page import="in.co.rays.proj4.controller.BaseCtl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Hospital</title>

<style>

/* Registration Header Gradient */

.custom-gradient-header {
    background: linear-gradient(135deg, #0d6efd 0%, #ffffff 50%, #0dcaf0 100%) !important;
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

    <jsp:useBean id="bean" class="in.co.rays.proj4.bean.HospitalBean"
        scope="request"></jsp:useBean>

    <%
    String succ = ServletUtility.getSuccessMessage(request);

    String error = ServletUtility.getErrorMessage(request);

    String nameErrorMsg =
        ServletUtility.getErrorMessage("name", request);

    String ageErrorMsg =
        ServletUtility.getErrorMessage("age", request);

    String bloodGroupErrorMsg =
        ServletUtility.getErrorMessage("bloodGroup", request);

    String diseaseErrorMsg =
        ServletUtility.getErrorMessage("disease", request);
    %>

    <%@include file="Header.jsp"%>


    <!-- Main Hospital Container -->

    <div class="container-fluid py-1 registration-page">

        <div class="row justify-content-center">

            <div class="col-12 col-sm-12 col-md-11 col-lg-6">

                <!-- Hospital Registration Card -->

                <div class="card border-0 shadow-lg rounded-3 overflow-hidden registration-card">


                    <!-- Card Header -->

                    <div class="custom-gradient-header px-3 py-3 text-center">

                        <div
                            class="d-inline-flex bg-white bg-opacity-10 p-3 border border-2 border-primary rounded-circle text-primary mb-2 shadow-sm fs-4 align-items-center justify-content-center"
                            style="width: 60px; height: 60px;">

                            <i class="bi bi-hospital-fill fw-bold"></i>

                        </div>

                        <h1 class="h3 fw-bold text-dark m-0 text-uppercase">

                            <%=bean != null && bean.getId() > 0
                                ? "Update Hospital" : "Add Hospital"%>

                        </h1>

                        <small class="text-muted">
                            Create or manage patient details
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


                        <!-- Hospital Form -->

                        <form action="<%=ORSView.HOSPITAL_CTL%>" method="post">

                            <div class="row g-3">


                                <!-- Name -->

                                <div class="col-md-6 mt-0">

                                    <label class="form-label fw-bold fs-6">

                                        <i class="bi bi-person-fill text-primary me-1"></i>

                                        Name

                                        <span class="text-danger">*</span>

                                    </label>

                                    <input type="text" name="name"
                                        placeholder="Enter your name"
                                        value="<%=DataUtility.getStringData(request.getParameter("name"))%>"
                                        class="form-control form-control-sm
                                        <%=nameErrorMsg != null && !nameErrorMsg.trim().equals("") ? "is-invalid" : ""%>">

                                    <%
                                    if (nameErrorMsg != null && !nameErrorMsg.trim().equals("")) {
                                    %>

                                    <div class="invalid-feedback d-block fw-bold">

                                        <i class="bi bi-x-circle-fill"></i>

                                        <%=nameErrorMsg%>

                                    </div>

                                    <%
                                    }
                                    %>

                                </div>


                                <!-- Age -->

                                <div class="col-md-6 mt-0">

                                    <label class="form-label fw-bold fs-6">

                                        <i class="bi bi-calendar2-check-fill text-primary me-1"></i>

                                        Age

                                        <span class="text-danger">*</span>

                                    </label>

                                    <input type="number" name="age"
                                        placeholder="Enter your age"
                                        value="<%=DataUtility.getStringData(request.getParameter("age"))%>"
                                        class="form-control form-control-sm
                                        <%=ageErrorMsg != null && !ageErrorMsg.trim().equals("") ? "is-invalid" : ""%>">

                                    <%
                                    if (ageErrorMsg != null && !ageErrorMsg.trim().equals("")) {
                                    %>

                                    <div class="invalid-feedback d-block fw-bold">

                                        <i class="bi bi-x-circle-fill"></i>

                                        <%=ageErrorMsg%>

                                    </div>

                                    <%
                                    }
                                    %>

                                </div>


                                <!-- Blood Group -->

                                <div class="col-12 mt-2">

                                    <label class="form-label fw-bold fs-6">

                                        <i class="bi bi-droplet-fill text-primary me-1"></i>

                                        Blood Group

                                        <span class="text-danger">*</span>

                                    </label>

                                    <input type="text" name="bloodGroup"
                                        placeholder="Enter your blood group"
                                        value="<%=DataUtility.getStringData(request.getParameter("bloodGroup"))%>"
                                        class="form-control form-control-sm
                                        <%=bloodGroupErrorMsg != null && !bloodGroupErrorMsg.trim().equals("") ? "is-invalid" : ""%>">

                                    <%
                                    if (bloodGroupErrorMsg != null && !bloodGroupErrorMsg.trim().equals("")) {
                                    %>

                                    <div class="invalid-feedback d-block fw-bold">

                                        <i class="bi bi-x-circle-fill"></i>

                                        <%=bloodGroupErrorMsg%>

                                    </div>

                                    <%
                                    }
                                    %>

                                </div>


                                <!-- Disease -->

                                <div class="col-12 mt-2">

                                    <label class="form-label fw-bold fs-6">

                                        <i class="bi bi-heart-pulse-fill text-primary me-1"></i>

                                        Disease

                                        <span class="text-danger">*</span>

                                    </label>

                                    <input type="text" name="disease"
                                        placeholder="Enter your disease"
                                        value="<%=DataUtility.getStringData(request.getParameter("disease"))%>"
                                        class="form-control form-control-sm
                                        <%=diseaseErrorMsg != null && !diseaseErrorMsg.trim().equals("") ? "is-invalid" : ""%>">

                                    <%
                                    if (diseaseErrorMsg != null && !diseaseErrorMsg.trim().equals("")) {
                                    %>

                                    <div class="invalid-feedback d-block fw-bold">

                                        <i class="bi bi-x-circle-fill"></i>

                                        <%=diseaseErrorMsg%>

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
                                        value="<%=HospitalCtl.OP_SAVE%>"
                                        class="btn btn-primary btn-sm px-5 shadow"
                                        style="font-size: 15px;">

                                        <i class="bi bi-hospital-fill me-2"></i>

                                        <%=bean != null && bean.getId() > 0
                                            ? "Update Hospital" : "Add Hospital"%>

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
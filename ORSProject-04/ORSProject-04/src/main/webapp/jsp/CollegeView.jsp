<%@page import="in.co.rays.proj4.util.DataUtility"%>
<%@page import="in.co.rays.proj4.controller.CollegeCtl"%>
<%@page import="in.co.rays.proj4.util.ServletUtility"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">

<title>College</title>

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

    <jsp:useBean id="bean" class="in.co.rays.proj4.bean.CollegeBean"
        scope="request"></jsp:useBean>

    <%
    String succ = ServletUtility.getSuccessMessage(request);

    String error = ServletUtility.getErrorMessage(request);

    String nameErrorMsg = ServletUtility.getErrorMessage("name", request);

    String addressErrorMsg = ServletUtility.getErrorMessage("address", request);

    String stateErrorMsg = ServletUtility.getErrorMessage("state", request);

    String cityErrorMsg = ServletUtility.getErrorMessage("city", request);

    String phoneNoErrorMsg = ServletUtility.getErrorMessage("phoneNo", request);
    %>

    <%@include file="Header.jsp"%>


    <!-- Main College Container -->

    <div class="container-fluid py-1 registration-page">

        <div class="row justify-content-center">

            <div class="col-12 col-sm-12 col-md-11 col-lg-6">

                <!-- College Registration Card -->

                <div class="card border-0 shadow-lg rounded-3 overflow-hidden registration-card">


                    <!-- Card Header -->

                    <div class="custom-gradient-header px-3 py-3 text-center">

                        <div
                            class="d-inline-flex bg-white bg-opacity-10 p-3 border border-2 border-primary rounded-circle text-primary mb-2 shadow-sm fs-4 align-items-center justify-content-center"
                            style="width: 60px; height: 60px;">

                            <i class="bi bi-building-fill-add fw-bold"></i>

                        </div>

                        <h1 class="h3 fw-bold text-dark m-0 text-uppercase">

                            <%=bean != null && bean.getId() > 0 ? "Update College" : "Add College"%>

                        </h1>

                        <small class="text-muted">
                            Create or manage college details
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


                        <!-- College Form -->

                        <form action="<%=ORSView.COLLEGE_CTL%>" method="post">

                            <div class="row g-3">


                                <!-- College Name -->

                                <div class="col-12 mt-0">

                                    <label class="form-label fw-bold fs-6">

                                        <i class="bi bi-building text-primary me-1"></i>

                                        College Name

                                        <span class="text-danger">*</span>

                                    </label>

                                    <input type="text" name="name"
                                        placeholder="Enter your college name"
                                        value="<%=DataUtility.getStringData(bean.getName())%>"
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


                                <!-- Address -->

                                <div class="col-12 mt-2">

                                    <label class="form-label fw-bold fs-6">

                                        <i class="bi bi-geo-alt-fill text-primary me-1"></i>

                                        Address

                                        <span class="text-danger">*</span>

                                    </label>

                                    <input type="text" name="address"
                                        placeholder="Enter college address"
                                        value="<%=DataUtility.getStringData(bean.getAddress())%>"
                                        class="form-control form-control-sm
                                        <%=addressErrorMsg != null && !addressErrorMsg.trim().equals("") ? "is-invalid" : ""%>">

                                    <%
                                    if (addressErrorMsg != null && !addressErrorMsg.trim().equals("")) {
                                    %>

                                    <div class="invalid-feedback d-block fw-bold">

                                        <i class="bi bi-x-circle-fill"></i>

                                        <%=addressErrorMsg%>

                                    </div>

                                    <%
                                    }
                                    %>

                                </div>


                                <!-- State -->

                                <div class="col-md-6 mt-2">

                                    <label class="form-label fw-bold fs-6">

                                        <i class="bi bi-map-fill text-primary me-1"></i>

                                        State

                                        <span class="text-danger">*</span>

                                    </label>

                                    <input type="text" name="state"
                                        placeholder="Enter your state"
                                        value="<%=DataUtility.getStringData(bean.getState())%>"
                                        class="form-control form-control-sm
                                        <%=stateErrorMsg != null && !stateErrorMsg.trim().equals("") ? "is-invalid" : ""%>">

                                    <%
                                    if (stateErrorMsg != null && !stateErrorMsg.trim().equals("")) {
                                    %>

                                    <div class="invalid-feedback d-block fw-bold">

                                        <i class="bi bi-x-circle-fill"></i>

                                        <%=stateErrorMsg%>

                                    </div>

                                    <%
                                    }
                                    %>

                                </div>


                                <!-- City -->

                                <div class="col-md-6 mt-2">

                                    <label class="form-label fw-bold fs-6">

                                        <i class="bi bi-geo-fill text-primary me-1"></i>

                                        City

                                        <span class="text-danger">*</span>

                                    </label>

                                    <input type="text" name="city"
                                        placeholder="Enter your city"
                                        value="<%=DataUtility.getStringData(bean.getCity())%>"
                                        class="form-control form-control-sm
                                        <%=cityErrorMsg != null && !cityErrorMsg.trim().equals("") ? "is-invalid" : ""%>">

                                    <%
                                    if (cityErrorMsg != null && !cityErrorMsg.trim().equals("")) {
                                    %>

                                    <div class="invalid-feedback d-block fw-bold">

                                        <i class="bi bi-x-circle-fill"></i>

                                        <%=cityErrorMsg%>

                                    </div>

                                    <%
                                    }
                                    %>

                                </div>


                                <!-- Phone Number -->

                                <div class="col-12 mt-2">

                                    <label class="form-label fw-bold fs-6">

                                        <i class="bi bi-telephone-fill text-primary me-1"></i>

                                        Phone Number

                                        <span class="text-danger">*</span>

                                    </label>

                                    <input type="number" name="phoneNo"
                                        placeholder="Enter your phone number"
                                        value="<%=DataUtility.getStringData(bean.getPhoneNo())%>"
                                        class="form-control form-control-sm
                                        <%=phoneNoErrorMsg != null && !phoneNoErrorMsg.trim().equals("") ? "is-invalid" : ""%>">

                                    <%
                                    if (phoneNoErrorMsg != null && !phoneNoErrorMsg.trim().equals("")) {
                                    %>

                                    <div class="invalid-feedback d-block fw-bold">

                                        <i class="bi bi-x-circle-fill"></i>

                                        <%=phoneNoErrorMsg%>

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
                                        value="<%=CollegeCtl.OP_SAVE%>"
                                        class="btn btn-primary btn-sm px-5 shadow"
                                        style="font-size: 15px;">

                                        <i class="bi bi-building-fill-add me-2"></i>

                                        <%=bean != null && bean.getId() > 0 ? "Update College" : "Add College"%>

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
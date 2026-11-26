<%@page import="in.co.rays.proj4.controller.ATMCtl"%>
<%@page import="in.co.rays.proj4.util.DataUtility"%>
<%@page import="in.co.rays.proj4.util.ServletUtility"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">

<title>ATM System</title>

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

    <jsp:useBean id="bean" class="in.co.rays.proj4.bean.ATMBean"
        scope="request"></jsp:useBean>

    <%
    String succ = ServletUtility.getSuccessMessage(request);

    String error = ServletUtility.getErrorMessage(request);

    String locationErrorMsg =
        ServletUtility.getErrorMessage("location", request);

    String bankNameErrorMsg =
        ServletUtility.getErrorMessage("bank_name", request);

    String cashAvailableErrorMsg =
        ServletUtility.getErrorMessage("cash_available", request);

    String statusErrorMsg =
        ServletUtility.getErrorMessage("status", request);
    %>

    <%@include file="Header.jsp"%>


    <!-- Main ATM Container -->

    <div class="container-fluid py-1 registration-page">

        <div class="row justify-content-center">

            <div class="col-12 col-sm-12 col-md-11 col-lg-6">

                <!-- ATM Registration Card -->

                <div class="card border-0 shadow-lg rounded-3 overflow-hidden registration-card">


                    <!-- Card Header -->

                    <div class="custom-gradient-header px-3 py-3 text-center">

                        <div
                            class="d-inline-flex bg-white bg-opacity-10 p-3 border border-2 border-primary rounded-circle text-primary mb-2 shadow-sm fs-4 align-items-center justify-content-center"
                            style="width: 60px; height: 60px;">

                            <i class="bi bi-bank2 fw-bold"></i>

                        </div>

                        <h1 class="h3 fw-bold text-dark m-0 text-uppercase">

                            <%=bean != null && bean.getId() > 0
                                ? "Update ATM System" : "Add ATM System"%>

                        </h1>

                        <small class="text-muted">
                            Create or manage ATM details
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


                        <!-- ATM Form -->

                        <form action="<%=ORSView.ATM_CTL%>" method="post">

                            <div class="row g-3">


                                <!-- Location -->

                                <div class="col-12 mt-0">

                                    <label class="form-label fw-bold fs-6">

                                        <i class="bi bi-geo-alt-fill text-primary me-1"></i>

                                        Location

                                        <span class="text-danger">*</span>

                                    </label>

                                    <input type="text" name="location"
                                        placeholder="Enter your location"
                                        value="<%=DataUtility.getStringData(bean.getLocation())%>"
                                        class="form-control form-control-sm
                                        <%=locationErrorMsg != null && !locationErrorMsg.trim().equals("") ? "is-invalid" : ""%>">

                                    <%
                                    if (locationErrorMsg != null && !locationErrorMsg.trim().equals("")) {
                                    %>

                                    <div class="invalid-feedback d-block fw-bold">

                                        <i class="bi bi-x-circle-fill"></i>

                                        <%=locationErrorMsg%>

                                    </div>

                                    <%
                                    }
                                    %>

                                </div>


                                <!-- Bank Name -->

                                <div class="col-12 mt-2">

                                    <label class="form-label fw-bold fs-6">

                                        <i class="bi bi-bank text-primary me-1"></i>

                                        Bank Name

                                        <span class="text-danger">*</span>

                                    </label>

                                    <input type="text" name="bank_name"
                                        placeholder="Enter your bank name"
                                        value="<%=DataUtility.getStringData(bean.getBankName())%>"
                                        class="form-control form-control-sm
                                        <%=bankNameErrorMsg != null && !bankNameErrorMsg.trim().equals("") ? "is-invalid" : ""%>">

                                    <%
                                    if (bankNameErrorMsg != null && !bankNameErrorMsg.trim().equals("")) {
                                    %>

                                    <div class="invalid-feedback d-block fw-bold">

                                        <i class="bi bi-x-circle-fill"></i>

                                        <%=bankNameErrorMsg%>

                                    </div>

                                    <%
                                    }
                                    %>

                                </div>


                                <!-- Cash Available -->

                                <div class="col-md-6 mt-2">

                                    <label class="form-label fw-bold fs-6">

                                        <i class="bi bi-cash-stack text-primary me-1"></i>

                                        Cash Available

                                        <span class="text-danger">*</span>

                                    </label>

                                    <input type="number" name="cash_available"
                                        placeholder="Enter available cash"
                                        value="<%=DataUtility.getStringData(bean.getCashAvailable())%>"
                                        class="form-control form-control-sm
                                        <%=cashAvailableErrorMsg != null && !cashAvailableErrorMsg.trim().equals("") ? "is-invalid" : ""%>">

                                    <%
                                    if (cashAvailableErrorMsg != null && !cashAvailableErrorMsg.trim().equals("")) {
                                    %>

                                    <div class="invalid-feedback d-block fw-bold">

                                        <i class="bi bi-x-circle-fill"></i>

                                        <%=cashAvailableErrorMsg%>

                                    </div>

                                    <%
                                    }
                                    %>

                                </div>


                                <!-- Status -->

                                <div class="col-md-6 mt-2">

                                    <label class="form-label fw-bold fs-6">

                                        <i class="bi bi-activity text-primary me-1"></i>

                                        Status

                                        <span class="text-danger">*</span>

                                    </label>

                                    <input type="text" name="status"
                                        placeholder="Enter your status"
                                        value="<%=DataUtility.getStringData(bean.getStatus())%>"
                                        class="form-control form-control-sm
                                        <%=statusErrorMsg != null && !statusErrorMsg.trim().equals("") ? "is-invalid" : ""%>">

                                    <%
                                    if (statusErrorMsg != null && !statusErrorMsg.trim().equals("")) {
                                    %>

                                    <div class="invalid-feedback d-block fw-bold">

                                        <i class="bi bi-x-circle-fill"></i>

                                        <%=statusErrorMsg%>

                                    </div>

                                    <%
                                    }
                                    %>

                                </div>


                                <!-- Save Button -->

                                <div class="col-12 text-center pt-3">

                                    <button type="submit" name="operation"
                                        value="<%=ATMCtl.OP_SAVE%>"
                                        class="btn btn-primary btn-sm px-5 shadow"
                                        style="font-size: 15px;">

                                        <i class="bi bi-bank2 me-2"></i>

                                        <%=bean != null && bean.getId() > 0
                                            ? "Update ATM" : "Add ATM"%>

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
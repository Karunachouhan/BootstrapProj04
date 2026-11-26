<%@page import="in.co.rays.proj4.controller.RailwayCtl"%>
<%@page import="in.co.rays.proj4.util.DataUtility"%>
<%@page import="in.co.rays.proj4.util.ServletUtility"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Railway Reservation</title>

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

    <jsp:useBean id="bean" class="in.co.rays.proj4.bean.RailwayBean"
        scope="request"></jsp:useBean>

    <%
    String succ = ServletUtility.getSuccessMessage(request);

    String error = ServletUtility.getErrorMessage(request);

    String passengerNameErrorMsg =
        ServletUtility.getErrorMessage("passengerName", request);

    String trainNoErrorMsg =
        ServletUtility.getErrorMessage("trainNo", request);

    String seatNoErrorMsg =
        ServletUtility.getErrorMessage("seatNo", request);

    String journeyDateErrorMsg =
        ServletUtility.getErrorMessage("journeyDate", request);
    %>

    <%@include file="Header.jsp"%>


    <!-- Main Railway Container -->

    <div class="container-fluid py-1 registration-page">

        <div class="row justify-content-center">

            <div class="col-12 col-sm-12 col-md-11 col-lg-6">

                <!-- Railway Registration Card -->

                <div class="card border-0 shadow-lg rounded-3 overflow-hidden registration-card">


                    <!-- Card Header -->

                    <div class="custom-gradient-header px-3 py-3 text-center">

                        <div
                            class="d-inline-flex bg-white bg-opacity-10 p-3 border border-2 border-primary rounded-circle text-primary mb-2 shadow-sm fs-4 align-items-center justify-content-center"
                            style="width: 60px; height: 60px;">

                            <i class="bi bi-train-front-fill fw-bold"></i>

                        </div>

                        <h1 class="h3 fw-bold text-dark m-0 text-uppercase">

                            <%=bean != null && bean.getId() > 0
                                ? "Update Railway Reservation" : "Add Railway Reservation"%>

                        </h1>

                        <small class="text-muted">
                            Create or manage railway reservation details
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


                        <!-- Railway Form -->

                        <form action="<%=ORSView.RAILWAY_CTL%>" method="post">

                            <div class="row g-3">


                                <!-- Passenger Name -->

                                <div class="col-12 mt-0">

                                    <label class="form-label fw-bold fs-6">

                                        <i class="bi bi-person-fill text-primary me-1"></i>

                                        Passenger Name

                                        <span class="text-danger">*</span>

                                    </label>

                                    <input type="text" name="passengerName"
                                        placeholder="Enter passenger name"
                                        value="<%=DataUtility.getStringData(bean.getPassengerName())%>"
                                        class="form-control form-control-sm
                                        <%=passengerNameErrorMsg != null && !passengerNameErrorMsg.trim().equals("") ? "is-invalid" : ""%>">

                                    <%
                                    if (passengerNameErrorMsg != null && !passengerNameErrorMsg.trim().equals("")) {
                                    %>

                                    <div class="invalid-feedback d-block fw-bold">

                                        <i class="bi bi-x-circle-fill"></i>

                                        <%=passengerNameErrorMsg%>

                                    </div>

                                    <%
                                    }
                                    %>

                                </div>


                                <!-- Train Number -->

                                <div class="col-md-6 mt-2">

                                    <label class="form-label fw-bold fs-6">

                                        <i class="bi bi-train-front-fill text-primary me-1"></i>

                                        Train No.

                                        <span class="text-danger">*</span>

                                    </label>

                                    <input type="number" name="trainNo"
                                        placeholder="Enter train number"
                                        value="<%=DataUtility.getStringData(bean.getTrainNo())%>"
                                        class="form-control form-control-sm
                                        <%=trainNoErrorMsg != null && !trainNoErrorMsg.trim().equals("") ? "is-invalid" : ""%>">

                                    <%
                                    if (trainNoErrorMsg != null && !trainNoErrorMsg.trim().equals("")) {
                                    %>

                                    <div class="invalid-feedback d-block fw-bold">

                                        <i class="bi bi-x-circle-fill"></i>

                                        <%=trainNoErrorMsg%>

                                    </div>

                                    <%
                                    }
                                    %>

                                </div>


                                <!-- Seat Number -->

                                <div class="col-md-6 mt-2">

                                    <label class="form-label fw-bold fs-6">

                                        <i class="bi bi-ticket-perforated-fill text-primary me-1"></i>

                                        Seat No.

                                        <span class="text-danger">*</span>

                                    </label>

                                    <input type="number" name="seatNo"
                                        placeholder="Enter seat number"
                                        value="<%=DataUtility.getStringData(bean.getSeatNo())%>"
                                        class="form-control form-control-sm
                                        <%=seatNoErrorMsg != null && !seatNoErrorMsg.trim().equals("") ? "is-invalid" : ""%>">

                                    <%
                                    if (seatNoErrorMsg != null && !seatNoErrorMsg.trim().equals("")) {
                                    %>

                                    <div class="invalid-feedback d-block fw-bold">

                                        <i class="bi bi-x-circle-fill"></i>

                                        <%=seatNoErrorMsg%>

                                    </div>

                                    <%
                                    }
                                    %>

                                </div>


                                <!-- Journey Date -->

                                <div class="col-12 mt-2">

                                    <label class="form-label fw-bold fs-6">

                                        <i class="bi bi-calendar-event-fill text-primary me-1"></i>

                                        Journey Date

                                        <span class="text-danger">*</span>

                                    </label>

                                    <input type="text" name="journeyDate"
                                        placeholder="Enter your journey date"
                                        value="<%=DataUtility.getStringData(bean.getJourneyDate())%>"
                                        class="form-control form-control-sm
                                        <%=journeyDateErrorMsg != null && !journeyDateErrorMsg.trim().equals("") ? "is-invalid" : ""%>">

                                    <%
                                    if (journeyDateErrorMsg != null && !journeyDateErrorMsg.trim().equals("")) {
                                    %>

                                    <div class="invalid-feedback d-block fw-bold">

                                        <i class="bi bi-x-circle-fill"></i>

                                        <%=journeyDateErrorMsg%>

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
                                        value="<%=RailwayCtl.OP_SAVE%>"
                                        class="btn btn-primary btn-sm px-5 shadow"
                                        style="font-size: 15px;">

                                        <i class="bi bi-train-front-fill me-2"></i>

                                        <%=bean != null && bean.getId() > 0
                                            ? "Update Reservation" : "Add Reservation"%>

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
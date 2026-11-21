<%@page import="in.co.rays.proj4.util.HTMLUtility"%>
<%@page import="java.util.HashMap"%>
<%@page import="in.co.rays.proj4.bean.MarksheetBean"%>
<%@page import="java.util.List"%>
<%@page import="in.co.rays.proj4.util.DataUtility"%>
<%@page import="in.co.rays.proj4.controller.MarksheetCtl"%>
<%@page import="in.co.rays.proj4.util.ServletUtility"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Marksheet</title>

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

    <jsp:useBean id="bean" class="in.co.rays.proj4.bean.MarksheetBean"
        scope="request"></jsp:useBean>

    <%
    String succ = ServletUtility.getSuccessMessage(request);

    String error = ServletUtility.getErrorMessage(request);

    List<MarksheetBean> marksheetList =
        (List) request.getAttribute("marksheetList");

    String rollNoErrorMsg =
        ServletUtility.getErrorMessage("rollNo", request);

    String studentIdErrorMsg =
        ServletUtility.getErrorMessage("studentId", request);

    String physicsErrorMsg =
        ServletUtility.getErrorMessage("physics", request);

    String chemistryErrorMsg =
        ServletUtility.getErrorMessage("chemistry", request);

    String mathsErrorMsg =
        ServletUtility.getErrorMessage("maths", request);
    %>

    <%@include file="Header.jsp"%>


    <!-- Main Marksheet Container -->

    <div class="container-fluid py-1 registration-page">

        <div class="row justify-content-center">

            <div class="col-12 col-sm-12 col-md-11 col-lg-6">

                <!-- Marksheet Registration Card -->

                <div class="card border-0 shadow-lg rounded-3 overflow-hidden registration-card">


                    <!-- Card Header -->

                    <div class="custom-gradient-header px-3 py-3 text-center">

                        <div
                            class="d-inline-flex bg-white bg-opacity-10 p-3 border border-2 border-primary rounded-circle text-primary mb-2 shadow-sm fs-4 align-items-center justify-content-center"
                            style="width: 60px; height: 60px;">

                            <i class="bi bi-journal-check fw-bold"></i>

                        </div>

                        <h1 class="h3 fw-bold text-dark m-0 text-uppercase">

                            <%=bean != null && bean.getId() > 0
                                ? "Update Marksheet" : "Add Marksheet"%>

                        </h1>

                        <small class="text-muted">
                            Create or manage student marksheet
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


                        <!-- Marksheet Form -->

                        <form action="<%=ORSView.MARKSHEET_CTL%>" method="post">

                            <div class="row g-3">


                                <!-- Roll Number -->

                                <div class="col-md-6 mt-0">

                                    <label class="form-label fw-bold fs-6">

                                        <i class="bi bi-card-list text-primary me-1"></i>

                                        Roll No.

                                        <span class="text-danger">*</span>

                                    </label>

                                    <input type="number" name="rollNo"
                                        placeholder="Enter your roll number"
                                        value="<%=DataUtility.getStringData(bean.getRollNo())%>"
                                        class="form-control form-control-sm
                                        <%=rollNoErrorMsg != null && !rollNoErrorMsg.trim().equals("") ? "is-invalid" : ""%>">

                                    <%
                                    if (rollNoErrorMsg != null && !rollNoErrorMsg.trim().equals("")) {
                                    %>

                                    <div class="invalid-feedback d-block fw-bold">

                                        <i class="bi bi-x-circle-fill"></i>

                                        <%=rollNoErrorMsg%>

                                    </div>

                                    <%
                                    }
                                    %>

                                </div>


                                <!-- Student Name -->

                                <div class="col-md-6 mt-0">

                                    <label class="form-label fw-bold fs-6">

                                        <i class="bi bi-person-fill text-primary me-1"></i>

                                        Student Name

                                        <span class="text-danger">*</span>

                                    </label>

                                    <%=HTMLUtility.getList("studentId",
                                        DataUtility.getStringData(bean.getStudentId()),
                                        marksheetList)%>

                                    <%
                                    if (studentIdErrorMsg != null && !studentIdErrorMsg.trim().equals("")) {
                                    %>

                                    <div class="text-danger small fw-bold mt-1">

                                        <i class="bi bi-x-circle-fill"></i>

                                        <%=studentIdErrorMsg%>

                                    </div>

                                    <%
                                    }
                                    %>

                                </div>


                                <!-- Physics -->

                                <div class="col-md-6 mt-2">

                                    <label class="form-label fw-bold fs-6">

                                        <i class="bi bi-book-fill text-primary me-1"></i>

                                        Physics

                                        <span class="text-danger">*</span>

                                    </label>

                                    <input type="number" name="physics"
                                        placeholder="Enter Physics marks"
                                        value="<%=DataUtility.getStringData(bean.getPhysics())%>"
                                        class="form-control form-control-sm
                                        <%=physicsErrorMsg != null && !physicsErrorMsg.trim().equals("") ? "is-invalid" : ""%>">

                                    <%
                                    if (physicsErrorMsg != null && !physicsErrorMsg.trim().equals("")) {
                                    %>

                                    <div class="invalid-feedback d-block fw-bold">

                                        <i class="bi bi-x-circle-fill"></i>

                                        <%=physicsErrorMsg%>

                                    </div>

                                    <%
                                    }
                                    %>

                                </div>


                                <!-- Chemistry -->

                                <div class="col-md-6 mt-2">

                                    <label class="form-label fw-bold fs-6">

                                        <i class="bi bi-book-fill text-primary me-1"></i>

                                        Chemistry

                                        <span class="text-danger">*</span>

                                    </label>

                                    <input type="number" name="chemistry"
                                        placeholder="Enter Chemistry marks"
                                        value="<%=DataUtility.getStringData(bean.getChemistry())%>"
                                        class="form-control form-control-sm
                                        <%=chemistryErrorMsg != null && !chemistryErrorMsg.trim().equals("") ? "is-invalid" : ""%>">

                                    <%
                                    if (chemistryErrorMsg != null && !chemistryErrorMsg.trim().equals("")) {
                                    %>

                                    <div class="invalid-feedback d-block fw-bold">

                                        <i class="bi bi-x-circle-fill"></i>

                                        <%=chemistryErrorMsg%>

                                    </div>

                                    <%
                                    }
                                    %>

                                </div>


                                <!-- Maths -->

                                <div class="col-md-6 mt-2">

                                    <label class="form-label fw-bold fs-6">

                                        <i class="bi bi-calculator-fill text-primary me-1"></i>

                                        Maths

                                        <span class="text-danger">*</span>

                                    </label>

                                    <input type="number" name="maths"
                                        placeholder="Enter Maths marks"
                                        value="<%=DataUtility.getStringData(bean.getMaths())%>"
                                        class="form-control form-control-sm
                                        <%=mathsErrorMsg != null && !mathsErrorMsg.trim().equals("") ? "is-invalid" : ""%>">

                                    <%
                                    if (mathsErrorMsg != null && !mathsErrorMsg.trim().equals("")) {
                                    %>

                                    <div class="invalid-feedback d-block fw-bold">

                                        <i class="bi bi-x-circle-fill"></i>

                                        <%=mathsErrorMsg%>

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
                                        value="<%=MarksheetCtl.OP_SAVE%>"
                                        class="btn btn-primary btn-sm px-5 shadow"
                                        style="font-size: 15px;">

                                        <i class="bi bi-journal-check me-2"></i>

                                        <%=bean != null && bean.getId() > 0
                                            ? "Update Marksheet" : "Add Marksheet"%>

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
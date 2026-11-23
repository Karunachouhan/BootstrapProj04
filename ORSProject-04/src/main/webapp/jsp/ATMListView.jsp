<%@page import="in.co.rays.proj4.controller.ATMCtl"%>
<%@page import="java.util.Iterator"%>
<%@page import="in.co.rays.proj4.bean.ATMBean"%>
<%@page import="java.util.List"%>
<%@page import="in.co.rays.proj4.util.ServletUtility"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>ATM List</title>
</head>
<body>

	<%
	String succ = ServletUtility.getSuccessMessage(request);
	String error = ServletUtility.getErrorMessage(request);
	List<ATMBean> list = ServletUtility.getList(request);
	int pageNo = ServletUtility.getPageNo(request);
	int pageSize = ServletUtility.getPageSize(request);
	int index = (pageNo - 1) * pageSize + 1;
	Iterator<ATMBean> it = list.iterator();
	%>

	<%@include file="Header.jsp"%>

	<!-- Main Container -->
	<div align="center" class="container-fluid px-3 pb-5 mb-5">

		<div class="row justify-content-center">
			<div class="col-12 col-lg-10 col-xl-9">

				<!-- Heading -->
				<h1 class="display-6 fw-bold text-primary m-0 mb-3 text-start">
					ATM List</h1>

				<!-- Success Message -->
				<%
				if (succ != null && !succ.trim().equals("")) {
				%>
				<div
					class="alert alert-success alert-dismissible fade show shadow-sm border-0 py-2 mb-3"
					role="alert">
					<div class="fw-medium"><%=succ%></div>
				</div>
				<%
				}
				%>

				<!-- Error Message -->
				<%
				if (error != null && !error.trim().equals("")) {
				%>
				<div
					class="alert alert-danger alert-dismissible fade show shadow-sm border-0 py-2 mb-3"
					role="alert">
					<div class="fw-medium"><%=error%></div>
				</div>
				<%
				}
				%>

				<form action="<%=ORSView.ATM_LIST_CTL%>" method="post">

					<!-- Compact Search Box -->
					<div
						class="bg-white border border-primary rounded-3 p-3 shadow-sm mb-3">

						<div class="row g-2 align-items-end">

							<div class="col-12 col-md-6 col-lg-5 text-start">

								<label class="form-label small fw-semibold text-primary mb-1">
									Bank Name </label> <input type="text" name="name" value=""
									class="form-control" placeholder="search by bank name">

							</div>

							<div class="col-12 col-md-auto">

								<input type="submit" name="operation"
									value="<%=ATMCtl.OP_SEARCH%>"
									class="btn btn-primary px-4 shadow-sm">

							</div>

						</div>
					</div>

					<!-- ATM Table -->
					<div
						class="bg-white border rounded-3 shadow-sm overflow-hidden mb-3 table-responsive">

						<table class="table table-hover align-middle text-center mb-0">

							<thead class="table-primary text-primary-emphasis border-bottom">

								<tr>

									<th class="py-2" style="width: 130px;">

										<div
											class="form-check d-flex justify-content-center align-items-center gap-2 mb-0">

											<input
												class="form-check-input mt-0 shadow-none border-primary"
												type="checkbox"
												onclick="document.querySelectorAll('input[name=ids]').forEach(c=>c.checked=this.checked)">

											<label class="form-check-label small fw-bold"> Select
												All </label>

										</div>

									</th>

									<th class="py-2" style="width: 80px;">S No.</th>

									<th class="py-2">Location</th>

									<th class="py-2">Bank Name</th>

									<th class="py-2">Cash Available</th>

									<th class="py-2">Status</th>

									<th class="py-2" style="width: 90px;">Edit</th>

								</tr>

							</thead>

							<%
							while (it.hasNext()) {
								ATMBean bean = it.next();
							%>

							<tr align="center">

								<td><input type="checkbox" name="ids"
									class="form-check-input shadow-none border-primary-subtle"
									value="<%=bean.getId()%>"></td>

								<td class="text-secondary fw-semibold"><%=index++%></td>

								<td class="text-secondary"><%=bean.getLocation()%></td>

								<td class="fw-bold text-dark"><%=bean.getBankName()%></td>

								<td class="text-secondary"><%=bean.getCashAvailable()%></td>

								<td class="text-secondary"><%=bean.getStatus()%></td>

								<td><a
									class="btn btn-outline-primary btn-sm px-3 rounded-pill fw-medium"
									href="<%=ORSView.ATM_CTL + "?id=" + bean.getId()%>"> Edit </a>

								</td>

							</tr>

							<%
							}
							%>


						</table>
						<%@include file="ListFooter.jsp"%>

					</div>

				</form>

			</div>
		</div>

	</div>

	<%@include file="Footer.jsp"%>

</body>
</html>
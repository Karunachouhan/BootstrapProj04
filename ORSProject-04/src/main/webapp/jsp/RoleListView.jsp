<%@page import="in.co.rays.proj4.controller.RoleCtl"%>
<%@page import="in.co.rays.proj4.controller.BaseCtl"%>
<%@page import="java.util.Iterator"%>
<%@page import="in.co.rays.proj4.util.ServletUtility"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
</head>
<body class="">

	<%
	String succ = ServletUtility.getSuccessMessage(request);
	String error = ServletUtility.getErrorMessage(request);
	List<RoleBean> list = ServletUtility.getList(request);
	int pageNo = ServletUtility.getPageNo(request);
	int pageSize = ServletUtility.getPageSize(request);
	int index = (pageNo - 1) * pageSize + 1;
	Iterator<RoleBean> it = list.iterator();
	%>
	<%@ include file="Header.jsp"%>

	<!-- pb-5 mb-5 keeps the last rows from hiding behind the fixed footer -->
	<div class="container-fluid px-3 pb-5 mb-5">
		<div class="row justify-content-center">
			<div class="col-12 col-lg-10 col-xl-9">
				<div class="mb-4">
					<%-- OLD heading (kept): <h1>Role List</h1> --%>
					<h1 class="display-6 fw-bold text-primary m-0">Role List</h1>
				</div>
				<%-- OLD messages (kept, not deleted; replaced by the Bootstrap alerts below)
		<h3 style="color: green"><%=succ%></h3>
		<h3 style="color: red"><%=error%></h3>
		--%>

				<%
				if (succ != null && !succ.trim().equals("")) {
				%>
				<div
					class="alert alert-success alert-dismissible fade show shadow-sm border-0 py-3 mb-4"
					role="alert">
					<div class="fw-medium"><%=succ%></div>
				</div>
				<%
				}
				%>

				<%
				if (error != null && !error.trim().equals("")) {
				%>
				<div
					class="alert alert-danger alert-dismissible fade show shadow-sm border-0 py-3 mb-4"
					role="alert">
					<div class="fw-medium"><%=error%></div>
				</div>
				<%
				}
				%>

				<form action="<%=ORSView.ROLE_LIST_CTL%>" method="post">

					<%-- OLD search table (kept, not deleted; replaced by the Bootstrap row below)
			<table>
				<tr>
					<th>Name</th>
					<td><input type="text" name="name" value=""
						placeholder="search by name"><input type="submit"
						name="operation" value="<%=RoleCtl.OP_SEARCH%>"></td>
				</tr>
			</table>
			--%>

					<!-- NEW: Bootstrap search row (same field names, so RoleListCtl reads them as before) -->
					<div
						class="bg-white border border-top-3 border-primary rounded-3 p-3 shadow-sm mb-4">
						<div class="row g-3 align-items-end justify-content-between">
							<div class="col-12 col-md-6 col-lg-5 col-xl-4">
								<label class="form-label small fw-semibold text-primary mb-1">Name</label>
								<div class="input-group">
									<input type="text" name="name" value="" class="form-control"
										placeholder="search by name">
								</div>
							</div>

							<div class="col-12 col-md-auto d-flex gap-2">
								<input type="submit" name="operation"
									value="<%=RoleCtl.OP_SEARCH%>"
									class="btn btn-primary px-4 shadow-sm">
							</div>

						</div>
					</div>

					<%-- OLD table tag (kept): <table border="10px" width="100%"> --%>
					<div
						class="bg-white border rounded-3 shadow-sm overflow-hidden mb-3 table-responsive">
						<table class="table table-hover align-middle text-center mb-0">

							<%-- OLD header row (kept, not deleted; replaced by the thead below)
				<tr style="background: skyblue">
					<th><input type="checkbox"
						onclick="document.querySelectorAll('input[name=ids]').forEach(c=>c.checked=this.checked)">Select
						All</th>
					<th>S No</th>
					<th>Id</th>
					<th>Name</th>
					<th>Description</th>
					<th>Edit</th>
				</tr>
				--%>

							<thead class="table-primary text-primary-emphasis border-bottom">
								<tr>
									<th class="py-3" style="width: 130px;">
										<div
											class="form-check d-flex justify-content-center align-items-center gap-2 mb-0">
											<input
												class="form-check-input mt-0 shadow-none border-primary"
												type="checkbox"
												onclick="document.querySelectorAll('input[name=ids]').forEach(c=>c.checked=this.checked)">
											<label class="form-check-label small fw-bold">Select
												All</label>
										</div>
									</th>
									<th class="py-3" style="width: 90px;">S No</th>
									<th class="py-3" style="width: 90px;">Id</th>
									<th class="py-3">Name</th>
									<th class="py-3">Description</th>
									<th class="py-3" style="width: 90px;">Edit</th>
								</tr>
							</thead>

							<%
							while (it.hasNext()) {
								RoleBean bean = it.next();
							%>
							<tr align="center">
								<td><input type="checkbox" name="ids"
									class="form-check-input shadow-none border-primary-subtle"
									value="<%=bean.getId()%>"></td>
								<td class="text-secondary fw-semibold"><%=index++%></td>
								<%-- OLD Id cell (kept; it was missing its closing </td>): <td><%=bean.getId()%> --%>
								<td><span
									class="badge bg-primary-subtle text-primary border border-primary-subtle px-2 py-1"><%=bean.getId()%></span></td>
								<td class="fw-bold text-dark"><%=bean.getName()%></td>
								<td class="text-muted text-start text-wrap"
									style="max-width: 320px;"><%=bean.getDescription()%></td>
								<%-- OLD edit link (kept): <td><a href="<%=ORSView.ROLE_CTL + "?id=" + bean.getId()%>">Edit</a></td> --%>
								<td><a
									class="btn btn-outline-primary btn-sm px-3 rounded-pill fw-medium"
									href="<%=ORSView.ROLE_CTL + "?id=" + bean.getId()%>">Edit</a></td>
							</tr>
							<%
							}
							%>

						</table>
						<%@ include file="ListFooter.jsp"%>
					</div>
				</form>

			</div>
		</div>
	</div>
	<%@ include file="Footer.jsp"%>
</body>
</html>
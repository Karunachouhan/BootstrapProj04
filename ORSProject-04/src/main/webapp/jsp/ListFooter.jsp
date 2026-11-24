<%@page import="in.co.rays.proj4.controller.BaseCtl"%>
<%@page import="in.co.rays.proj4.bean.RoleBean"%>
<%@page import="java.util.List"%>
<%@page import="in.co.rays.proj4.util.ServletUtility"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	int pageNo1 = ServletUtility.getPageNo(request);
	List nextList = (List) request.getAttribute("nextList");
	%>
	<div class="bg-white p-3 shadow-sm mt-3 w-100">
		<input type="hidden" name="pageNo" value="<%=pageNo1%>">

		<div
			class="d-flex align-items-center justify-content-between flex-wrap gap-2">

			<!-- NEW: Previous = btn-warning when enabled, btn-secondary when disabled -->
			<div class="text-start position-relative d-inline-block">
				<span
					class="carousel-control-prev-icon position-absolute top-50 translate-middle-y start-0 ms-3 ps-3 pointer-events-none z-3 <%=pageNo1 == 1 ? "text-muted opacity-50" : "text-white"%>"
					style="width: 12px; height: 12px;"></span> <input type="submit"
					name="operation"
					class="btn px-4 ps-5 pe-4 fw-semibold shadow-sm d-inline-flex align-items-center gap-1 <%=pageNo1 == 1 ? "btn-light border text-muted opacity-50" : "btn-primary"%>"
					<%=pageNo1 == 1 ? "disabled" : ""%>
					value="<%=BaseCtl.OP_PREVIOUS%>">
			</div>

			<!-- NEW: Delete = btn-danger -->
			<div class="text-center position-relative d-inline-block">
				<span
					class="position-absolute top-50 translate-middle-y start-0 ps-3 text-danger pointer-events-none z-3">🗑️</span>

				<input type="submit" name="operation"
					class="btn btn-outline-danger px-4 ps-5 pe-4 fw-semibold shadow-sm d-inline-flex align-items-center gap-1"
					value="<%=BaseCtl.OP_DELETE%>">
			</div>

			<!-- NEW: Next = btn-warning when enabled, btn-secondary when disabled -->
			<div class="text-end position-relative d-inline-block" class="py-2">
				<input type="submit" name="operation"
					class="btn px-4 ps-4 pe-5 fw-semibold shadow-sm d-inline-flex align-items-center gap-1 <%=nextList.size() == 0 ? "btn-light border text-muted opacity-50" : "btn-primary"%>"
					<%=nextList.size() == 0 ? "disabled" : ""%>
					value="<%=BaseCtl.OP_NEXT%>"> <span
					class="carousel-control-next-icon position-absolute top-50 translate-middle-y end-0 pe-5 pointer-events-none z-3 <%=nextList.size() == 0 ? " text-muted opacity-50" : "text-white"%>"
					style=" height: 12px;"></span>
			</div>
		</div>
	</div>

</body>
</html>
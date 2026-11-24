<%@page import="in.co.rays.proj4.util.MessageSource"%>

<html>

<head>

<!-- Bootstrap 5 CSS (same version as your header; remove this line if the header already loads it on every page) -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

<!-- Bootstrap Icons (for the B logo, Instagram and Facebook icons) -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

<style type="text/css">
#footer {
	position: fixed;
	background: linear-gradient(135deg, #0d2137 0%, #1565c0 100%);
box-shadow: 0 -6px 20px rgba(0, 0, 0, 0.45);
	left: 0;
	width: 100%;
	bottom: 0;
	/* OLD: background-color: white; */
	/* NEW: same theme color as the header navbar */
	/*     background-color: #e3f2fd;
 */
	text-align: center;
}
</style>

</head>

<body>
	<%
	MessageSource ms1 = MessageSource.getInstance();
	%>



		<!-- ================= NEW BOOTSTRAP 5 FOOTER ================= -->

		<!-- OLD (kept): <div class="container"> -->
		<!-- NEW: container-fluid makes the footer use the full screen width, px-3 matches the header padding -->
<!-- 		<div class="container-fluid " >
 -->
			<!-- OLD (kept): <footer class="d-flex flex-wrap justify-content-between align-items-center py-2 border-top"> -->
			<!-- NEW: py-3 gives a little more height, same as the header -->
			<footer
				class="d-flex flex-wrap justify-content-center align-items-center py-3 px-3 border-top" id="footer"  style="border-color: #1565c0 !important;">

				<!-- Left: logo + footer text (still uses your MessageSource keys, so Hindi works too) -->
				<div class="d-flex align-items-center">

					<span class="text-white fw-semibold"> <%=ms1.get("footer.rights")%> <%=ms1.get("footer.company")%>
						<%=ms1.get("footer.copyright")%>
					</span>

				</div>



			</footer>

<!-- 		</div>
 -->		<!-- ================= END FOOTER ================= -->


</body>

</html>
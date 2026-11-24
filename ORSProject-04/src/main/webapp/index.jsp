<!DOCTYPE html>
<%@page import="in.co.rays.proj4.controller.ORSView"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Index Page</title>
<title>Online Result System</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
    rel="stylesheet">

<link rel="stylesheet"
    href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<style type="text/css">
html, body {
    margin: 0;
    padding: 0;
    height: 100%;
    width: 100%;
}
body {
	  background: linear-gradient(rgba(240, 244, 255, 0.75), rgba(232, 240, 254, 0.8)),
        url('<%=request.getContextPath()%>/img/background.jpg') center/cover no-repeat fixed;
    position: relative;
}

.welcome-card {
    background: #fff;
    border-radius: 20px;
    box-shadow: 0 10px 40px rgba(13, 110, 253, 0.2);
    padding: 60px 50px;
}

.ors-link {
    display: inline-block;
    transition: transform 0.2s ease;
}

.ors-link:hover {
  transform: scale(1.1); 
}
</style>
</head>
<body class="d-flex align-items-center justify-content-center">


	
	    <div class="welcome-card text-center" style="max-width: 600px;">
	            <!-- LOGO -->
        <img src="img/customLogo.jpg" width="280" height="112"
            class="mb-4" alt="ORS Logo">
            
              <hr class="my-4">

        <!-- ICON -->
        <i class="bi bi-mortarboard-fill text-primary mb-2"
            style="font-size: 55px;"></i>
                    <!-- TITLE LINK -->
        <h1 class="mb-2">
            <a href="<%=ORSView.WELCOME_CTL%>"
                class="ors-link text-danger fw-bold text-decoration-none"
                style="font-size: 2.6rem;">
                Online Result System
            </a>
        </h1>

        <p class="text-muted mb-0">
            Click above to continue to the portal
        </p>

	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css"
	rel="stylesheet" />
	<link href="./css/global.css" rel="stylesheet" />
<title>Admin | View Inquiry</title>
</head>
<body class="min-h-screen">
	
	<%
	if (session.getAttribute("username") == null) {
		response.sendRedirect("login.jsp");
	}
	%>

	<header>
		<div
			class="w-full flex justify-between items-center p-4 mb-3 bg-gray-800 text-white">
			<h1 class="font-bold text-3xl">GISMS</h1>
			<form action="Logout">
				<button type="submit"
					class="bg-indigo-600 py-2 px-5 rounded-3xl text-base hover:bg-indigo-500 transition ease-in ring-2 ring-gray-400">Logout</button>
			</form>
		</div>
		<div class="md:px-4 px-2 mb-7">
			<h2 class="text-white sm:text-left text-center font-bold md:text-5xl sm:text-3xl text-2xl mb-6">
				Enrollments
			</h2>
			<nav
				class="flex sm:justify-between justify-center items-center flex-wrap text-lg font-medium">
				<div class="mb-3">
					<h4 class="text-white">
						Admin info | <a
							class="bg-indigo-600 hover:bg-indigo-500 transition ease-in ring-2 ring-gray-400 py-2 px-5 rounded-3xl"
							href="Profile">Profile</a>
					</h4>
				</div>
				<div class="my-4 ml-2 space-x-3 flex justify-center">
					<button
						class="bg-indigo-600 text-white hover:bg-indigo-500 transition ease-in ring-2 ring-gray-400 mb-1 py-2 px-4 rounded-3xl">
						<a href="enroll.jsp">Enroll</a>
					</button>
					<button
						class="bg-indigo-600 text-white hover:bg-indigo-500 transition ease-in ring-2 ring-gray-400 mb-1 py-2 px-3 rounded-3xl">
						<a href="Notices">Notices</a>
					</button>
					<button
						class="bg-indigo-600 text-white hover:bg-indigo-500 transition ease-in ring-2 ring-gray-400 mb-1 py-2 px-3 rounded-3xl">
						<a href="ViewInquiry">Inquiry</a>
					</button>
				</div>
			</nav>
		</div>
	</header>
	
	<div class="flex flex-col items-center mb-5 md:mx-4 sm:mx-3 mx-2">
		<h2 class="text-white text-center font-medium md:text-3xl sm:text-2xl text-xl mb-4">
			Recent Inquiries
		</h2>
    	<c:forEach var="item" items="${inquiries}">
			<div class="bg-gray-900 bg-opacity-80 text-white rounded-2xl shadow-2xl w-full max-w-3xl p-5 mb-3">
				<div class="text-gray-300 text-sm mb-3">
					From: <span class="text-blue-400"><c:out value="${item.email}" /></span>
				</div>
				<div class="text-indigo-400 text-xl font-medium mb-2">
					<c:out value="${item.title}" />
				</div>
				<div class="text-base mb-5">
					<c:out value="${item.inquiry}" />
				</div>
				<a href="InquiryResponse?id=<c:out value="${item.iid}"/>">
	       			<button class="bg-indigo-600 text-white hover:bg-indigo-500 transition ease-in ring-2 ring-gray-400 mb-1 py-2 px-3 rounded-3xl">Mark as Read</button>
	    		</a>
		  	</div>
		</c:forEach>
	</div>
	
</body>
</html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<%-- <h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P> --%>

<form action="exUploadPost" method="post" enctype="multipart/form-data">
	<div>
		<input type="file" name="files">
	</div>
	<div>
		<input type="file" name="files">
	</div>
		<div>
		<input type="file" name="files">
	</div>
		<div>
		<input type="file" name="files">
	</div>
		<div>
		<input type="file" name="files">
	</div>
	<div>
		<input type="submit">
	</div>
</form>
</body>
</html>

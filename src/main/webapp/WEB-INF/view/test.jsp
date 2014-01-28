<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
    <head>
        <title>JPA Testbook Web Application Tutorial</title>
    </head>
 
    <body>
    	<a href="${splunkUrl}">Go To NetVistra</a>
    	<input type="button"  onclick="location.href='config.html'" value="Go To Index Source List">
    	
        <form method="POST" action="test.html">
            Name: <input type="text" name="name" />
            <input type="submit" value="Add" />
        </form>

		<c:forEach var="test" items="${testList}">
			<c:out value="${test.name}"/>
		</c:forEach>
	</body>
</html>
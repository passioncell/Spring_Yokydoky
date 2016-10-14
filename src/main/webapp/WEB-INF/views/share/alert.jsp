<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>

	<c:if test = "${key eq '수정완료'}">
		<script>
			alert("수정이 완료 되었습니다.");
		    history.go(-1);
		</script>
	</c:if>

	<c:if test = "${key eq '아이디 중복'}">
		<script>
			alert("아이디가 중복되었습니다.");
		    history.go(-1);
		</script>
	</c:if>
	
	<c:if test = "${key eq '아이디 불일치'}">
		<script>
			alert("일치하는 아이디와 비밀번호가 없습니다.");
		    history.go(-1);
		</script>
	</c:if>
	
	<c:if test = "${key eq '키워드 추가'}">
		<script>
			alert("키워드가 추가되었습니다.");
			location.href="${pageContext.request.contextPath}/keyword/setting";
		</script>
	</c:if>

</body>
</html>
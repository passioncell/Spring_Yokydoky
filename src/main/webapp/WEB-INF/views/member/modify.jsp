<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:directive.include file="../share/header.jsp" />
<jsp:directive.include file="../share/checkLogin.jsp" />
<!-- CONTENT -->
<form action="${pageContext.request.contextPath}/member/modify_submit" method="post">
	<div class="form-horizontal">
		<h2>내정보 변경</h2>
		<hr />
		<%
			
		%>
		<div class="form-group">
			<div class="col-sm-2"></div>
			<div class="col-sm-2">아이디</div>
			<div class="col-sm-6">
				<input type="text" class="form-control" id="email" name="email" value="${userInfoMap.email }">
			</div>
			<div class="col-sm-2"></div>
		</div>

		<div class="form-group">
			<div class="col-sm-2"></div>
			<div class="col-sm-2">비밀번호</div>
			<div class="col-sm-6">
				<input type="password" class="form-control" id="password" name="password">
			</div>
			<div class="col-sm-2"></div>
		</div>
		
		<div class="form-group">
			<div class="col-sm-2"></div>
			<div class="col-sm-2">이름</div>
			<div class="col-sm-6">
				<input type="text" class="form-control" id="name" name="name">
			</div>
			<div class="col-sm-2"></div>
		</div>
		
		<div class="form-group">
			<div class="col-sm-2"></div>
			<div class="col-sm-2">생년월일</div>
			<div class="col-sm-6">
				<input type="text" class="form-control" id="birthday" name="birthday">
			</div>
			<div class="col-sm-2"></div>
		</div>
		
		
		<div class="form-group">
			<div class="col-sm-2"></div>
			<div class="col-sm-2">성별</div>
			<div class="col-sm-3">
				남성 : <input type="radio" class="form-control" id="sex" name="sex" value="male">
				
				여성 : <input type="radio" class="form-control" id="sex" name="sex" value="female">
			</div>
			<div class="col-sm-2"></div>
		</div>
		

		<div class="form-group">
			<input type="submit" value="수정완료" class="btn btn-primary" />
		</div>
	</div>
</form>
<jsp:directive.include file="../share/footer.jsp" />
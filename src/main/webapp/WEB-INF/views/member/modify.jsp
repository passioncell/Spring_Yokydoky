<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<jsp:directive.include file="../share/header.jsp" />
<jsp:directive.include file="../share/checkLogin.jsp" />
<!-- CONTENT -->
<form action="" method="post">
	<div class="form-horizontal">
		<h2>������ ����</h2>
		<hr />
		<%
			
		%>
		<div class="form-group">
			<div class="col-sm-2"></div>
			<div class="col-sm-2">���̵�</div>
			<div class="col-sm-6">
				<input type="text" class="form-control" id="email" name="email" value="${userInfoMap.email }">
			</div>
			<div class="col-sm-2"></div>
		</div>

		<div class="form-group">
			<div class="col-sm-2"></div>
			<div class="col-sm-2">��й�ȣ</div>
			<div class="col-sm-6">
				<input type="password" class="form-control" id="password" name="password">
			</div>
			<div class="col-sm-2"></div>
		</div>
		
		<div class="form-group">
			<div class="col-sm-2"></div>
			<div class="col-sm-2">�̸�</div>
			<div class="col-sm-6">
				<input type="text" class="form-control" id="name" name="name">
			</div>
			<div class="col-sm-2"></div>
		</div>
		
		<div class="form-group">
			<div class="col-sm-2"></div>
			<div class="col-sm-2">�������</div>
			<div class="col-sm-6">
				<input type="text" class="form-control" id="birthday" name="birthday">
			</div>
			<div class="col-sm-2"></div>
		</div>
		
		
		<div class="form-group">
			<div class="col-sm-2"></div>
			<div class="col-sm-2">����</div>
			<div class="col-sm-3">
				���� : <input type="radio" class="form-control" id="sex" name="sex" value="male">
				
				���� : <input type="radio" class="form-control" id="sex" name="sex" value="female">
			</div>
			<div class="col-sm-2"></div>
		</div>
		

		<div class="form-group">
			<input type="submit" value="�����Ϸ�" class="btn btn-primary" />
		</div>
	</div>
</form>
<jsp:directive.include file="../share/footer.jsp" />
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<jsp:directive.include file="share/header.jsp" />
<jsp:directive.include file="share/checkLogin.jsp" />
<h3>
	<%
		Object obj1 = session.getAttribute("userEmail");
		String mySessionName = (String) obj1;
		out.println(mySessionName + "�� �ȳ��ϼ���");
	%>
</h3>
<div class="jumbotron">
	<h1>YokyDoky��?</h1>
	<p class="lead">�������� �̿��� ����Ʈ �Ź� ��� ���ø����̼� �Դϴ�.</p>
	<p>�⺻������ ��� ������ ����ؼ� �����帮�� ����ڰ� ��ȣ�ϴ� Ű���带 �����ϸ� ���� Ű������� ���Ե� ��絵
		����Ͽ� �����մϴ�.</p>
	<p>
		<a href="article/list" class="btn btn-primary btn-lg">��������&raquo;</a>

	</p>
</div>

<div class="row">
	<div class="col-md-4">
		<h2>Interface.</h2>
		<p>�ս��� ������ �������̽�.</p>
		<p>
			<a class="btn btn-default" href="article/list">�������� &raquo;</a>
		</p>
	</div>
	<div class="col-md-4">
		<h2>Summeraize.</h2>
		<p>�� �б� ���� �Ź���縦 ���� PageRank �˰����� �̿��Ͽ� ����ص帳�ϴ�.</p>
		<p>
			<a class="btn btn-default" href="article/list">�������� &raquo;</a>
		</p>
	</div>
	<div class="col-md-4">
		<h2>Recommand.</h2>
		<p>���ɺо��� Ű���带 �����Ͻø� �ش� Ű����� ���� ���ü��� ���� �ٸ� ������� ����ؼ� �����帳�ϴ�.</p>
		<p>
			<a class="btn btn-default" href="article/list">�������� &raquo;</a>
		</p>
	</div>
</div>

<hr>

<jsp:directive.include file="share/footer.jsp" />





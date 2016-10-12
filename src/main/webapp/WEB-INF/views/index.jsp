<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<jsp:directive.include file="share/header.jsp" />
<jsp:directive.include file="share/checkLogin.jsp" />
<h3>
	<%
		Object obj1 = session.getAttribute("userEmail");
		String mySessionName = (String) obj1;
		out.println(mySessionName + "님 안녕하세요");
	%>
</h3>
<div class="jumbotron">
	<h1>YokyDoky란?</h1>
	<p class="lead">딥러닝을 이용한 스마트 신문 요약 어플리케이션 입니다.</p>
	<p>기본적으로 기사 원문을 요약해서 보여드리며 사용자가 선호하는 키워드를 설정하면 관련 키워드들이 포함된 기사도
		요약하여 제공합니다.</p>
	<p>
		<a href="article/list" class="btn btn-primary btn-lg">보러가기&raquo;</a>

	</p>
</div>

<div class="row">
	<div class="col-md-4">
		<h2>Interface.</h2>
		<p>손쉽고 심플한 인터페이스.</p>
		<p>
			<a class="btn btn-default" href="article/list">보러가기 &raquo;</a>
		</p>
	</div>
	<div class="col-md-4">
		<h2>Summeraize.</h2>
		<p>길어서 읽기 힘든 신문기사를 구글 PageRank 알고리즘을 이용하여 요약해드립니다.</p>
		<p>
			<a class="btn btn-default" href="article/list">보러가기 &raquo;</a>
		</p>
	</div>
	<div class="col-md-4">
		<h2>Recommand.</h2>
		<p>관심분야의 키워드를 설정하시면 해당 키워드는 물론 관련성이 높은 다른 기사들까지 요약해서 보여드립니다.</p>
		<p>
			<a class="btn btn-default" href="article/list">보러가기 &raquo;</a>
		</p>
	</div>
</div>

<hr>

<jsp:directive.include file="share/footer.jsp" />





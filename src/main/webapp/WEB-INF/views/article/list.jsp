<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:directive.include file="../share/header.jsp" />
<ul class="nav nav-pills" role="tablist">
	<li role="presentation" class="active"><a href="#">전체</a></li>
	<li role="presentation"><a href="#">문화</a></li>
	<li role="presentation"><a href="#">경제</a></li>
	<li role="presentation"><a href="#">국제</a></li>
	<li role="presentation"><a href="#">과학/IT</a></li>
	<li role="presentation"><a href="#">정치</a></li>
	<li role="presentation"><a href="#">사회</a></li>
</ul>
<br>

<div class="row">
	<div class="col-sm-6">
		<div class="panel panel-info">
			<div class="panel-heading">
				<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
				Title
			</div>
			<div class="panel-body">
				<p>
					${articleListMap.get(0).title}
					리포터 : 서현배 <br /> 작성일시 : 2016-10-11 11:20:11<br /> 수정일시 :
					2016-10-11 12:20:13<br /> 키워드 : #간장게장 #양념게장 #불닭볶음면
				</p>
				내용
			</div>
		</div>
	</div>

	<div class="col-sm-6">
		<div class="panel panel-info">
			<div class="panel-heading">
				<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>Title
			</div>
			<div class="panel-body">
				<p>
					리포터 : 서현배 <br /> 작성일시 : 2016-10-11 11:20:11<br /> 수정일시 :
					2016-10-11 12:20:13<br /> 키워드 : #간장게장 #양념게장 #불닭볶음면
				</p>
				내용
			</div>
		</div>
	</div>

	<div class="col-sm-6">
		<div class="panel panel-info">
			<div class="panel-heading">
				<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
				Title
			</div>
			<div class="panel-body">
				<p>
					리포터 : 서현배 <br /> 작성일시 : 2016-10-11 11:20:11<br /> 수정일시 :
					2016-10-11 12:20:13<br /> 키워드 : #간장게장 #양념게장 #불닭볶음면
				</p>
				내용
			</div>
		</div>
	</div>

	<div class="col-sm-6">
		<div class="panel panel-info">
			<div class="panel-heading">
				<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
				Title
			</div>
			<div class="panel-body">
				<p>
					리포터 : 서현배 <br /> 작성일시 : 2016-10-11 11:20:11<br /> 수정일시 :
					2016-10-11 12:20:13<br /> 키워드 : #간장게장 #양념게장 #불닭볶음면
				</p>
				내용
			</div>
		</div>
	</div>

</div>
<jsp:directive.include file="../share/footer.jsp" />
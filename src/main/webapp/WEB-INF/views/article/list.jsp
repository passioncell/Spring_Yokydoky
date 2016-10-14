<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:directive.include file="../share/header.jsp" />
<ul class="nav nav-pills" role="tablist">
<!-- 	active 부분 현재 카테고리로 활성화되게 -->
	<li role="presentation" class="active"><a href="#">전체</a></li>
	<li role="presentation"><a href="javascript:moveCategory('1');">문화</a></li>
	<li role="presentation"><a href="javascript:moveCategory('2');">경제</a></li>
	<li role="presentation"><a href="javascript:moveCategory('3');">국제</a></li>
	<li role="presentation"><a href="javascript:moveCategory('4');">과학/IT</a></li>
	<li role="presentation"><a href="javascript:moveCategory('5');">정치</a></li>
	<li role="presentation"><a href="javascript:moveCategory('6');">사회</a></li>
</ul>
<br>
<!-- moveCategory -->
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
	
	<div align="center">
		<a href="javascript:loadPage('1');">[<<]</a>
		<a href="javascript:loadPage('${page-1}');">[<]</a>
		<fmt:parseNumber var="start" value="${page - (page%10)}" integerOnly="true" />
		<c:forEach var = "i" begin = "${start}" end = "${start + 9}" step = "1">
			<c:choose>
				<c:when test = "${i eq 0 }">
				</c:when>
				<c:when test = "${page eq i}">
					&nbsp;<strong><a href="javascript:loadPage('${i}');">${i}</a></strong>&nbsp;
				</c:when>
				<c:otherwise>
					&nbsp;<a href="javascript:loadPage('${i}');">${i}</a>&nbsp;	
				</c:otherwise>	
			</c:choose>
		</c:forEach>
		
		<a href="javascript:loadPage('${page+1}');">[>]</a>
		<a href="javascript:loadPage('${totalCount}');">[>>]</a>
	</div>
</div>

<form method = "GET" id ="pagingForm" action = "${pageContext.request.contextPath}/article/list">
	<input type="hidden" name="page" value="">
	<input type="hidden" name="selectedCategory" value="">
</form>  

<script>
	function loadPage(page){
// 		map 하고 현재 입력한 page를 서버로 전달
		pagingForm.page.value = page;
		pagingForm.selectedCategory.value = ${selectedCategory};
		pagingForm.submit();
	}
	
	function moveCategory(selectedCategory){
// 		map 하고 현재 입력한 page를 서버로 전달
		pagingForm.selectedCategory.value = selectedCategory;
		pagingForm.page.value = 1;
		pagingForm.submit();
	}
</script>
<jsp:directive.include file="../share/footer.jsp" />
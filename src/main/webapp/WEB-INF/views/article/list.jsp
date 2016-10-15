<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:directive.include file="../share/header.jsp" />

<div role="tabpanel">

  <!-- Nav tabs -->
  <ul class="nav nav-tabs" role="tablist">
    <li role="presentation" class="active"><a href="#category" aria-controls="category" role="tab" data-toggle="tab">카테고리별</a></li>
    <li role="presentation"><a href="#keyword" aria-controls="keyword" role="tab" data-toggle="tab">키워드순</a></li>
    <li role="presentation"><a href="#like" aria-controls="like" role="tab" data-toggle="tab">인기순</a></li>
  </ul>

  <!-- Tab panes -->
  <div class="tab-content">
    <div role="tabpanel" class="tab-pane active" id="category">기사의 카테고리별 순으로 보여집니다.</div>
    <div role="tabpanel" class="tab-pane" id="keyword">사용자가 설정한 키워드 중요도순으로 보여집니다.</div>
    <div role="tabpanel" class="tab-pane" id="like">인기가 많은 기사순으로 보여집니다.</div>
  </div>

</div>

<div>

<br>

<div class="dropdown">
  <button id="dLabel" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    요약율선택
    <span class="caret"></span>
  </button>
  <ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
    <li>30%</li>
    <li>40%</li>
    <li>50%</li>
  </ul>
</div>
</div>

<br>


<ul class="nav nav-pills" role="tablist">
	<!-- active 부분 현재 카테고리로 활성화되게 -->
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
	<c:forEach items="${articleList}" var="item">
		<div class="col-sm-6">
			<div class="panel panel-info">
				<div class="panel-heading">
					<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
					${item["title"]}
				</div>
				<div class="panel-body">
					<p>
						리포터 : ${item["reporter"]} <br /> 작성일시 : ${item["write_date"]} <br />
						수정일시 : ${item["modify_date"]} <br /> 키워드 : ${item["keyword"]} <br />
					</p>
					${item["content"]}
					<br><br>
					<a href="doLike?articleId=${item['id']}"><span class="label label-danger">좋아요 : ${item['like_count']}</span></a>
					
				</div>
			</div>
		</div>
	</c:forEach>
</div>
<div align="center">
	<a href="javascript:loadPage('1');">[<<]</a> <a
		href="javascript:loadPage('${page-1}');">[<]</a>
	<fmt:parseNumber var="start" value="${page - (page%10)}"
		integerOnly="true" />
	<c:forEach var="i" begin="${start}" end="${start + 9}" step="1">
		<c:choose>
			<c:when test="${i eq 0 }">
			</c:when>
			<c:when test="${page eq i}">
				&nbsp;<strong><a href="javascript:loadPage('${i}');">${i}</a></strong>&nbsp;
			</c:when>
			<c:otherwise>
				&nbsp;<a href="javascript:loadPage('${i}');">${i}</a>&nbsp;	
			</c:otherwise>
		</c:choose>
	</c:forEach>

	<a href="javascript:loadPage('${page+1}');">[>]</a> <a
		href="javascript:loadPage('${totalCount}');">[>>]</a>
</div>

<form method="GET" id="pagingForm"
	action="${pageContext.request.contextPath}/article/list">
	<input type="hidden" name="page" value=""> <input type="hidden"
		name="selectedCategory" value="">
</form>

<script>
	function loadPage(page) {
		// 		map 하고 현재 입력한 page를 서버로 전달
		pagingForm.page.value = page;
		pagingForm.selectedCategory.value = $
		{
			selectedCategory
		}
		;
		pagingForm.submit();
	}

	function moveCategory(selectedCategory) {
		// 		map 하고 현재 입력한 page를 서버로 전달
		pagingForm.selectedCategory.value = selectedCategory;
		pagingForm.page.value = 1;
		pagingForm.submit();
	}
</script>
<jsp:directive.include file="../share/footer.jsp" />
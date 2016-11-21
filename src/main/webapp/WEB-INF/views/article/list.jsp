<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:directive.include file="../share/header.jsp" />

<script type="text/javascript">
function test(id){
	$(function () {
		//비동기 통신을 하여 json타입으로 호출한다.
		$.ajax({
            url: "/article/doLike?articleId=" + id 
          , dataType : 'json'
          , success: function(data) {
        	  if(data.success == true){
        		  alert("좋아요 하셨습니다.");
        		  window.location.reload();
        	  } else {
        		  alert("이미 좋아요 하셨습니다.");
        	  }
            }
    	});
	});
	
}

function listPageMove(page){
	switch (page){
	case 'categoryList':
		location.href="${pageContext.request.contextPath}/article/list?selectedCategory=0&page=1";
		break;
	case 'keyowrdList':
		location.href="${pageContext.request.contextPath}/article/keywordList";
		break;
	case 'popularList':
		location.href="${pageContext.request.contextPath}/article/rankList?page=1";
		break;
	}
	
	
}
</script>

<div role="tabpanel">

	<!-- Nav tabs -->
	<ul class="nav nav-tabs" role="tablist">
		<li role="presentation" class="active"><a href=""
			onclick="listPageMove('categoryList');" aria-controls="category"
			role="tab" data-toggle="tab">카테고리별</a></li>

		<li role="presentation"><a href=""
			onclick="listPageMove('keyowrdList');" aria-controls="keyword"
			role="tab" data-toggle="tab">맞춤추천</a></li>

		<li role="presentation"><a href=""
			onclick="listPageMove('popularList');" aria-controls="like"
			role="tab" data-toggle="tab">인기순</a></li>
	</ul>

	<!-- Tab panes -->
	<div class="tab-content">
		<div role="tabpanel" class="tab-pane active" id="category">기사의
			카테고리별 순으로 보여집니다.</div>

		<div role="tabpanel" class="tab-pane" id="keyword">사용자가 추가한
			키워드별로 맞춤추천 해드립니다.</div>
		<div role="tabpanel" class="tab-pane" id="like">인기가 많은 기사순으로
			보여집니다.</div>
	</div>

</div>

<div>
	<br>

	<div class="dropdown" id="mydropdown">
		<button class="btn btn-default dropdown-toggle" type="button"
			id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
			요약율 선택 <span class="caret"></span>
		</button>
		<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
			<li role="presentation"><a role="menuitem" tabindex="-1"
				href="#" onclick="set_rate(1)">HeadLine</a></li>
			<li role="presentation"><a role="menuitem" tabindex="-1"
				href="#" onclick="set_rate(30)">30%</a></li>
			<li role="presentation"><a role="menuitem" tabindex="-1"
				href="#" onclick="set_rate(40)">40%</a></li>
			<li role="presentation"><a role="menuitem" tabindex="-1"
				href="#" onclick="set_rate(50)">50%</a></li>
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

		<div class="panel panel-default">
			<div class="panel-heading">
				<font size="3">리포터 : ${item["reporter"]} &nbsp;&nbsp;&nbsp; /
					&nbsp;&nbsp;&nbsp;작성일시 : ${item["write_date"]} &nbsp;&nbsp;&nbsp; /
					&nbsp;&nbsp;&nbsp;수정일시 : ${item["modify_date"]} </font>
				<div class="clearfix"></div>
			</div>
			<div class="panel-body">
				<div class="media">
					<div class="media-body">
						<h4 class="media-heading">
							<font size="3"><a href="${item['url']}">${item["title"]}</a></font>
						</h4>
						<font size="2"> ${item["content"]} </font> <br>
						<p>
							<font size="2"> 키워드 : ${item["keyword"]} </font>
						</p>
						<div class="clearfix"></div>
						<div class="btn-group" role="group" id="BegeniButonlari">
							<button type="button" id="like_button" name="like_button"
								class="btn btn-default" onclick="test(${item['id']});">
								<span class="glyphicon glyphicon-thumbs-up"></span>
							</button>
							<br> <font size="3">[ ${item['like_count']} ]</font>
						</div>
					</div>
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
	<c:set var="end" value="${start + 9}" />
	<c:if test="${totalCount < 10}">
	    홍길동이 맞습니다.
	</c:if>
	<c:forEach var="i" begin="${start}" end="${end}" step="1">
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

<form method="POST" id="sumRateForm"
	action="${pageContext.request.contextPath}/article/list">
	<input type="hidden" name="rate" value=""> <input type="hidden"
		name="page" value="1"> <input type="hidden"
		name="selectedCategory" value=""> <input type="hidden"
		name="returnPage" value="list">
</form>

<script>
	function loadPage(page) {
		// 		map 하고 현재 입력한 page를 서버로 전달
		page = Math.ceil(page);
		pagingForm.page.value = page;
		pagingForm.selectedCategory.value = ${selectedCategory}

		pagingForm.submit();
	}

	function moveCategory(selectedCategory) {
		// 		map 하고 현재 입력한 page를 서버로 전달
		pagingForm.selectedCategory.value = selectedCategory;
		pagingForm.page.value = 1;
		pagingForm.submit();
	}
	
	function set_rate(rate){
		// 요약율 서버로 전달;
		sumRateForm.rate.value = rate;
		sumRateForm.selectedCategory.value = ${selectedCategory};
		sumRateForm.submit();
	}
</script>
<jsp:directive.include file="../share/footer.jsp" />
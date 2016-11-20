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
        	  //result결과
        	  //json객체의 flag가 Y이면 data라는 성공메시지를 result변수에 담는다.
        	  if(data.success == true){
        		  alert("좋아요 하셨습니다.");
        		  window.location.reload();
              //json객체의 flag가 Y가아닌 그이후는 data라는 실패메시지를 result변수에 담는다.
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
		<li role="presentation">
			<a href="" onclick = "listPageMove('categoryList');" aria-controls="category" role="tab" data-toggle="tab">카테고리별</a>
		</li>
		
		<li role="presentation" class="active">
			<a href="" onclick = "listPageMove('keyowrdList');" aria-controls="keyword" role="tab" data-toggle="tab">맞춤추천</a>
		</li>
		
		<li role="presentation">
			<a href="" onclick = "listPageMove('popularList');" aria-controls="like" role="tab" data-toggle="tab">인기순</a>
		</li>
	</ul>

	<!-- Tab panes -->
	<div class="tab-content">
		<div role="tabpanel" class="tab-pane" id="category">
			기사의 카테고리별 순으로 보여집니다.
		</div>
		
		<div role="tabpanel" class="tab-pane active" id="keyword">
			사용자가 추가한 키워드별로 맞춤추천 해드립니다.
		</div>
		<div role="tabpanel" class="tab-pane" id="like">
			인기가 많은 기사순으로 보여집니다.
		</div>
	</div>

</div>

<div>
	<br>
	<div class="dropdown">
	  <button class="dropbtn">요약율 선택</button>
	  <div class="dropdown-content">
	  	<a href="#" onclick = "set_rate(1)">HeadLine</a>
	    <a href="#" onclick = "set_rate(30)">30%</a>
	    <a href="#" onclick = "set_rate(40)">40%</a>
	    <a href="#" onclick = "set_rate(50)">50%</a>
	  </div>
	</div>
</div>

<br>


<!-- <ul class="nav nav-pills" role="tablist"> -->
<!-- 	<!-- active 부분 현재 카테고리로 활성화되게 --> 
<!-- 	<li role="presentation" class="active"><a href="#">전체</a></li> -->
<!-- 	<li role="presentation"><a href="javascript:moveCategory('1');">문화</a></li> -->
<!-- 	<li role="presentation"><a href="javascript:moveCategory('2');">경제</a></li> -->
<!-- 	<li role="presentation"><a href="javascript:moveCategory('3');">국제</a></li> -->
<!-- 	<li role="presentation"><a href="javascript:moveCategory('4');">과학/IT</a></li> -->
<!-- 	<li role="presentation"><a href="javascript:moveCategory('5');">정치</a></li> -->
<!-- 	<li role="presentation"><a href="javascript:moveCategory('6');">사회</a></li> -->
<!-- </ul> -->
<br>
<!-- moveCategory -->
<div class="row">
	<c:forEach items="${articleList}" var="item">


		<div class="col-sm-6">
			<div class="panel panel-info">
				<div class="panel-heading">
					<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
					<a href = "${item['url']}" >${item["title"]}</a>
				</div>
				<div class="panel-body">
					<p>
						리포터 : ${item["reporter"]} <br /> 작성일시 : ${item["write_date"]} <br />
						수정일시 : ${item["modify_date"]} <br /> 키워드 : ${item["keyword"]} <br />
					</p>
					${item["content"]} <br> <br>

					<button type="button" id="like_button" name="like_button"
						class="btn btn-default" onclick="test(${item['id']});">좋아요</button>
					
						
					<div id="result">
						<span class="label label-danger">${item['like_count']}</span>
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
	action="${pageContext.request.contextPath}/article/keywordList">
	<input type="hidden" name="page" value=""> 
</form>

<form method="POST" id="sumRateForm"
	action="${pageContext.request.contextPath}/article/keywordList">
	 <input type="hidden" name="rate" value="">
	 <input type="hidden" name="page" value="1">
	 <input type="hidden" name="selectedCategory" value="">
	 <input type="hidden" name="returnPage" value="list">
</form>

<script>
	// 페이지 이동시 에러 남아있음 (뒤로가기) 
	function loadPage(page) {
		// 		map 하고 현재 입력한 page를 서버로 전달
		if(page == '' || page == null){
			page = 2
		}
		page = Math.ceil(page);
		pagingForm.page.value = page;

		pagingForm.submit();
	}
	
	function set_rate(rate){
		// 요약율 서버로 전달;
		sumRateForm.rate.value = rate;
		sumRateForm.submit();
	}
</script>

<jsp:directive.include file="../share/footer.jsp" />
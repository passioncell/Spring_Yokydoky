<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:directive.include file="../share/header.jsp" />

<!-- CONTENT -->
<style type="text/css">
.custom-search-form {
	margin-top: 5px;
}
</style>

<script>
// https://www.devbridge.com/sourcery/components/jquery-autocomplete/
	var keywordList = ${keywordList};
	$(function(){
	    $( "#keyword" ).autocomplete({
	    	lookup:keywordList,
	    	lookupLimit : 5,
	        onSelect: function (suggestion) {
	            alert('You selected: ' + suggestion.value + ', ' + suggestion.data);
	        }      
	    });
	})
	
	function deleteKeyword(keyword){
		location.href="${pageContext.request.contextPath}/keyword/deleteKeyword";
		deleteForm.keyword.value = keyword;
		deleteForm.submit();
	}

</script>
<form method = "POST" id ="deleteForm" action = "${pageContext.request.contextPath}/keyword/deleteKeyword">
	<input type="hidden" name="keyword" value="">
</form>  
<h2>나만의 키워드를 추가해보세요!</h2>
<br>
<div class="container" style="margin-top: 5%;">
	<div class="col-md-6 col-md-offset-3">

		<!-- Search Form -->
		<form role="searchForm" method = "POST" action = "${pageContext.request.contextPath}/keyword/insertKeyword" >

			<!-- Search Field -->
			<div class="row">
				<div class="form-group">
					<div class="input-group">
						<input class="form-control" type="text" name="keyword" id="keyword"
							placeholder="Search" required /> <span class="input-group-btn">
							<button class="btn btn-success" type="submit">
								<span class="glyphicon glyphicon-search" aria-hidden="true"><span style="margin-left: 10px;">Search</span>
							</button>
						</span> </span>
					</div>
				</div>
			</div>
		</form>
		<!-- End of Search Form -->

	</div>
</div>

<h2>내 키워드</h2>
<c:forEach var ="i" begin = "1" end="${fn:length(myKeyword)/5+(1-(fn:length(myKeyword)/5%1))%1}" step="1">

	<div class="row" style = "height : 50px">
		<c:forEach var ="item" begin = "0" end = "${fn:length(myKeyword)%5+1}" items="${myKeyword}" varStatus="status" step="1">
			<span class="label label-primary" onClick="javascript:deleteKeyword($(this).html())">${myKeyword[5*(i-1)+status.index].keyword}</span>
		</c:forEach>
	</div>
</c:forEach>
<jsp:directive.include file="../share/footer.jsp" />
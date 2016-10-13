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


</script>

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
		<c:forEach var ="item" begin = "1" end = "5" items="${myKeyword}" varStatus="status">
			<span class="label label-primary">${myKeyword[5*(i-1)+status.index-1]}</span>
		</c:forEach>
	</div>
</c:forEach>
<jsp:directive.include file="../share/footer.jsp" />
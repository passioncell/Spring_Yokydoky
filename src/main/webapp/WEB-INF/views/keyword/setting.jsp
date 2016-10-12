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
	$(function() {
		var availableTags = [ "ActionScript", "AppleScript", "Asp", "BASIC",
				"C", "C++", "Clojure", "COBOL", "ColdFusion", "Erlang",
				"Fortran", "Groovy", "Haskell", "Java", "JavaScript", "Lisp",
				"Perl", "PHP", "Python", "Ruby", "Scala", "Scheme" ];
		$("#tags").autocomplete({
			source : availableTags
		});
	});
</script>

<h2>나의 키워드를 추가해보세요!</h2>
<br>
<div class="container" style="margin-top: 5%;">
	<div class="col-md-6 col-md-offset-3">

		<!-- Search Form -->
		<form role="form">

			<!-- Search Field -->
			<div class="row">
				<div class="form-group">
					<div class="input-group">
						<input class="form-control" type="text" name="search"
							placeholder="Search" required /> <span class="input-group-btn">
							<button class="btn btn-success" type="submit">
								<span class="glyphicon glyphicon-search" aria-hidden="true"><span
									style="margin-left: 10px;">Search</span>
							</button>
						</span> </span>
					</div>
				</div>
			</div>

		</form>
		<!-- End of Search Form -->

	</div>
</div>



<h2>내키워드</h2>
<div class="row">
	<span class="label label-primary">#KEYWORD</span>
	<span class="label label-primary">#KEYWORD2</span> 
	<span class="label label-primary">#KEYWORD3</span>
</div>


<script>
	$(function() {
		$("#autocomplete").autocomplete({
			source : function(request, response) {
				$.ajax({
					type : 'post',
					url : "../GetAutoCompleteData",
					dataType : "json",
					//request.term = $("#autocomplete").val()
					data : {
						value : request.term
					},
					success : function(data) {
						//서버에서 json 데이터 response 후 목록에 뿌려주기 위함
						response($.map(data, function(item) {
							return {
								label : item.keyword,
								value : item.keyword
							}
						}));
					}
				});
			},
			//조회를 위한 최소글자수
			minLength : 2,
			select : function(event, ui) {
				// 만약 검색리스트에서 선택하였을때 선택한 데이터에 의한 이벤트발생
			}
		});
	})
</script>

<jsp:directive.include file="../share/footer.jsp" />
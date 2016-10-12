<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
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

<h2>���� Ű���带 �߰��غ�����!</h2>
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



<h2>��Ű����</h2>
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
						//�������� json ������ response �� ��Ͽ� �ѷ��ֱ� ����
						response($.map(data, function(item) {
							return {
								label : item.keyword,
								value : item.keyword
							}
						}));
					}
				});
			},
			//��ȸ�� ���� �ּұ��ڼ�
			minLength : 2,
			select : function(event, ui) {
				// ���� �˻�����Ʈ���� �����Ͽ����� ������ �����Ϳ� ���� �̺�Ʈ�߻�
			}
		});
	})
</script>

<jsp:directive.include file="../share/footer.jsp" />
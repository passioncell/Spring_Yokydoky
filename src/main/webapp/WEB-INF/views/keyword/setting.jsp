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
	var keywordList = "${keywordList}";
	var countries = [
		   { value: 'Andorra', data: 'AD' },
		   // ...
		   { value: 'Zimbabwe', data: 'ZZ' }
		];
	$(function(){
	    $( "#search" ).autocomplete({
	    	lookup:keywordList,
	        onSelect: function (suggestion) {
	            alert('You selected: ' + suggestion.value + ', ' + suggestion.data);
	        }

// 	        source : function( request, response ) {
// 	             $.ajax({
// 	                    type: 'POST',
// 	                    serviceUrl: "${pageContext.request.contextPath}/keyword/searchToJSON",
// 	                    dataType: "json",
	            
// 	                    data: { value : request.term },
// 	                    success: function(data) {
// 	                        alert("ddd");
// 	                        response( 
// 	                            $.map(data, function(item) {
// 	                                return {
// 	                                    label: item.data,
// 	                                    value: item.data
// 	                                }
// 	                            })
// 	                        );
// 	                    }
// 	               });
// 	            },
	       
	    });
	})


</script>

<h2>나만의 키워드를 추가해보세요!</h2>
<br>
<div class="container" style="margin-top: 5%;">
	<div class="col-md-6 col-md-offset-3">

		<!-- Search Form -->
		<form role="form">

			<!-- Search Field -->
			<div class="row">
				<div class="form-group">
					<div class="input-group">
						<input class="form-control" type="text" name="search" id="search"
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



<h2>내 키워드</h2>
<div class="row">
	<span class="label label-primary">#KEYWORD</span>
	<span class="label label-primary">#KEYWORD2</span> 
	<span class="label label-primary">#KEYWORD3</span>
</div>

<jsp:directive.include file="../share/footer.jsp" />
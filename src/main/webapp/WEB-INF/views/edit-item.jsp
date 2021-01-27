<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./layouts/header.jsp" %>

<div class="container">
<sec:authorize access="isAuthenticated()">
	<form class="form-horizontal" action="/edit-item-result" method="post" enctype="multipart/form-data">
		<div class="form-group">
		    <label for="inputId3" class="col-sm-2 control-label">Item Code</label>
		    <div class="col-sm-8">
		      <input type="text" class="form-control" id="inputid3" name="itemId" readonly="readonly" value="${item.itemId}">
		    </div>
		</div>
		<div class="form-group">
		    <label for="inputName3" class="col-sm-2 control-label">Name</label>
		    <div class="col-sm-8">
		      <input type="text" class="form-control" id="inputname3" name="name" value="${item.name}">
		    </div>
		</div>
		<div class="form-group">
		  	<label for="inputImage3" class="col-sm-2 control-label">Image</label>
		  	<div class="col-sm-8">
			  	<input type="file" id="inputImage3" name="imageFile" />
			  	<div class="select_img"><img src="/images/${item.image}" /></div>
			  	<script>
			  		$("#inputImage3").change(function(){
			  			if(this.files && this.files[0]) {
			  				var reader = new FileReader;
			  				reader.onload = function(data) {
			  					$(".select_img img").attr("src", data.target.result).width(500);
			  				}
			  				reader.readAsDataURL(this.files[0]);
			  			}
			  		});
			  	</script>
			</div>
		</div>
		<div class="form-group">
		    <label for="inputDescription3" class="col-sm-2 control-label">Description</label>
		    <div class="col-sm-8">
		      <input type="text" class="form-control" id="inputdescription3" name="description" value="${item.description}">
		    </div>
		</div>
		<div class="form-group">
		    <label for="inputPrice3" class="col-sm-2 control-label">Price</label>
		    <div class="col-sm-8">
		      <input type="text" class="form-control" id="inputprice3" name="price" value="${item.price}">
		    </div>
		</div>
		<div class="form-group">
		    <label for="inputCostPrice3" class="col-sm-2 control-label">Production Price</label>
		    <div class="col-sm-8">
		      <input type="text" class="form-control" id="inputcostprice3" name="costPrice" value="${item.costPrice}">
		    </div>
		</div>
		<div class="form-group">
		    <label for="inputStock3" class="col-sm-2 control-label">Stock</label>
		    <div class="col-sm-8">
		      <input type="text" class="form-control" id="inputstock3" name="stock" value="${item.stock}">
		    </div>
		</div>
		<div class="form-group">
			<label for="inputOnSale3" class="col-sm-2 control-label">On Sale</label>
			<div class="col-sm-10">
				<div class="checkbox">
			        <label>
			        	<c:choose>
			        		<c:when test="${item.onSale == true }">
			        			<input type="checkbox" id="inputOnSale" name="onSale" checked>
			        		</c:when>
			        		<c:when test="${item.onSale != true }">
			        			<input type="checkbox" id="inputOnSale" name="onSale">
			        		</c:when>
			        	</c:choose>
			        </label>
			    </div>
			</div>
  		</div>
		<div class="form-group">
			<label for="inputSoldOut3" class="col-sm-2 control-label">Sold Out</label>
			<div class="col-sm-10">
				<div class="checkbox">
			        <label>
			        	<c:choose>
				        	<c:when test="${item.soldOut == true}">
				        		<input type="checkbox" id="inputSoldOut" name="soldOutVisible" checked>
				        	</c:when>
				        	<c:when test="${item.soldOut != true}">
				        		<input type="checkbox" id="inputSoldOut" name="soldOutVisible">
				        	</c:when>
				        </c:choose>
				        <input type="hidden" name="soldOut" />
		        		<script>
					        if ($('input[name=soldOut]').is(":checked")) {
								$('input[name=soldOut]').val(1);
					        } else {
					            $('input[name=soldOut]').val(0);
					        }
						</script>
			        </label>
			    </div>
			</div>
  		</div>
		<div class="form-group">
			<div class="col-sm-offset-2">
				<div class="col-sm-9"></div>
				<button type="submit" class="btn btn-success col-sm-1">Edit</button>
				<div class="col-sm-2"></div>
		    </div>
  		</div>
	</form>
</sec:authorize>
</div>

<%@ include file="./layouts/footer.jsp" %>
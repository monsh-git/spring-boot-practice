<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./layouts/header.jsp" %>

<div class="container">
<form class="form-horizontal" action="/add-item-result" method="post" enctype="multipart/form-data">
  <%-- <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"> --%>
  <div class="form-group">
    <label for="inputName3" class="col-sm-2 control-label">Item Name</label>
    <div class="col-sm-8">
      <input type="text" class="form-control" id="inputName3" name="name" placeholder="Item Name">
    </div>
  </div>
  <div class="form-group">
  	<label for="inputImage3" class="col-sm-2 control-label">Image</label>
  	<div class="col-sm-8">
	  	<input type="file" id="inputImage3" name="imageFile" />
	  	<div class="select_img"><img src="" /></div>
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
      <input type="text" class="form-control" id="inputDescription3" name="description" placeholder="Description">
    </div>
  </div>
  <div class="form-group">
    <label for="inputPrice3" class="col-sm-2 control-label">Price</label>
    <div class="col-sm-8">
      <input type="text" class="form-control" id="inputPrice3" name="price" placeholder="Price">
    </div>
  </div>
  <div class="form-group">
    <label for="inputCostPrice3" class="col-sm-2 control-label">Production Price</label>
    <div class="col-sm-8">
      <input type="text" class="form-control" id="inputCostPrice3" name="costPrice" placeholder="Production Price">
    </div>
  </div>
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <button type="submit" class="btn btn-success">Register Item</button>
    </div>
  </div>
</form>
</div>

<%@ include file="./layouts/footer.jsp" %>
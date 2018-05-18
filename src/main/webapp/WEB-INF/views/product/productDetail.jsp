<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<head>
    	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> 
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>


<title>Insert title here</title>
</head>
<body>

<h1>상품 자세히보기</h1>
				     

<hr>

<%-- <form action="">
		<input type="hidden" name="product_id" value="${productDtoList.ProductDTO.product_id}">
		<input type="hidden" name="page" value="${cri.page}">
		<input type="hidden" name="perPage" value="${cri.perPage}">
</form> --%>


<div class="container">
		<div class="row">
			<div class="form-group">
				<label for="image">상품 이미지</label>
				<div class="form-control"><img src="${productDto.product_image}" name="${productDto.product_image}" id="image"></div>
				
			</div>
			<div class="form-group">
				<label for="name">상품 이름</label>
				<input readonly="readonly" class="form-control" name="${productDto.product_name}" value="${productDto.product_name}" id="name">
			</div>
					
			
			<div class="form-group">
				<label for="price">상품 가격</label>
				<input readonly="readonly" class="form-control" name="${productDto.product_price}" value="${productDto.product_price}" id="price">
			</div>
		</div>
			<!-- 상품 사이즈와 상품 수량 선택 -->
			
			<form name="form1" method="post" action="#">
			<div class="form-group">
				<!-- 장바구니에 보내줘야할 데이터 무엇? -->
				<input type="hidden" name="productId" value="${productDto.product_id}">
				
				<c:forEach items="${productSizeDtoList}" var="dtoSize"  >
				<input type="hidden" name="productSize" value="${dtoSize.product_size}">
				</c:forEach>
				
				<c:forEach items="${productSizeDtoList}" var="dtoQuantity"  >
				<input type="hidden" name="productQuantity" value="${dtoQuantity.product_quantity}">
				</c:forEach>
				
                    <label for="size">상품 사이즈:&nbsp;</label>
                    <select id="sizeSelect">
                   	<option value="0">상품 사이즈를 선택하세요.</option>
                   
                   	<c:forEach items="${productSizeDtoList}" var="dtoSize"  >
                   		<option value="${dtoSize.product_size}">${dto.product_size}</option>
                   	</c:forEach>
                   </select>
                   
                   <label for="quantity">상품 수량:&nbsp;</label>
                   <select name="amount">
                   <!-- c:if 조건 추가해줘서 분기점 필요 -->
                   <c:forEach begin="1" end="5" var="i">
                        <option value="${i}">${i}</option>
                   </c:forEach>
                   </select>&nbsp;개
                  
					<div class="form-group">
					 	<button class="btn btn-info">장바구니 담기</button>
	                </div>                   
            </div>
			</form>

			
			<form action="/product/listProduct?product_itemType=1&product_sortType=0">
				<div class="form-group">
				<button class="btn btn-info">목록 보기</button>
				</div>
			</form>
			
		</div>
	


<%-- ${productDTO.product_id}<br> --%>
	<%-- <form action="">
		<input type="hidden" name="product_id" value="${productDTO.product_id}">
		<input type="hidden" name="page" value="${cri.page}">
		<input type="hidden" name="perPage" value="${cri.perPage}">

		<input type="hidden" name="searchType" value="${cri.searchType}">
		<input type="hidden" name="keyword" value="${cri.keyword}">
	</form>


	<script type="text/javascript">
		$(document).ready(function(){
			var $form = $("form");
			
			$(".btn-info").on("click", function(){ 
				$form.attr("method", "get");
				$form.attr("action", "/product/listProductTop");
				$form.submit();
			});
			
		});
	
	</script> --%>
	
</body>
</html>
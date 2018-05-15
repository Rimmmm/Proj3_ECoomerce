<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html >
<html>
    <head>
    	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> 
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <title>Insert title here</title>
    </head>
    <body>
        <div class="container" style = "width :946px; " >
            <div id = "topImage">
            	<img alt="장바구니" src="/resources/image/cart_topTitle01.jpg" style = "width :910px">
            </div>
            
            <!-- <h3>[장바구니](el태그.수량)</h3> -->
            <!-- 테스트용 코드 -->
            <h3>[장바구니]()</h3>            
            <table class="table table-condensed" style = "height: 700px;">
              <thead>
                <tr align="center" class="info">
                  <th colspan="4" ><input type = "checkbox" id="allCheck">상품</th>
                  <th>옵션</th>
                  <th>판매가격</th>
                  <th>수량</th>
                  <th>합계</th>
                </tr>
              </thead>
              <tbody>
              	<c:forEach items="${cart_list}" var="cart_dto">
              		<tr>       
                            <td colspan="2" class = "product_img">
                            	<input type = "hidden" value="${cart_dto.cart_id}">
                            	<input class = "checkbox" type = "checkbox" value="${cart_dto.product_id}">
                            	<a href ="#"><img src="${cart_dto.product_image}" alt="제품 사진" width="100px" height="100px"></a>
                            </td>
                            <td colspan="2" class = "product_name"> <a href = "#">${cart_dto.product_name}</a></td>
                            <td class = "product_opt">${cart_dto.cart_product_size}</td>
                            <td class = "product_price">${cart_dto.product_price} 원</td>
                            <td>
                            	<input type = "number" size="3" maxlength="3" class = "product_num" value = "${cart_dto.product_quantity}"> 
	                			<input type = "hidden" value = "${cart_dto.product_id}">
	                			<button type="button" class="btn btn_modify">변경</button>
                            </td> 	
                            <td class = "product_sum">
	                            <script>${cart_dto.product_price} * ${cart_dto.cart_product_quantity}</script>원  
	                            <input type = "hidden" value = "${cart_dto.cart_id}">
		                		<button type="button" class="btn btn_delete">삭제</button>
                            </td>
                	</tr> 
              	</c:forEach>
              	
              	<!-- 연습용 코드 -->
             <%--  	<c:forEach begin="0" end="10" varStatus="status">	              
	              	<tr >
	                	<td colspan="2" class = "product_img">
	                		<input type = "hidden" name ="cart_id" value="${status.index}">
	                		<input class = "checkbox" type = "checkbox" value="ddd">
	                		<a href = "#">
	                			<img src="" alt="제품 사진" width="200px" height="200px">
	                		</a>
	                	</td>
	                	<td colspan="2" class = "product_name">
	                		<a href = "#">sdjhsafsafssssssssssssssssssal</a>
	                	</td>
	                	<td class = "product_opt">250</td>
	                	<td class = "product_price">2000 원</td>	              
	                	<td>
	                		<input type = "number" name = "product_num" value = "${status.index}" size="3" maxlength="3" class = "product_num"> 
	                		<input type = "hidden" name = "product_id" value = "11111">
	                		<button type="button" class="btn btn_modify">변경</button>
	                	</td> 	
	                	
	                	<td class = "product_sum">
	                		가격 * 수량  
	                		<input type = "hidden" name = "cart_id" value = "cart_id">
	                		<button type="button" class="btn btn_delete">삭제</button>
	                	</td>
	                </tr>
	                
                </c:forEach>   --%>          
            </table>
            <form>
            	<button type="button" class="btn btn-danger btn_order">결제하기</button>
            </form>
                  
          </div>
          
          <script>
            $(".btn_modify").on("click",function (event) {          	
            	var product_id = $(this).prev().val();
            	var product_num = $(this).prev().prev().val();
                console.log(product_id);
                console.log(product_num);
            	//$.ajax
            });

            $(".btn_delete").on("click",function (event) {
                var cart_id = $(this).prev().val();
                console.log(cart_id);
            });
            
			$(".btn_order").on("click",function (event) {
                $(".checkbox").each(function(){
                	var checkbox = $(this);
                	var $form = $("form"); 
                	if(checkbox.is(":checked")){               		              
                		console.log(checkbox.prev().val());
                		console.log($form.append(checkbox.prev().serialize()));
                	} 
                });
            });
			
			$("#allCheck").change(function(){
				if($(this).is(":checked")){
					$(".checkbox").prop("checked",true);					
				}else{
					$(".checkbox").prop("checked",false);
				}
			});
			
			function getAllCartList() {
				$.getJSON("/cart/getAllCartList", function(data) {
					$.each(data, function(){
						
					});
				});
			}
          </script>
    </body>
</html>
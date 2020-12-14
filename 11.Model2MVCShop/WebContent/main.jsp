<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<style type="text/css">

	a[role="button"]{
		
		
		float:right;
	}
		
		
</style>
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>

$(function(){
	
cPage=1;
pSize=6;

	$(window).scroll(function(){
			if($(window).scrollTop()==$(document).height() - $(window).height()){
				cPage++;
				  $.ajax(
					{
					url : '/product/json/getProductList',
					method : 'POST',
					data : JSON.stringify({
							currentPage:cPage,
							pageSize:pSize
					}),
					dataType : 'json',
					headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					},
					success : function(JSONData,status){
						if(JSONData==null){
							alert("�ҷ��� �����Ͱ� �����ϴ�.");
						}else{
							    $.each(JSONData.list,function(index,item){
								//alert("index : "+index+"\n"
								//	+"item : "+item.prodName);
								numb = (pSize*cPage)-(pSize-1)+index;
								var addLine = 
									"<div class='col-xs-6 col-md-4' >"+
							    "<div class='thumbnail'>"+
							      "<img src='/images/uploadFiles/"+item.fileName+"' width=50%>"+
							     	"<hr/>"+
							    "<div class='caption'>"+
							    	"<h3>"+item.prodName+"</h3>"+
							    	"<p>��ǰ���� : "+item.prodDetail+"</p>"+
							    	"<p>���� : "+item.price+
							    	"<a class='btn btn-default' href='/product/getProduct?prodNo='"+item.prodNo+"' role='button'>�󼼺���</a></p>"+
							    "</div>"+
							     "</div>"+
							  "</div>"
								$(".row").append(addLine);
								
							}); 
							
						}//else
					}//success
					
							
				});  //ajax
			};//if
		}); //window

})
</script>
<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--   jQuery , Bootstrap CDN  -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
	
	<!--  CSS �߰� : ���ٿ� ȭ�� ������ ���� �ذ� :  �ּ�ó�� ��, �� Ȯ��-->
	<style>
        body {
            padding-top : 70px;
        }
   	</style>
   	<script>
   		
   	
   	</script>
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	 	
</head>
	
<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->

	<!--  �Ʒ��� ������ http://getbootstrap.com/getting-started/  ���� -->	
   	<div class="container ">
      <!-- Main jumbotron for a primary marketing message or call to action -->
      <div class="jumbotron">
        <h1>Model2MVCShop </h1>
        <p>J2SE , DBMS ,JDBC , Servlet & JSP, Java Framework , HTML5 , UI Framework �н� �� Mini-Project ����</p>
     </div>
    </div>

	<!-- ���� : http://getbootstrap.com/css/   : container part..... -->
	<div class="container">
        <div class="row">
        <c:forEach var="product" items="${list}">
		  <div class="col-xs-6 col-md-4" >
		    <div class="thumbnail">
		      <img src="/images/uploadFiles/${product.fileName}" width=50%>
		     	<hr/>
		    <div class="caption">
		    	<h3>${product.prodName}</h3>
		    	<p>��ǰ���� : ${product.prodDetail}</p>
		    	<p>���� : ${product.price}
		    	<a class="btn btn-default" href="/product/getProduct?prodNo=${product.prodNo}" role="button">�󼼺���</a></p>
		    	
		    </div>
		     </div>
		  </div>
		 </c:forEach>
		</div>
		
  	 </div>

</body>

</html>
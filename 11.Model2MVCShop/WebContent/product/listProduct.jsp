<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%--
<%
	List<ProductVO> list= (List<ProductVO>)request.getAttribute("list");
	Page resultPage=(Page)request.getAttribute("page");
	
	Search searchVO = (Search)request.getAttribute("search");
	//==> null 을 ""(nullString)으로 변경
	String searchCondition = CommonUtil.null2str(searchVO.getSearchCondition());
	String searchKeyword = CommonUtil.null2str(searchVO.getSearchKeyword());
%>
--%>
<!DOCTYPE html>
<html>
<head>
<title>상품 관리</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
	/*
	function fncGetProductList() {
		document.detailForm.submit();
	}
	*/
	
	 $(function(){
		  $("#autoTest").autocomplete({
				source : function(request,response){
					 $.ajax({
						method:"POST",
						url:"/product/json/getProductList",
						data:JSON.stringify({
							currentPage:1,
							pageSize:500,
							searchCondition:1,
							searchKeyword:$("#autoTest").val()
						}),
						dataType:"json",
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						success:function(JSONData){
							    response(
							    		$.map(JSONData.list, function(item) {
			                                return {
			                                    label: item.prodName,
			                                    value: item.prodName
			                                }
			                            })
								);//response   
						}//success
						
					});//ajax 
				},//source
				minLength : 1
			});//autocomplete 
	}) 
	$(function(){
		var cPage = 1;
		var pSize = 25;
		
		$("td.ct_btn01:contains('검색')").on('click',function(){
			alert(  $( "td.ct_btn01:contains('검색')" ).html() );
			$("form").attr("method","POST").attr("action","/product/listProduct?menu=${menu=='manage' ? 'manage' : 'search' }").submit();
		});
		
		$("td[align=right]:contains('낮은가격순')").on('click',function(){
			self.location = "/product/listProduct?menu=${menu=='manage' ? 'manage' : 'search' }&searchCondition=3";
		});
		
		$("td[align=right]:contains('높은가격순')").on('click',function(){
			self.location = "/product/listProduct?menu=${menu=='manage' ? 'manage' : 'search' }&searchCondition=4";
		});
		
	     
		
		  /* $("input[name='searchKeyword']").on("click",function(){
			alert("test");
			$.ajax({
				method:"POST",
				url:"/product/json/getProductList",
				data:JSON.stringify({
					currentPage:1,
					pageSize:3,
					searchCondition:1,
					searchKeyword:$(this).val()
				}),
				dataType:"json",
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				success:function(JSONData,status){
					$.map(JSONData.list,function(item){
						alert(item.prodName);
					})
				}//success
				
			});//ajax
		})   */
		
		<c:forEach var="product" items="${list}">
		
			
			<c:choose>
			<c:when test="${menu=='manage'}">
			
			
			$("td[name=${product.purchaseProd.prodNo}]").on("click",function(){
				self.location = "/product/updateProduct?prodNo=${product.purchaseProd.prodNo}&menu=${menu=='manage' ? 'manage' : 'search' }";
			});
			</c:when>
			
			<c:when test="${menu=='search'}">
			$("td[name=${product.prodNo}]").hover(function(){
				$(this).html(
							"<img src='/images/uploadFiles/${product.fileName}'/>"
							);
				$("img").attr("width","100");
				$("img").css("width","100");
			},function(){
				$(this).find("img").remove();
				$(this).html("${product.prodName}");
			})
			$("td[name=${product.prodNo}]").on("click",function(){
				self.location = "/product/getProduct?prodNo=${product.prodNo}&menu=${menu=='manage' ? 'manage' : 'search' }";
			});
			</c:when>
			</c:choose>
		</c:forEach>
		
		$("td[name='status']").on('click',function(){
			self.location = "/purchase/updateTranCodeByProd?prodNo=${product.purchaseProd.prodNo }&tranCode=2";
		});
		
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
							alert("불러올 데이터가 없습니다.");
						}else{
							    $.each(JSONData.list,function(index,item){
								//alert("index : "+index+"\n"
								//	+"item : "+item.prodName);
								numb = (pSize*cPage)-(pSize-1)+index;
								var addLine = 
								"<tr class='ct_list_pop'>"+
								"<td align='center'>"+numb+"</td>"+
								"<td></td>"+
								"<td align='left' name="+item.prodNo+">"+item.prodName+
								"</td>"+
								"<td></td>"+
								"<td align='left'>"+item.price+"</td>"+
								"<td></td>"+
								"<td align='left'>"+item.regDate+"</td>"+
							   /*  if(item.proTranCode==null){
									"<td  align='left'>판매중</td>"+
								}
							     else if(item.proTranCode=='1'){
									"<td name='status' align='left'>구매완료 배송하기</td>"+
								}
							    else if(item.proTranCode=='2'||item.proTranCode=='3'){
									"<td align='left'>재고없음</td>"+
								}    */
								"</tr>"+
								"<tr>"+
								"<td colspan='11' bgcolor='D6D7D6' height='1'></td>"+
								"</tr>";
								
								$("#addTable").append(addLine);
								
								$("td[name="+item.prodNo+"]").on("click",function(){
									self.location = "/product/getProduct?prodNo="+item.prodNo+"&menu=${menu=='manage' ? 'manage' : 'search' }";
								});
								
								$("td[name="+item.prodNo+"]").hover(function(){
									$(this).html(
												"<img src='/images/uploadFiles/"+item.fileName+"'/>"
												);
									$("img").attr("width","100");
									$("img").css("width","100");
								},function(){
									$(this).find("img").remove();
									$(this).html(item.prodName);
								})
								
							}); 
							
						}//else
					}//success
					
							
				});  //ajax
			};//if
		}); //window
	})
	
</script>
</head>

<body bgcolor="#ffffff" text="#000000">

	<div style="width: 98%; margin-left: 10px;">

		<form name="detailForm"	>

			<table width="100%" height="37" border="0" cellpadding="0"
				cellspacing="0">
				<tr>
					<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"
						width="15" height="37" /></td>
					<td background="/images/ct_ttl_img02.gif" width="100%"
						style="padding-left: 10px;">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="93%" class="ct_ttl01">${menu=='manage' ? '상품관리' : '상품검색' }</td>
							</tr>
						</table>
					</td>
					<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"
						width="12" height="37" /></td>
				</tr>
			</table>


			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				style="margin-top: 10px;">
				<tr>


					<td align="right"><select name="searchCondition"
						class="ct_input_g" style="width: 80px">

							<option value="0"
								${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>상품번호</option>
							<option value="1"
								${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>상품이름</option>
							<option value="2"
								${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>가격</option>



					</select> <input type="text" name="searchKeyword" id="autoTest"
						value="${! empty search.searchKeyword ? search.searchKeyword : ''}"
						class="ct_input_g" style="width: 200px; height: 19px"></td>



					<td align="right" width="70">
						<table border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="17" height="23"><img
									src="/images/ct_btnbg01.gif" width="17" height="23"></td>
								<td background="/images/ct_btnbg02.gif" class="ct_btn01"
									style="padding-top: 3px;">검색</td>
								<td width="14" height="23"><img
									src="/images/ct_btnbg03.gif" width="14" height="23"></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>


			<table id="addTable" width="100%" border="0" cellspacing="0" cellpadding="0"
				style="margin-top: 10px;">
				<tr>
					<td colspan="11">전체 ${resultPage.totalCount } 건수, 현재
						${resultPage.currentPage } 페이지</td>
				</tr>
				<tr>
					<td colspan="11" align="right">낮은가격순</td>
				</tr>
				<tr>
					<td colspan="11" align="right">높은가격순</td>
				</tr>
				<tr>
					<td class="ct_list_b" width="100">No</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" width="150">상품명</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" width="150">가격</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b">등록일</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b">현재상태</td>
				</tr>
				<tr>
					<td colspan="11" bgcolor="808285" height="1"></td>
				</tr>
				<%--
					int no = list.size();
				for (int i = 0; i < list.size(); i++) {
					ProductVO vo = (ProductVO) list.get(i);
				--%>

				<c:set var="i" value="0" />
				<c:forEach var="product" items="${list}">
					<c:set var="i" value="${i+1}" />
					<tr class="ct_list_pop">
						<td align="center">${i}</td>
						<td></td>
						<c:choose>
							<c:when test="${menu=='manage'}">
								<td align="left" name="${product.purchaseProd.prodNo}">${product.purchaseProd.prodName}
								</td>
								<td></td>
								<td align="left">${product.purchaseProd.price}</td>
								<td></td>
								<td align="left">${product.purchaseProd.regDate}</td>
								<td></td>
								<c:if test="${fn:trim(product.tranCode)==''}">
									<td  align="left">판매중</td>
								</c:if>
								<c:if test="${fn:trim(product.tranCode)=='1' }">
									<td name="status" align="left">구매완료 배송하기</td>
								</c:if>
								<c:if
									test="${fn:trim(product.tranCode)=='2' || fn:trim(product.tranCode)=='3' }">
									<td align="left">재고없음</td>
								</c:if>
							</c:when>
							<c:when test="${menu=='search'}">
							
								<%-- <div class="row"> THUMBNAIL TEST
								  <div class="col-xs-6 col-md-3">
								    <a href="#" class="thumbnail">
								      <img src="/images/uploadFiles/${product.fileName}" alt="...">
								    </a>
								  </div>
								  ...
								</div> --%>
								
								<td align="left" name="${product.prodNo}">${product.prodName}
								</td>
								<td></td>
								<td align="left">${product.price}</td>
								<td></td>
								<td align="left">${product.regDate}</td>
								<td></td>
								<c:if test="${fn:trim(product.proTranCode)==''}">
									<td align="left">판매중</td>
								</c:if>
								<c:if test="${fn:trim(product.proTranCode)=='1' }">
									<td align="left">재고없음</td>
								</c:if>
								<c:if
									test="${fn:trim(product.proTranCode)=='2' || fn:trim(product.proTranCode)=='3' }">
									<td align="left">재고없음</td>
								</c:if>
									</c:when>
						</c:choose>
						

					</tr>
					<tr>
						<td colspan="11" bgcolor="D6D7D6" height="1"></td>
					</tr>
				</c:forEach>

			</table>

			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				style="margin-top: 10px;">
				<tr>
					<td align="center"> <jsp:include
							page="../common/listProductPageNavigator.jsp" /></td>
				</tr>
			</table>
			<!--  페이지 Navigator 끝 -->
 
		</form>

	</div>

</body>
</html>
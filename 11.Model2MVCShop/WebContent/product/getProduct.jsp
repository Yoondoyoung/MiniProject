<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--   <% 
    User userVO = (User)request.getAttribute("user");
    System.out.println(userVO);
    ProductVO productVO = (ProductVO)request.getAttribute("productVO");
    System.out.println(productVO);
    %>
--%>


<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/css/admin.css" type="text/css">
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
$(function(){
	$("td.ct_btn01:contains('구매')").on('click',function(){
		alert(  $( "td.ct_btn01:contains('구매')" ).html() );
		self.location = "/purchase/addPurchase?prodNo=${product.prodNo}";
	});
	
	$("td.ct_btn01:contains('이전')").on('click',function(){
		alert(  $( "td.ct_btn01:contains('이전')" ).html() );
		history.go(-1);
	});
	
	$("td.ct_btn01:contains('등록')").on('click',function(){
		alert(  $( "td.ct_btn01:contains('등록')" ).html() );
		$("form").attr("method","POST").attr("action","/comment/addComment?prodNo=${product.prodNo}").submit();
	});
	
	
})

</script>
<title>상품 상세 조회</title>
</head>

<body bgcolor="#ffffff" text="#000000">

	<form name="detailForm">

		<table width="100%" height="37" border="0" cellpadding="0"
			cellspacing="0">
			<tr>
				<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"
					width="15" height="37"></td>
				<td background="/images/ct_ttl_img02.gif" width="100%"
					style="padding-left: 10px;">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="93%" class="ct_ttl01">상품상세조회</td>
							<td width="20%" align="right">&nbsp;</td>
						</tr>
					</table>
				</td>
				<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"
					width="12" height="37" /></td>
			</tr>
		</table>

		<table width="100%" border="0" cellspacing="0" cellpadding="0"
			style="margin-top: 13px;">
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			<tr>
				<td width="104" class="ct_write">상품번호 <img
					src="/images/ct_icon_red.gif" width="3" height="3"
					align="absmiddle" />
				</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="105">${product.prodNo }</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			<tr>
				<td width="104" class="ct_write">상품명 <img
					src="/images/ct_icon_red.gif" width="3" height="3"
					align="absmiddle" />
				</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01">${product.prodName }</td>
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			<tr>
				<td width="104" class="ct_write">상품이미지 <img
					src="/images/ct_icon_red.gif" width="3" height="3"
					align="absmiddle" />
				</td>
				<c:if test="${product.fileName != null }">
				<c:forTokens var="src" items="${product.fileName}" delims="/">
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01"><img
					src="/images/uploadFiles/${src}" /></td>
				</c:forTokens>
				</c:if>
				<c:if test="${empty product.fileName}">
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01">없음</td>
				</c:if>
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			<tr>
				<td width="104" class="ct_write">상품상세정보 <img
					src="/images/ct_icon_red.gif" width="3" height="3"
					align="absmiddle" />
				</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01">${product.prodDetail }</td>
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			<tr>
				<td width="104" class="ct_write">제조일자</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01">${product.manuDate }</td>
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			<tr>
				<td width="104" class="ct_write">가격</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01">${product.price }</td>
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			<tr>
				<td width="104" class="ct_write">등록일자</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01">${product.regDate }</td>
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
		</table>

		<table width="100%" border="0" cellspacing="0" cellpadding="0"
			style="margin-top: 10px;">
			<tr>
				<td width="53%"></td>
				<td align="right">

					<table border="0" cellspacing="0" cellpadding="0">
						<tr>
							<c:if test="${fn:trim(product.proTranCode)==''}">
								<td width="17" height="23"><img
									src="/images/ct_btnbg01.gif" width="17" height="23" /></td>
								<td background="/images/ct_btnbg02.gif" class="ct_btn01"
									style="padding-top: 3px;">구매</td>
								<td width="14" height="23"><img
									src="/images/ct_btnbg03.gif" width="14" height="23" /></td>
							</c:if>
							<td width="30"></td>
							<td width="17" height="23"><img src="/images/ct_btnbg01.gif"
								width="17" height="23" /></td>
							<td background="/images/ct_btnbg02.gif" class="ct_btn01"
								style="padding-top: 3px;">이전</td>

							<td width="14" height="23"><img src="/images/ct_btnbg03.gif"
								width="14" height="23" /></td>
						</tr>
						
					</table>

				</td>
			</tr>
		</table>
		<hr/>
		<jsp:include page="../common/Comment.jsp"/>
		
	</form>

</body>
</html>
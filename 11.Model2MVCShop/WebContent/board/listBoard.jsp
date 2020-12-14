<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--
<%
	List<ProductVO> list= (List<ProductVO>)request.getAttribute("list");
	Page resultPage=(Page)request.getAttribute("page");
	
	Search searchVO = (Search)request.getAttribute("search");
	//==> null �� ""(nullString)���� ����
	String searchCondition = CommonUtil.null2str(searchVO.getSearchCondition());
	String searchKeyword = CommonUtil.null2str(searchVO.getSearchKeyword());
%>
--%>
<!DOCTYPE html>
<html>
<head>
<title>�����Խ���</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script type="text/javascript">
function fncAddBoard(userId) {
	document.getElementById("userId").value = userId;
	document.detailForm.action='/board/addBoard';
   	document.detailForm.submit();
}
	
</script>
</head>

<body bgcolor="#ffffff" text="#000000">

	<div style="width: 98%; margin-left: 10px;">

		<form name="detailForm"
			action="/board/listBoard"
			method="post">

			<table align="center"width="80%" height="37" border="0" cellpadding="0"
				cellspacing="0">
				<tr>
					<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"
						width="15" height="37" /></td>
					<td background="/images/ct_ttl_img02.gif" width="100%"
						style="padding-left: 10px;">
						<table width="80%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="80%" class="ct_ttl01">�����Խ���</td>
							</tr>
						</table>
					</td>
					<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"
						width="12" height="37" /></td>
				</tr>
			</table>


			<table width="80%" border="0" cellspacing="0" cellpadding="0"
				style="margin-top: 10px;">
				<tr>


					<td align="right"><select name="searchCondition"
						class="ct_input_g" style="width: 80px">

							<option value="0"
								${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>�ۼ���</option>
							<option value="1"
								${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>����</option>
							<option value="2"
								${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>����</option>



					</select> <input type="text" name="searchKeyword"
						value="${! empty search.searchKeyword ? search.searchKeyword : ""}"
						class="ct_input_g" style="width: 200px; height: 19px"></td>



					<td align="right" width="70">
						<table border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="17" height="23"><img
									src="/images/ct_btnbg01.gif" width="17" height="23"></td>
								<td background="/images/ct_btnbg02.gif" class="ct_btn01"
									style="padding-top: 3px;"><a
									href="javascript:fncGetBoardList();">�˻�</a></td>
								<td width="14" height="23"><img
									src="/images/ct_btnbg03.gif" width="14" height="23"></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>


			<table align="center" width="80%" border="0" cellspacing="0" cellpadding="0"
				style="margin-top: 10px;">
				<tr>
					<td colspan="11">��ü ${resultPage.totalCount } �Ǽ�, ����
						${resultPage.currentPage } ������</td>
				</tr>
				<tr>
					<td class="ct_list_b" width="100">No</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" width="350">����</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" width="75">�����</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" width="75">�ۼ���</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" width="75">��ȸ��</td>
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
				<c:forEach var="board" items="${list}">
					<c:set var="i" value="${i+1}" />
					<tr class="ct_list_pop">
						<td align="center">${i}</td>
						<td></td>
						
								<td align="left"><a
									href="/board/getBoard?boardNo=${board.boardNum}">${board.boardTitle}</a>
								</td>
								<td></td>
								<td align="left">${board.regDate}</td>
								<td></td>
								<td align="left">${board.user.userId}</td>
								<td></td>
								<td align="left">${board.viewCount}</td>

					</tr>
					<tr>
						<td colspan="11" bgcolor="D6D7D6" height="1"></td>
					</tr>
					
				</c:forEach>
				
			
			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				style="margin-top: 10px;">
				
				<tr>
					<td align="center"> <jsp:include
							page="../common/listProductPageNavigator.jsp" /></td>
				</tr>
			</table>
						<table align="center" border="0" cellspacing="0" cellpadding="0">
						<input type="hidden" id="userId" name="userId" value="${user.userId }" }/>
							<tr>
								<td width="17" height="23"><img
									src="/images/ct_btnbg01.gif" width="17" height="23"></td>
								<td background="/images/ct_btnbg02.gif" class="ct_btn01"
									style="padding-top: 3px;"><a
									href="/board/addBoard">�۾���</a></td>
								<td width="14" height="23"><img
									src="/images/ct_btnbg03.gif" width="14" height="23"></td>
							</tr>
						</table>
			</table>
			<!--  ������ Navigator �� -->

		</form>

	</div>
</body>
</html>




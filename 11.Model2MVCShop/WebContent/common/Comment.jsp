<%@ page contentType="text/html; charset=euc-kr" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<table>
	<c:forEach var="comment" items="${comment}">
		<tr>
			<td width="104" class="ct_write">${comment.user.userId }<img
				src="/images/ct_icon_red.gif" width="1" height="1" align="absmiddle" />
			</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<c:if test="${comment.user.userId==user.userId}">
				<td width="500" class="ct_write01">${comment.comment }</td>
				<td bgcolor="D6D6D6">${comment.regDate }</td>
				<td name="commentUpdate"><a href="/comment/updateComment">����</a>
			</c:if>
			<c:if test="${comment.user.userId!=user.userId}">
				<td width="500" class="ct_write01">${comment.comment }</td>
				<td bgcolor="D6D6D6">${comment.regDate }</td>
			</c:if>
			<br />
		</tr>

	</c:forEach>
</table>
<table>
			<td>��� : <input type="text" name="comment"
				style="width: 500px; height: 19px" /></td>
			<td width="17" height="23"><img
									src="/images/ct_btnbg01.gif" width="17" height="23" /></td>
								<td background="/images/ct_btnbg02.gif" class="ct_btn01"
									style="padding-top: 1px;">���</td>
								<td width="14" height="23"><img
									src="/images/ct_btnbg03.gif" width="14" height="23" /></td>
			<br />
		</table>
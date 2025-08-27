<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url var="inquiryUrl" value="/inquiry" />
<c:url var="cssUrl" value="/style.css" />

<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>お問い合わせ内容確認</title>
<link rel="stylesheet" href="${cssUrl}">
</head>
<body>
	<div class="container">
		<h1>お問い合わせ内容確認</h1>
		<p>以下の内容でよろしいですか？</p>
		<div class="display-info">
			<p>
				<strong>名前:</strong>
				<%=request.getAttribute("name")%></p>
			<p>
				<strong>メールアドレス:</strong>
				<%=request.getAttribute("email")%></p>
			<p>
				<strong>内容:</strong>
			</p>
			<pre><%=request.getAttribute("content")%></pre>
			<p>
				<strong>添付ファイル:</strong>
				<%
				String attachmentFileName = (String) request.getAttribute("attachmentFileName");
				%>
				<%
				if (attachmentFileName != null && !attachmentFileName.isEmpty()) {
				%>
				<%=attachmentFileName%>
				<%
				} else {
				%>
				なし
				<%
				}
				%>
			</p>
		</div>
		<form action="${inquiryUrl}" method="post">
			<input type="hidden" name="action" value="complete">
			<div class="button-group">
				<input type="submit" value="送信">
				<a href="${inquiryUrl}" class="button secondary">戻る</a>
			</div>
		</form>
	</div>
</body>
</html>
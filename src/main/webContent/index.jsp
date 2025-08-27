<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url var="inquiryUrl" value="/inquiry" />
<c:url var="historyUrl" value="/inquiry?action=history" />
<c:url var="cssUrl" value="/style.css" />
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>お問い合わせフォーム</title>
<link rel="stylesheet" href="${cssUrl}">
</head>
<body>
<div class="container">
	<h1>お問い合わせフォーム</h1>
	<form action="${inquiryUrl}" method="post" onsubmit="return validateForm()" enctype="multipart/form-data">
		<p>
			<label for="name">名前:</label>
			<input type="text" id="name" name="name" value="<c:out value='${inquiry.name}'/>"> 
			<span class="error-message"><c:out value='${errors.name}' /></span>
		</p>
		<p>
			<label for="email">メールアドレス:</label>
			<input type="email" id="email" name="email" value="<c:out value='${inquiry.email}'/>">
			<span class="error-message"><c:out value='${errors.email}' /></span>
		</p>
		<p>
			<label for="content">内容:</label>
			<textarea id="content" name="content" rows="5" cols="40"><c:out value='${inquiry.content}' /></textarea>
			<span class="error-message"><c:out value='${errors.content}' /></span>
		</p>
		<p>
			<label for="attachment">添付ファイル:</label>
			<input type="file" id="attachment" name="attachment">
			<span class="error-message"><c:out value='${errorMessage}' /></span>
		</p>
		<p>
			<label for="captcha">スパム対策: <c:out value='${captchaQuestion}' /></label>
			<input type="text" id="captcha" name="captcha" required>
			<span class="error-message"><c:out value='${errors.captcha}' /></span>
		</p>
		<div class="button-group">
			<input type="submit" value="確認">
		</div>
	</form>

	<!-- ↓ 404対策：相対パスではなく絶対パスを明示 -->
	<div class="button-group">
		<a href="${historyUrl}" class="button secondary">お問い合わせ履歴を見る</a>
	</div>
</div>

	<script>
function validateForm() {
	let isValid = true;

	const name = document.getElementById('name');
	const email = document.getElementById('email');
	const content = document.getElementById('content');
	const captcha = document.getElementById('captcha');

	document.querySelectorAll('.error-message').forEach(el => el.textContent = '');

	if (name.value.trim() === '') {
		name.nextElementSibling.textContent = '名前は必須です。';
		isValid = false;
	}

	if (email.value.trim() === '') {
		email.nextElementSibling.textContent = 'メールアドレスは必須です。';
		isValid = false;
	} else if (!/^[\w.%+-]+@[\w.-]+\.[A-Za-z]{2,}$/.test(email.value)) {
		email.nextElementSibling.textContent = '有効なメールアドレスを入力してください。';
		isValid = false;
	}

	if (content.value.trim() === '') {
		content.nextElementSibling.textContent = '内容は必須です。';
		isValid = false;
	}

	if (captcha.value.trim() === '') {
		captcha.nextElementSibling.textContent = 'スパム対策の質問に答えてください。';
		isValid = false;
	}

	return isValid;
}
</script>

</body>
</html>
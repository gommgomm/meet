<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<title>아이디 찾기 페이지</title>
<script type="text/javascript">
	function formCheck()
	{

		if ($("#confirmNum").val() == '1234')
		{
			/* $("#idFind2Form").submit(); */
			$("#confirmMsg").attr("style", "display: inline")
			document.getElementById('dididi').innerHTML = "<a href='/maingroup.action'>뒤로 가기</a>"
		} else
		{
			alert("인증번호가 일치하지 않습니다.");
			return false;
		}

	}
</script>


<!-- 카운트다운 스크립트 -->
<script>
	cnt = 30; //몇 초?
	function countdown()
	{
		cnt--;
		if (cnt == 0) //0초일때는 다시 입력하게 세션을 끊는다거나 다른 조치가 필요~!!
		{
		 document.getElementById('dididi').innerHTML = "<p style='color:red;'>인증번호를 다시 전송하세요.</p><br><a href='/maingroup.action'>뒤로 가기</a>"
		
		}
		else if (cnt > 0)
		{
			document.getElementById('dididi').innerHTML = cnt + "초 안에 입력";
			setTimeout("countdown()", 1000);
		}
	}

	$(function()
	{
		cnt--;
		if (cnt == 0) //0초일때는 다시 입력하게 세션을 끊는다거나 다른 조치가 필요~!!
		{		document.getElementById('dididi').innerHTML = "<p style='color:red;'>인증번호를 다시 전송하세요.</p>"
				
		}
		else if (cnt > 0)
		{
			document.getElementById('dididi').innerHTML = cnt + "초 안에 입력";
			setTimeout("countdown()", 1000);
		}
	});
</script>
<!-- 카운트다운 스크립트 end-->



<style type="text/css">
#errMsg {
	display: none;
}

#confirmMsg {
	display: none;
}
</style>

</head>
<body>

	<div class="container">
		<br>
		<div class="row">
			<div class="col-md-4 col-md-offset-4 text-center">
				<div class="search-box">
					<form action="" class="idFind2Form">
						<div class="input-group">
							<h1>MeetU 아이디 찾기</h1>
							<br>
							<h5>인증번호를 입력해주세요</h5>
							<input type="text" id="confirmNum" class="form-control"
								placeholder="인증번호"> <span id="errMsg"
								style="color: red; float: left;">인증번호가 일치하지 않습니다.<br></span>
							<br> <br style="clear: left;">
							<button type="button" class="btn btn-primary form-control"
								onclick="formCheck();">아이디 찾기</button>
							<div>
								<div id="dididi"></div>
							</div>
							<div id="again"></div>
							<span id="confirmMsg" style="color: red; float: left;">회원님의
								아이디는 "000" 입니다.<br>
							</span>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
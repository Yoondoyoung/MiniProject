<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>


<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- ///////////////////////////// 로그인시 Forward  /////////////////////////////////////// -->
<c:if test="${ ! empty user }">
	<jsp:forward page="main.jsp" />
</c:if>
<!-- //////////////////////////////////////////////////////////////////////////////////////////////////// -->


<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset="EUC-KR">

<!-- 참조 : http://getbootstrap.com/css/   -->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!--  ///////////////////////// CSS ////////////////////////// -->
<style></style>

<!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">
	//============= 회원원가입 화면이동 =============
	$(function() {
		//==> 추가된부분 : "addUser"  Event 연결
		$("a[href='#' ]:contains('회원가입')").on("click", function() {
			self.location = "/user/addUser"
		});
	});

	//============= 로그인 화면이동 =============
	$(function() {

		$("button:contains('로그인')").on("click", function() {
			$(".form-horizontal").attr("method","POST").attr("action","/user/login").submit();
		})

	});

	$(function() {

		$("a[href='#']:contains('판매상품등록')").on("click", function() {
			self.location = "/product/addProduct"
		});
	})

	$(function() {
		setInterval(function() {
			var nTime = new Date();
			var hour = nTime.getHours();
			var minutes = nTime.getMinutes();
			var seconds = nTime.getSeconds();
			var time = (hour >= 12 ? "PM  " : "AM  ")
					+ (hour > 10 ? "0" + (hour - 12) : hour) + ":"
					+ (minutes >= 10 ? minutes : "0" + minutes) + ":"
					+ (seconds >= 10 ? seconds : "0" + seconds);
			$("#clock").text(time);
		}, 500);

	})
</script>

</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<div class="navbar  navbar-default">

		<div class="container">

			<a class="navbar-brand" href="#">Model2 MVC Shop</a>

			<!-- toolBar Button Start //////////////////////// -->
			<div class="navbar-header">
				<button class="navbar-toggle collapsed" data-toggle="collapse"
					data-target="#target">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
			</div>
			<!-- toolBar Button End //////////////////////// -->

			<div class="collapse navbar-collapse" id="target">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#">회원가입</a></li>
					<li><a href="#" data-toggle="modal" data-target="#myInput">로
							그 인</a></li>
				</ul>
			</div>

		</div>
	</div>
	<!-- ToolBar End /////////////////////////////////////-->

	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">

		<!-- 다단레이아웃  Start /////////////////////////////////////-->
		<div class="row">

			<!--  Menu 구성 Start /////////////////////////////////////-->
			<div class="col-md-3">

				<!--  회원관리 목록에 제목 -->
				<div class="panel panel-primary">
					<div class="panel-heading">
						<i class="glyphicon glyphicon-heart"></i> 회원관리
					</div>
					<!--  회원관리 아이템 -->
					<ul class="list-group">
						<li class="list-group-item"><a href="#">개인정보조회</a> <i
							class="glyphicon glyphicon-ban-circle"></i></li>
						<li class="list-group-item"><a href="#">회원정보조회</a> <i
							class="glyphicon glyphicon-ban-circle"></i></li>
					</ul>
				</div>

				<c:if test="${role=='admin' }">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<i class="glyphicon glyphicon-briefcase"></i> 판매상품관리
						</div>
						<ul class="list-group">
							<li class="list-group-item"><a href="#">판매상품등록</a> <i
								class="glyphicon glyphicon-ban-circle"></i></li>
							<li class="list-group-item"><a href="#">판매상품관리</a> <i
								class="glyphicon glyphicon-ban-circle"></i></li>
						</ul>
					</div>
				</c:if>

				<div class="panel panel-primary">
					<div class="panel-heading">
						<i class="glyphicon glyphicon-shopping-cart"></i> 상품구매
					</div>
					<ul class="list-group">
						<li class="list-group-item"><a href="#">상품검색</a></li>
						<li class="list-group-item"><a href="#">구매이력조회</a> <i
							class="glyphicon glyphicon-ban-circle"></i></li>
						<li class="list-group-item"><a href="#">최근본상품</a> <i
							class="glyphicon glyphicon-ban-circle"></i></li>
					</ul>
				</div>

			</div>
			<!--  Menu 구성 end /////////////////////////////////////-->

			<!--  Main start /////////////////////////////////////-->
			<div class="col-md-9">
				<div class="jumbotron">
					<h1 id="clock"></h1>
					<p>로그인 후 사용가능...</p>
					<p>로그인 전 검색만 가능합니다.</p>
					<p>회원가입 하세요.</p>

					<div class="text-center">
						<a class="btn btn-info btn-lg" href="#" role="button">회원가입</a> <a
							class="btn btn-info btn-lg" href="#" role="button"
							data-toggle="modal" data-target="#myInput">로 그 인</a>
					</div>

				</div>
			</div>
			<!--  Main end /////////////////////////////////////-->

		</div>
		<!-- 다단레이아웃  end /////////////////////////////////////-->

	</div>
	<!--  화면구성 div end /////////////////////////////////////-->
	<div class="modal fade" tabindex="-1" role="dialog" id="myInput">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">Modal title</h4>
				</div>
				<div class="modal-body">
					<div class="container">
						<!--  row Start /////////////////////////////////////-->
						<div class="row">

							<div class="col-md-6">

								<br />
								<br />

								<div class="jumbotron">
									<h1 class="text-center">로 &nbsp;&nbsp;그 &nbsp;&nbsp;인</h1>

									<form class="form-horizontal">

										<div class="form-group">
											<label for="userId" class="col-sm-4 control-label">아
												이 디</label>
											<div class="col-sm-6">
												<input type="text" class="form-control" name="userId"
													id="userId" placeholder="아이디">
											</div>
										</div>

										<div class="form-group">
											<label for="password" class="col-sm-4 control-label">패
												스 워 드</label>
											<div class="col-sm-6">
												<input type="password" class="form-control" name="password"
													id="password" placeholder="패스워드">
											</div>
										</div>

									</form>

								</div>

							</div>

						</div>
						<!--  row Start /////////////////////////////////////-->

					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal">로그인</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->

	</div>
	<!-- /.modal -->
</body>

</html>
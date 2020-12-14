<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>


<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- ///////////////////////////// �α��ν� Forward  /////////////////////////////////////// -->
<c:if test="${ ! empty user }">
	<jsp:forward page="main.jsp" />
</c:if>
<!-- //////////////////////////////////////////////////////////////////////////////////////////////////// -->


<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset="EUC-KR">

<!-- ���� : http://getbootstrap.com/css/   -->
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
	//============= ȸ�������� ȭ���̵� =============
	$(function() {
		//==> �߰��Ⱥκ� : "addUser"  Event ����
		$("a[href='#' ]:contains('ȸ������')").on("click", function() {
			self.location = "/user/addUser"
		});
	});

	//============= �α��� ȭ���̵� =============
	$(function() {

		$("button:contains('�α���')").on("click", function() {
			$(".form-horizontal").attr("method","POST").attr("action","/user/login").submit();
		})

	});

	$(function() {

		$("a[href='#']:contains('�ǸŻ�ǰ���')").on("click", function() {
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
					<li><a href="#">ȸ������</a></li>
					<li><a href="#" data-toggle="modal" data-target="#myInput">��
							�� ��</a></li>
				</ul>
			</div>

		</div>
	</div>
	<!-- ToolBar End /////////////////////////////////////-->

	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">

		<!-- �ٴܷ��̾ƿ�  Start /////////////////////////////////////-->
		<div class="row">

			<!--  Menu ���� Start /////////////////////////////////////-->
			<div class="col-md-3">

				<!--  ȸ������ ��Ͽ� ���� -->
				<div class="panel panel-primary">
					<div class="panel-heading">
						<i class="glyphicon glyphicon-heart"></i> ȸ������
					</div>
					<!--  ȸ������ ������ -->
					<ul class="list-group">
						<li class="list-group-item"><a href="#">����������ȸ</a> <i
							class="glyphicon glyphicon-ban-circle"></i></li>
						<li class="list-group-item"><a href="#">ȸ��������ȸ</a> <i
							class="glyphicon glyphicon-ban-circle"></i></li>
					</ul>
				</div>

				<c:if test="${role=='admin' }">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<i class="glyphicon glyphicon-briefcase"></i> �ǸŻ�ǰ����
						</div>
						<ul class="list-group">
							<li class="list-group-item"><a href="#">�ǸŻ�ǰ���</a> <i
								class="glyphicon glyphicon-ban-circle"></i></li>
							<li class="list-group-item"><a href="#">�ǸŻ�ǰ����</a> <i
								class="glyphicon glyphicon-ban-circle"></i></li>
						</ul>
					</div>
				</c:if>

				<div class="panel panel-primary">
					<div class="panel-heading">
						<i class="glyphicon glyphicon-shopping-cart"></i> ��ǰ����
					</div>
					<ul class="list-group">
						<li class="list-group-item"><a href="#">��ǰ�˻�</a></li>
						<li class="list-group-item"><a href="#">�����̷���ȸ</a> <i
							class="glyphicon glyphicon-ban-circle"></i></li>
						<li class="list-group-item"><a href="#">�ֱٺ���ǰ</a> <i
							class="glyphicon glyphicon-ban-circle"></i></li>
					</ul>
				</div>

			</div>
			<!--  Menu ���� end /////////////////////////////////////-->

			<!--  Main start /////////////////////////////////////-->
			<div class="col-md-9">
				<div class="jumbotron">
					<h1 id="clock"></h1>
					<p>�α��� �� ��밡��...</p>
					<p>�α��� �� �˻��� �����մϴ�.</p>
					<p>ȸ������ �ϼ���.</p>

					<div class="text-center">
						<a class="btn btn-info btn-lg" href="#" role="button">ȸ������</a> <a
							class="btn btn-info btn-lg" href="#" role="button"
							data-toggle="modal" data-target="#myInput">�� �� ��</a>
					</div>

				</div>
			</div>
			<!--  Main end /////////////////////////////////////-->

		</div>
		<!-- �ٴܷ��̾ƿ�  end /////////////////////////////////////-->

	</div>
	<!--  ȭ�鱸�� div end /////////////////////////////////////-->
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
									<h1 class="text-center">�� &nbsp;&nbsp;�� &nbsp;&nbsp;��</h1>

									<form class="form-horizontal">

										<div class="form-group">
											<label for="userId" class="col-sm-4 control-label">��
												�� ��</label>
											<div class="col-sm-6">
												<input type="text" class="form-control" name="userId"
													id="userId" placeholder="���̵�">
											</div>
										</div>

										<div class="form-group">
											<label for="password" class="col-sm-4 control-label">��
												�� �� ��</label>
											<div class="col-sm-6">
												<input type="password" class="form-control" name="password"
													id="password" placeholder="�н�����">
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
					<button type="button" class="btn btn-primary" data-dismiss="modal">�α���</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">���</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->

	</div>
	<!-- /.modal -->
</body>

</html>
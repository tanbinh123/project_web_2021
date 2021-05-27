<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Breadcrumb - Voler Admin Dashboard</title>

<link rel="stylesheet" href="/assets/css/bootstrap.css">

<link rel="stylesheet"
	href="/assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
<link rel="stylesheet" href="/assets/css/app.css">
<link rel="shortcut icon" href="/assets/images/favicon.svg"
	type="image/x-icon">


</head>

<body>
	<div id="app">
		<div id="sidebar" class='active'>
			<div class="sidebar-wrapper active">
				<div class="sidebar-header">
					<img src="/assets/images/logo.svg" alt="" srcset="">
				</div>
				<div class="sidebar-menu">
					<ul class="menu">


						<li class='sidebar-title'>Main Menu</li>

						


						<li class="sidebar-item active has-sub"><a href="#"
							class='sidebar-link'> <i data-feather="triangle" width="20"></i>
								<span>Thống kê</span>
						</a>

							<ul class="submenu active">
								<li><a href="http://localhost:25001/admin/charts/piechart">Biểu đồ tròn</a></li>

								<li><a href="http://localhost:25001/admin/charts/chart-money-categories">Biểu đồ cột</a></li>

							</ul></li>






						</li>
						
						<li class="sidebar-item  "><a href="/admin"
							class='sidebar-link'> <i data-feather="grid" width="20"></i>
								<span>Admin</span>
						</a></li>
						
						<li class="sidebar-item  "><a href="/admin/upload/course"
							class='sidebar-link'> <i data-feather="grid" width="20"></i>
								<span>Upload Khóa học</span>
						</a></li>
						
						<li class="sidebar-item  "><a href="/admin/courses"
							class='sidebar-link'> <i data-feather="grid" width="20"></i>
								<span>Danh sách khóa học</span>
						</a></li>
						
						<li class="sidebar-item  "><a href="/admin/upload/image/multipartfile"
							class='sidebar-link'> <i data-feather="grid" width="20"></i>
								<span>Upload Ảnh</span>
						</a></li>
						
						<li class="sidebar-item  "><a href="/admin/images"
							class='sidebar-link'> <i data-feather="grid" width="20"></i>
								<span>Danh sách ảnh</span>
						</a></li>
						
						<li class="sidebar-item  "><a href="/admin/upload/video/multipartfile"
							class='sidebar-link'> <i data-feather="grid" width="20"></i>
								<span>Upload Video</span>
						</a></li>
						
						<li class="sidebar-item  "><a href="/admin/videos"
							class='sidebar-link'> <i data-feather="grid" width="20"></i>
								<span>Danh sách video</span>
						</a></li>




					</ul>
				</div>
				<button class="sidebar-toggler btn x">
					<i data-feather="x"></i>
				</button>
			</div>
		</div>
		<div id="main">
			<nav class="navbar navbar-header navbar-expand navbar-light">
				<a class="sidebar-toggler" href="#"><span
					class="navbar-toggler-icon"></span></a>
				<button class="btn navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul
						class="navbar-nav d-flex align-items-center navbar-light ms-auto">
						<li class="dropdown nav-icon"><a href="#"
							data-bs-toggle="dropdown"
							class="nav-link  dropdown-toggle nav-link-lg nav-link-user">
								<div class="d-lg-inline-block">
									<i data-feather="bell"></i>
								</div>
						</a>
							<div class="dropdown-menu dropdown-menu-end dropdown-menu-large">
								<h6 class='py-2 px-4'>Notifications</h6>
								<ul class="list-group rounded-none">
									<li class="list-group-item border-0 align-items-start">
										<div class="avatar bg-success me-3">
											<span class="avatar-content"><i
												data-feather="shopping-cart"></i></span>
										</div>
										<div>
											<h6 class='text-bold'>New Order</h6>
											<p class='text-xs'>An order made by Ahmad Saugi for
												product Samsung Galaxy S69</p>
										</div>
									</li>
								</ul>
							</div></li>
						<li class="dropdown nav-icon me-2"><a href="#"
							data-bs-toggle="dropdown"
							class="nav-link dropdown-toggle nav-link-lg nav-link-user">
								<div class="d-lg-inline-block">
									<i data-feather="mail"></i>
								</div>
						</a>
							<div class="dropdown-menu dropdown-menu-end">
								<a class="dropdown-item" href="#"><i data-feather="user"></i>
									Account</a> <a class="dropdown-item active" href="#"><i
									data-feather="mail"></i> Messages</a> <a class="dropdown-item"
									href="#"><i data-feather="settings"></i> Settings</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="#"><i data-feather="log-out"></i>
									Logout</a>
							</div></li>
						<li class="dropdown"><a href="#" data-bs-toggle="dropdown"
							class="nav-link dropdown-toggle nav-link-lg nav-link-user">
								<div class="avatar me-1">
									<img src="/assets/images/avatar/avatar-s-1.png" alt=""
										srcset="">
								</div>
								<div class="d-none d-md-block d-lg-inline-block">Hi, Saugi</div>
						</a>
							<div class="dropdown-menu dropdown-menu-end">
								<a class="dropdown-item" href="#"><i data-feather="user"></i>
									Account</a> <a class="dropdown-item active" href="#"><i
									data-feather="mail"></i> Messages</a> <a class="dropdown-item"
									href="#"><i data-feather="settings"></i> Settings</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="#"><i data-feather="log-out"></i>
									Logout</a>
							</div></li>
					</ul>
				</div>
			</nav>

			<div class="main-content container-fluid">
				<div class="page-title">
					<div class="row">
						<div class="col-12 col-md-6">
							<h3>Breadcrumb</h3>
							<p class="text-subtitle text-muted">Indicate the current
								pageâs location within a navigational hierarchy that
								automatically adds separators via CSS.</p>
						</div>
						<div class="col-12 col-md-6">
							<nav aria-label="breadcrumb" class='breadcrumb-header text-right'>
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
									<li class="breadcrumb-item active" aria-current="page">Breadcrumb</li>
								</ol>
							</nav>
						</div>
					</div>

				</div>
				<section class="section">
					<div class="row">
						<div class="card">
							<div class="card-header">
								<h4 class="card-title">Default</h4>
							</div>
							<div class="card-body">
								<div style="display: flex">
									<div id="chartContainer" style="height: 300px; width: 500px;"></div>
									<div>
										<input id="title" type="hidden" value="${pieChart.title}" />
										<input id="dataPoints" type="hidden"
											value='${pieChart.toJsonStringFromDataPoints()}' />
										<table>

											<tr>
												<td colspan="2"><a
													href="/admin/charts/chart-money-categories"><button
															type="button">Doanh thu theo thể loại khóa học</button></a></td>
											</tr>

											<tr>
												<td colspan="2"><a
													href="/admin/charts/chart-money-month"><button
															type="button">Doanh thu theo từng tháng trong
															năm nay</button></a></td>
											</tr>

											<td colspan="2"><a href="http://localhost:3000"><button
															type="button">Trờ về</button></a></td>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
				</section>

			</div>

			<footer>
				<div class="footer clearfix mb-0 text-muted">
					<div class="float-start">
						<p>2020 &copy; Voler</p>
					</div>
					<div class="float-end">
						<p>
							Crafted with <span class='text-danger'><i
								data-feather="heart"></i></span> by <a href="http://ahmadsaugi.com">Ahmad
								Saugi</a>
						</p>
					</div>
				</div>
			</footer>
		</div>
	</div>
	<script src="/assets/js/feather-icons/feather.min.js"></script>
	<script
		src="/assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script src="/assets/js/app.js"></script>

	<script src="/assets/js/main.js"></script>
	<script type="text/javascript" src="/asserts/canvasjs/canvasjs.min.js"></script>


	<script type="text/javascript">
  window.onload = function () {
  	var tilteInput = document.getElementById('title');
  	var dataPoints = document.getElementById('dataPoints');
    var chart = new CanvasJS.Chart("chartContainer", {

      title:{
        text: tilteInput.value             
      },
      data: [//array of dataSeries              
        { //dataSeries object

         /*** Change type "column" to "bar", "area", "line" or "pie"***/
         type: "column",
         dataPoints: JSON.parse(dataPoints.value)
     }]});

    chart.render();
  }
  </script>
</body>

</html>
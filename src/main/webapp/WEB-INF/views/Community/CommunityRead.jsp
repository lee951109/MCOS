<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>본문</title>

    <!-- Custom fonts for this template-->
    <link href="/resources/admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="/resources/admin/css/sb-admin-2.min.css" rel="stylesheet">
   
<style>
 section.replyForm { padding:30px 0; }
 section.replyForm div.input-group { margin:10px 0; }
 section.replyForm textarea { font-size:16px; font-family:'맑은 고딕', verdana; padding:10px; width:500px;; height:150px; }
 section.replyForm button { font-size:20px; padding:5px 10px; margin:10px 0; background:#fff; border:1px solid #ccc; }
 
 section.replyList { padding:30px 0; }
 section.replyList ol { padding:0; margin:0; }
 section.replyList ol li { padding:10px 0; border-bottom:2px solid #eee; }
 section.replyList div.userInfo { }
 section.replyList div.userInfo .userName { font-size:24px; font-weight:bold; }
 section.replyList div.userInfo .date { color:#999; display:inline-block; margin-left:10px; }
 section.replyList div.replyContent { padding:10px; margin:20px 0; }

section.replyList div.replyFooter button { font-size:14px; border: 1px solid #999; background:none; margin-right:10px; }
</style>
<style>
 div.replyModal { position:relative; z-index:1; display:none; }
 div.modalBackground { position:fixed; top:0; left:0; width:100%; height:100%; background:rgba(0, 0, 0, 0.8); z-index:-1; }
 div.modalContent { position:fixed; top:20%; left:calc(50% - 250px); width:523px; height:310px; padding:20px 10px; background:#fff; border:2px solid #666; }
 div.modalContent textarea { font-size:16px; font-family:'맑은 고딕', verdana; padding:10px; width:500px; height:200px; }
 div.modalContent button { font-size:20px; padding:5px 10px; margin:10px 0; background:#fff; border:1px solid #ccc; }
 div.modalContent button.modal_cancle { margin-left:20px; }
</style>
 <!-- Bootstrap core JavaScript-->
  	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="/resources/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- Core plugin JavaScript-->
    <script src="/resources/admin/vendor/jquery-easing/jquery.easing.min.js"></script>
	
    <!-- Custom scripts for all pages-->
    <script src="/resources/admin/js/sb-admin-2.min.js"></script>
	
<script>
$(function() {
				//댓글 작성 코드  
	$("#replyBtn").click(function(){
					
		var formObj = $(".replyForm form[role='form']");
		var comid = $("#comid").val();
		var replyContent = $("#replyContent").val();
		var userid = $("#userid").val();
					
		var data = {
			comid : comid,
			replyContent : replyContent,
			userid : userid
			};
			//console.log(data)
		$.ajax({
			url : "/Community/CommunityRead/registReply",
			type : "post",
			data : data,
			success : function(result){
			//console.log(result);
			replyList();
			$("#replyContent").val("");
			alert("댓글 등록되었습니다.");
					}
					,error : function(error){
						console.log("Object : " + Object);
						console.log("comid :" + comid);
						console.log("userid :" + userid);
						console.log("replyContent :" + replyContent);
					}
			});
		 });
});

			//댓글 삭제 코드
$(document).on("click", ".delete", function(){
	var deleteConfirm = confirm("정말로 삭제하시겠습니까?");
	
	if(deleteConfirm){
	
	var data = { replyid : $(this).attr("data-replyid")};
	$.ajax({
		url : "/Community/CommunityRead/deleteReply",
		type : "post",
		data : data,
		success : function(result){
			console.log(result);
		  if(result == 1){
			replyList();
		  }else{
			  alert("작성자 본인만 할 수 있습니다.");
		  }
		}
	,error : function(error){
		console.log("error:" + error);
	}
	});
	}
});
			
				//댓글 수정 코드
$(document).on("click", ".modal_modify_btn", function(){
	var modifyConfirm = confirm("정말로 수정하시겠습니까?");
	
	if(modifyConfirm){
		var data = {
				replyid : $(this).attr("data-replyid"),
				replyContent : $(".modal_replyContent").val()
			}; //ReplyVo 형태로 데이터 생성
	$.ajax({
		url : "/Community/CommunityRead/modifyReply",
		type : "post",
		data : data,
		success : function(result){
			//result의 값에 따라 동작
			if(result == 1){
				replyList(); //리스트 새로고침
				$(".replyModal").fadeOut(200);
			}else{
				alert("작성자 본인만 할 수 있습니다.") // 본인이 아닌경우
			}
		},
		error : function(error){
			console.log("에러 : "+ error);
		}
	});	
	}
});
				
			//댓글 목록 코드
function replyList(){
 var comid = ${commVO.comid};
 $.getJSON("/Community/CommunityRead/replyList" + "?comid=" + comid, function(data){
  var str = "";
  
  $(data).each(function(){
   
   console.log(data);
   
   var writeDate = new Date(this.writeDate);
   writeDate = writeDate.toLocaleDateString("ko-US")
   
   str += "<li data-replyid='" + this.replyid + "'>"
     + "<div class='userInfo'>"
     + "<label for='userid'>작성자:</label><span class='userid'>" + this.userid + "</span>"
     + "<span class='date'>" + writeDate + "</span>"
     + "</div>"
     + "<div class='replyContent'>" + this.replyContent + "</div>"
     
     + "<div class='replyFooter'>"
     + "<button type='button' class='modify' data-replyid='" + this.replyid + "'>수정</button>"
     + "<button type='button' class='delete' data-replyid='" + this.replyid + "'>삭제</button>"
     + "</div>"
     
     + "</li>";           
  });
  
  $("section.replyList ol").html(str);
 });
}
</script>

</head>

<body id="page-top">
    <!-- Page Wrapper -->
    <div id="wrapper">
        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="../">
                    <div class="sidebar-brand-icon rotate-n-15">
                        <img src="/resources/admin/img/mainlogo.png"  alt="Logo" style="width: 90px; transform: rotate(15deg);">
                    </div>
                    <div class="sidebar-brand-text mx-3">MCOS</div>
                </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item">
                <a class="nav-link" href="../full">
                    <i class="fa fa-calendar"></i>
                    <span>Calendar</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                Interface
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
                    aria-expanded="true" aria-controls="collapseTwo">
                    <i class="fa fa-comments" aria-hidden="true"></i>
                    <span>Utilities</span>
                </a>
                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Community:</h6>
                        <a class="collapse-item" href="./CommunityList">커뮤니티</a>
                         <a class="collapse-item" href="../insurance">4대보험 계산기</a>
                        <a class="collapse-item" href="../EvaluationRegist">직원평가</a>
                    </div>
                </div>
            </li>

            <!-- Nav Item - Utilities Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities"
                    aria-expanded="true" aria-controls="collapseUtilities">
                    <i class="fas fa-fw fa-wrench"></i>
                    <span>Utilities</span>
                </a>
                <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Custom Utilities:</h6>
                        <a class="collapse-item" href="utilities-color.html">Colors</a>
                        <a class="collapse-item" href="utilities-border.html">Borders</a>
                        <a class="collapse-item" href="utilities-animation.html">Animations</a>
                        <a class="collapse-item" href="utilities-other.html">Other</a>
                    </div>
                </div>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                Addons
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item active">
                <a class="nav-link" href="#" data-toggle="collapse" data-target="#collapsePages" aria-expanded="true"
                    aria-controls="collapsePages">
                    <i class="fas fa-fw fa-folder"></i>
                    <span>Pages</span>
                </a>
                <div id="collapsePages" class="collapse show" aria-labelledby="headingPages"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Login Screens:</h6>
                        <a class="collapse-item" href="login.html">Login</a>
                        <a class="collapse-item" href="register.html">Register</a>
                        <a class="collapse-item" href="forgot-password.html">Forgot Password</a>
                        <div class="collapse-divider"></div>
                        <h6 class="collapse-header">Other Pages:</h6>
                        <a class="collapse-item" href="404.html">404 Page</a>
                        <a class="collapse-item active" href="blank.html">Blank Page</a>
                    </div>
                </div>
            </li>

            <!-- Nav Item - Charts -->
            <li class="nav-item">
                <a class="nav-link" href="charts.html">
                    <i class="fas fa-fw fa-chart-area"></i>
                    <span>Charts</span></a>
            </li>

            <!-- Nav Item - Tables -->
            <li class="nav-item">
                <a class="nav-link" href="tables.html">
                    <i class="fas fa-fw fa-table"></i>
                    <span>Tables</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">

            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>

        </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                    <!-- Sidebar Toggle (Topbar) -->
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>

                    <!-- Topbar Search -->
                    <form
                        class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                        <div class="input-group">
                            <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..."
                                aria-label="Search" aria-describedby="basic-addon2">
                            <div class="input-group-append">
                                <button class="btn btn-primary" type="button">
                                    <i class="fas fa-search fa-sm"></i>
                                </button>
                            </div>
                        </div>
                    </form>

                    <!-- Topbar Navbar -->
                    <ul class="navbar-nav ml-auto">

                        <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                        <li class="nav-item dropdown no-arrow d-sm-none">
                            <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-search fa-fw"></i>
                            </a>
                            <!-- Dropdown - Messages -->
                            <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                                aria-labelledby="searchDropdown">
                                <form class="form-inline mr-auto w-100 navbar-search">
                                    <div class="input-group">
                                        <input type="text" class="form-control bg-light border-0 small"
                                            placeholder="Search for..." aria-label="Search"
                                            aria-describedby="basic-addon2">
                                        <div class="input-group-append">
                                            <button class="btn btn-primary" type="button">
                                                <i class="fas fa-search fa-sm"></i>
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </li>

                        <!-- Nav Item - Alerts -->
                        <li class="nav-item dropdown no-arrow mx-1">
                            <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-bell fa-fw"></i>
                                <!-- Counter - Alerts -->
                                <span class="badge badge-danger badge-counter">3+</span>
                            </a>
                            <!-- Dropdown - Alerts -->
                            <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="alertsDropdown">
                                <h6 class="dropdown-header">
                                    Alerts Center
                                </h6>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="mr-3">
                                        <div class="icon-circle bg-primary">
                                            <i class="fas fa-file-alt text-white"></i>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="small text-gray-500">December 12, 2019</div>
                                        <span class="font-weight-bold">A new monthly report is ready to download!</span>
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="mr-3">
                                        <div class="icon-circle bg-success">
                                            <i class="fas fa-donate text-white"></i>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="small text-gray-500">December 7, 2019</div>
                                        $290.29 has been deposited into your account!
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="mr-3">
                                        <div class="icon-circle bg-warning">
                                            <i class="fas fa-exclamation-triangle text-white"></i>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="small text-gray-500">December 2, 2019</div>
                                        Spending Alert: We've noticed unusually high spending for your account.
                                    </div>
                                </a>
                                <a class="dropdown-item text-center small text-gray-500" href="#">Show All Alerts</a>
                            </div>
                        </li>

                        <!-- Nav Item - Messages -->
                        <li class="nav-item dropdown no-arrow mx-1">
                            <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-envelope fa-fw"></i>
                                <!-- Counter - Messages -->
                                <span class="badge badge-danger badge-counter">7</span>
                            </a>
                            <!-- Dropdown - Messages -->
                            <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="messagesDropdown">
                                <h6 class="dropdown-header">
                                    Message Center
                                </h6>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="dropdown-list-image mr-3">
                                        <img class="rounded-circle" src="/resources/admin/img/undraw_profile_1.svg"
                                            alt="">
                                        <div class="status-indicator bg-success"></div>
                                    </div>
                                    <div class="font-weight-bold">
                                        <div class="text-truncate">Hi there! I am wondering if you can help me with a
                                            problem I've been having.</div>
                                        <div class="small text-gray-500">Emily Fowler · 58m</div>
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="dropdown-list-image mr-3">
                                        <img class="rounded-circle" src="/resources/admin/img/undraw_profile_2.svg"
                                            alt="">
                                        <div class="status-indicator"></div>
                                    </div>
                                    <div>
                                        <div class="text-truncate">I have the photos that you ordered last month, how
                                            would you like them sent to you?</div>
                                        <div class="small text-gray-500">Jae Chun · 1d</div>
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="dropdown-list-image mr-3">
                                        <img class="rounded-circle" src="/resources/admin/img/undraw_profile_3.svg"
                                            alt="">
                                        <div class="status-indicator bg-warning"></div>
                                    </div>
                                    <div>
                                        <div class="text-truncate">Last month's report looks great, I am very happy with
                                            the progress so far, keep up the good work!</div>
                                        <div class="small text-gray-500">Morgan Alvarez · 2d</div>
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="dropdown-list-image mr-3">
                                        <img class="rounded-circle" src="https://source.unsplash.com/Mv9hjnEUHR4/60x60"
                                            alt="">
                                        <div class="status-indicator bg-success"></div>
                                    </div>
                                    <div>
                                        <div class="text-truncate">Am I a good boy? The reason I ask is because someone
                                            told me that people say this to all dogs, even if they aren't good...</div>
                                        <div class="small text-gray-500">Chicken the Dog · 2w</div>
                                    </div>
                                </a>
                                <a class="dropdown-item text-center small text-gray-500" href="#">Read More Messages</a>
                            </div>
                        </li>

                        <div class="topbar-divider d-none d-sm-block"></div>

                        <!-- Nav Item - User Information -->
                        <li class="nav-item dropdown no-arrow">
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small">Douglas McGee</span>
                                <img class="img-profile rounded-circle"
                                    src="/resources/admin/img/undraw_profile.svg">
                            </a>
                            <!-- Dropdown - User Information -->
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="userDropdown">
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Profile
                                </a>
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Settings
                                </a>
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Activity Log
                                </a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Logout
                                </a>
                            </div>
                        </li>

                    </ul>

                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h2 style="text-align:center;">지현 컴퍼니</h2>
<div class="col-lg-12">
	<form>
	<div class="box box-primary">
		<div class="box-header with-border">
			<h3 class="box-title">글제목 : ${commVO.title}</h3>
		</div>
		<div class="box-body" style="height: 600px">
		<p>
		${commVO.comContent}
		</p>
		</div>
		<div class="box-footer">
			<div class="user-block">
				<img class="img-circle img-bordered-sm" src="/resources/admin/img/undraw_profile.svg" alt="user image" style="width: 40px; height: 40px">
				<span class="username">
					<a href="#">${commVO.username}</a><p>${commVO.userid}</p>
				</span>
				<span class="description"><fmt:formatDate pattern="yyyy-MM-dd a HH:mm" value="${commVO.writeDate}" /></span>
			</div>
		</div>
		<div class="box-footer">
				<input type="hidden" name="comid" value="${commVO.comid}">
			<button type="submit" formaction="CommunityList" formmethod="get" class="btn btn-primary listBtn"><i class="fa fa-list"></i>목록</button>
			<div class="float-right">
				<button type="submit" formaction="CommunityModify" formmethod="get" class="btn btn-warning modBtn"><i class="fa fa-edit"></i>수정</button>
				<button type="submit" formaction="delete" formmethod="post" class="btn btn-danger delBtn"><i class="fa fa-trash"></i>삭제</button>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />  
			</div>
		</div>
	</div>
</form>
</div>
<hr/>
<!-- Reply Form Start -->
<div id="reply">	
	<section class="replyForm">
		<form role="form" method="post" autocomplete="off">
			<div class="form-group">
				<textarea name="replyContent" id="replyContent"></textarea>
			</div>
			<input class="form-control" type="hidden" id="comid"name="comid" value="${commVO.comid}">
			 <sec:authorize access="isAuthenticated()">
                   <sec:authentication property="principal.username" var="userid" />
                   <input type="text" id="userid" name="userid" value="${userid}" readonly>
             </sec:authorize>
            <!--  <input type="text" id="username" name="username" value="${memberVO.userName}" readonly /> 
				-->            
			<div class="form-group">
				<button id="replyBtn" type="button">작성</button>
			</div>
		</form>
	</section>
	<section class="replyList">
		<ol>
			<%--<c:forEach items="${replyVO}" var="replyVO">
				<li>
					<div class="userInfo">
						<span class="userName">${replyVO.username}</span>
						<span class="date"><fmt:formatDate value="${replyVO.writeDate}" pattern="yyyy-MM-dd" /></span>
					</div>
					<div class="replyContent">${replyVO.content}</div>
				</li>	
			</c:forEach> --%>
		</ol>
	</section>
</div>
</div>
			<!-- Reply Form End -->
	<!-- Modal Start-->
<div class="replyModal">
	<div class="modalContent">
		<div>
			<textarea class="modal_replyContent" name="modal_replyContent"></textarea>
		</div>
		
		<div>
			<button type="button" class="modal_modify_btn">수정</button>
			<button type="button" class="modal_cancle">취소</button>
		</div>
	</div>
	<div class="modalBackground"></div>
</div>	
<script>
$(document).on("click", ".modify", function(){
	$(".replyModal").fadeIn(200);

	var replyid = $(this).attr("data-replyid");
	var replyContent = $(this).parent().parent().children(".replyContent").text();
	
	$(".modal_replyContent").val(replyContent);
	$(".modal_modify_btn").attr("data-replyid", replyid);
	
});

$(".modal_cancle").click(function(){
	$(".replyModal").fadeOut(200);
});
</script>
	<!-- Modal End -->
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="login.html">Logout</a>
                </div>
            </div>
        </div>
    </div>
<script>
	replyList();
</script>



   
</body>
</html>
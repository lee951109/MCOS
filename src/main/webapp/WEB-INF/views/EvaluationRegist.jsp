<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    

    <title>직원 평가</title>

    <!-- Custom fonts for this template-->
    <link href="/resources/admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="/resources/admin/css/sb-admin-2.min.css" rel="stylesheet">
    <link href="/resources/admin/css/style.css" rel="stylesheet">
<style>
.star-attitude>.attitude,
.star-attitude>.attitude>label:hover,
.star-attitude>.attitude>input:focus+label,
.star-attitude>.attitude>input:checked+label{display: inline-block;vertical-align:middle;background:url('/resources/admin/img/grade_img.png')no-repeat;}
.star-attitude{display:inline-block; white-space:nowrap;width:225px;height:40px;padding:25px;line-height:30px;}
.star-attitude>.attitude{display:inline-block;width:150px;background-size:150px;height:28px;white-space:nowrap;overflow:hidden;position: relative;}
.star-attitude>.attitude>input{position:absolute;width:1px;height:1px;opacity:0;}
star-attitude>.attitude.focus{outline:1px dotted #ddd;}
.star-attitude>.attitude>label{width:30px;height:0;padding:28px 0 0 0;overflow: hidden;float:left;cursor: pointer;position: absolute;top: 0;left: 0;}
.star-attitude>.attitude>label:hover,
.star-attitude>.attitude>input:focus+label,
.star-attitude>.attitude>input:checked+label{background-size: 150px;background-position: 0 bottom;}
.star-attitude>.attitude>label:hover~label{background-image: none;}
.star-attitude>.attitude>label[for="attitude1"]{width:30px;z-index:5;}
.star-attitude>.attitude>label[for="attitude2"]{width:60px;z-index:4;}
.star-attitude>.attitude>label[for="attitude3"]{width:90px;z-index:3;}
.star-attitude>.attitude>label[for="attitude4"]{width:120px;z-index:2;}
.star-attitude>.attitude>label[for="attitude5"]{width:150px;z-index:1;}
.star-attitude>output{display:inline-block;width:60px; font-size:18px;text-align:right; vertical-align:middle;}

.star-tenacity>.tenacity,
.star-tenacity>.tenacity>label:hover,
.star-tenacity>.tenacity>input:focus+label,
.star-tenacity>.tenacity>input:checked+label{display: inline-block;vertical-align:middle;background:url('/resources/admin/img/grade_img.png')no-repeat;}
.star-tenacity{display:inline-block; white-space:nowrap;width:225px;height:40px;padding:25px;line-height:30px;}
.star-tenacity>.tenacity{display:inline-block;width:150px;background-size:150px;height:28px;white-space:nowrap;overflow:hidden;position: relative;}
.star-tenacity>.tenacity>input{position:absolute;width:1px;height:1px;opacity:0;}
star-tenacity>.tenacity.focus{outline:1px dotted #ddd;}
.star-tenacity>.tenacity>label{width:30px;height:0;padding:28px 0 0 0;overflow: hidden;float:left;cursor: pointer;position: absolute;top: 0;left: 0;}
.star-tenacity>.tenacity>label:hover,
.star-tenacity>.tenacity>input:focus+label,
.star-tenacity>.tenacity>input:checked+label{background-size: 150px;background-position: 0 bottom;}
.star-tenacity>.tenacity>label:hover~label{background-image: none;}
.star-tenacity>.tenacity>label[for="tenacity1"]{width:30px;z-index:5;}
.star-tenacity>.tenacity>label[for="tenacity2"]{width:60px;z-index:4;}
.star-tenacity>.tenacity>label[for="tenacity3"]{width:90px;z-index:3;}
.star-tenacity>.tenacity>label[for="tenacity4"]{width:120px;z-index:2;}
.star-tenacity>.tenacity>label[for="tenacity5"]{width:150px;z-index:1;}
.star-tenacity>output{display:inline-block;width:60px; font-size:18px;text-align:right; vertical-align:middle;}

.star-ability>.ability,
.star-ability>.ability>label:hover,
.star-ability>.ability>input:focus+label,
.star-ability>.ability>input:checked+label{display: inline-block;vertical-align:middle;background:url('/resources/admin/img/grade_img.png')no-repeat;}
.star-ability{display:inline-block; white-space:nowrap;width:225px;height:40px;padding:25px;line-height:30px;}
.star-ability>.ability{display:inline-block;width:150px;background-size:150px;height:28px;white-space:nowrap;overflow:hidden;position: relative;}
.star-ability>.ability>input{position:absolute;width:1px;height:1px;opacity:0;}
star-ability>.ability.focus{outline:1px dotted #ddd;}
.star-ability>.ability>label{width:30px;height:0;padding:28px 0 0 0;overflow: hidden;float:left;cursor: pointer;position: absolute;top: 0;left: 0;}
.star-ability>.ability>label:hover,
.star-ability>.ability>input:focus+label,
.star-ability>.ability>input:checked+label{background-size: 150px;background-position: 0 bottom;}
.star-ability>.ability>label:hover~label{background-image: none;}
.star-ability>.ability>label[for="ability1"]{width:30px;z-index:5;}
.star-ability>.ability>label[for="ability2"]{width:60px;z-index:4;}
.star-ability>.ability>label[for="ability3"]{width:90px;z-index:3;}
.star-ability>.ability>label[for="ability4"]{width:120px;z-index:2;}
.star-ability>.ability>label[for="ability5"]{width:150px;z-index:1;}
.star-ability>output{display:inline-block;width:60px; font-size:18px;text-align:right; vertical-align:middle;}
</style>

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
                       <a class="collapse-item" href="/Community/CommunityList">커뮤니티</a>
                         <a class="collapse-item" href="./insurance">4대보험 계산기</a>
                        <a class="collapse-item" href="./EvaluationRegist">직원평가</a>
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
                        <a class="collapse-item active" href="blank.html">4대보험</a>
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
                                    프로필
                                </a>
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                                    설정
                                </a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                    로그아웃
                                </a>
                            </div>
                        </li>

                    </ul>

                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                               <div class="container">
                               <form method="post">
                    <h1 style="text-align: center;">직원 평가</h1>
                <div class="float-right">
                <label for="target">대상자:</label>
                    <input type="text" id="target" name="target">
                <label for="userid">작성자:</label>
                	<input type="text" id="userid" name="userid">
                </div>
                    <table class="table table-borderless">
                        <tbody>
                            <tr>
                                <td><label for="reply_star">근무태도</label></td>
                                <td>
									<span class="star-attitude">
									<span class="attitude">
										<input type="radio" name="attitude" id="attitude1" value="1점">
											<label for="attitude1">1</label>
										<input type="radio" name="attitude" id="attitude2" value="2점">
											<label for="attitude2">2</label>
					   					<input type="radio" name="attitude" id="attitude3" value="3점">
											<label for="attitude3">3</label>
					  					<input type="radio" name="attitude" id="attitude4" value="4점">
									 		<label for="attitude4">4</label>
										<input type="radio" name="attitude" id="attitude5" value="5점">
											<label for="attitude5">5</label>
				 					 </span>
						 				 <output for="star-input"><b>0</b>점</output>						
									 </span>
								</td>
                            </tr>
                            <tr>
                                <td><label for="reply_star">인성</label></td>
                                <td> 
                                <span class="star-tenacity">
								<span class="tenacity">
									<input type="radio" name="tenacity" id="tenacity1" value="1점">
										<label for="tenacity1">1</label>
									<input type="radio" name="tenacity" id="tenacity2" value="2점">
										<label for="tenacity2">2</label>
						   			<input type="radio" name="tenacity" id="tenacity3" value="3점">
										<label for="tenacity3">3</label>
						  			<input type="radio" name="tenacity" id="tenacity4" value="4점">
										<label for="tenacity4">4</label>
									<input type="radio" name="tenacity" id="tenacity5" value="5점">
										<label for="tenacity5">5</label>
					  			</span>
							 		 <output for="star-input"><b>0</b>점</output>						
								</span>
                                </td>
                            </tr>
                            <tr>
                                <td><label for="reply_star">능력</label></td>
                                 <td> 
                                 <span class="star-ability">
								 <span class="ability">
									<input type="radio" name="ability" id="ability1" value="1점">
										<label for="ability1">1</label>
									<input type="radio" name="ability" id="ability2" value="2점">
										<label for="ability2">2</label>
							   		<input type="radio" name="ability" id="ability3" value="3점">
										<label for="ability3">3</label>
							  		<input type="radio" name="ability" id="ability4" value="4점">
										<label for="ability4">4</label>
									<input type="radio" name="ability" id="ability5" value="5점">
										<label for="ability5">5</label>
						  		</span>
								  		<output for="star-ability"><b>0</b>점</output>						
								</span>
                                 </td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="form-group">
                        <label for="achievements">업적:</label>
                        <textarea class="form-control" rows="3" id="achievements" name="achievements"></textarea>
                    </div>
                    <div class="form-group">
                        <label for="evaluationEtc">기타:</label>
                        <textarea class="form-control" rows="5" id="evaluationEtc" name="evaluationEtc"></textarea>
                    </div>
                    <div class="float-right">
                        <button type="submit" class="btn btn-primary"><i class="fa fa-paper-plane" aria-hidden="true">전송</i></button>
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />  
                    </div>
                    </form>
                </div>
               

                <!-- /.container-fluid -->
            
            </div>
            <!-- End of Main Content -->
            
            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Your Website 2020</span>
                    </div>
                </div>
            </footer>
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

    <!-- Bootstrap core JavaScript-->
    <script src="/resources/admin/vendor/jquery/jquery.min.js"></script>
    <script src="/resources/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="/resources/admin/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="/resources/admin/js/sb-admin-2.min.js"></script>
    <script src="/resources/admin/js/jquery-1.11.3.min.js"></script>
    <script src="/resources/admin/js/star.js"></script>
    

</body>

</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
        <nav class="navbar navbar-expand-lg bg-secondary fixed-top" id="mainNav">
            <div class="container"><a class="navbar-brand js-scroll-trigger" href="${pageContext.request.contextPath }/trang-chu#page-top">POLY CODELEARN</a>
                <button class="navbar-toggler navbar-toggler-right font-weight-bold bg-primary text-white rounded" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">Menu <i class="fas fa-bars"></i></button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto">                        
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="${pageContext.request.contextPath }/trang-chu#portfolio">DANH SÁCH MẶT HÀNG</a>
                        </li>
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="${pageContext.request.contextPath }/trang-chu#about">GIỚI THIỆU</a>
                        </li>
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="${pageContext.request.contextPath }/trang-chu#contact">LIÊN HỆ</a>
                        </li>
                        <li class="nav-item dropdown">
          					<a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          					QUẢN LÝ
        					</a>
          					<!-- Here's the magic. Add the .animate and .slide-in classes to your .dropdown-menu and you're all set! -->
          					<div class="dropdown-menu dropdown-menu-right animate slideIn" aria-labelledby="navbarDropdown">
            				<a class="dropdown-item" href="${pageContext.request.contextPath }/admin/tai-khoan">Quản lý tài khoản</a>
            				<div class="dropdown-divider"></div>
            				<a class="dropdown-item" href="${pageContext.request.contextPath }/admin/san-pham">Quản lý sản phẩm</a>           				
            				<a class="dropdown-item" href="${pageContext.request.contextPath }/gio-hang">Quản lý giỏ hàng</a>
          					</div>
        				</li>
        				<c:if test="${sessionScope.user == null }">
                        <li class="nav-item dropdown">
          					<a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          					TÀI KHOẢN
        					</a>
          					<!-- Here's the magic. Add the .animate and .slide-in classes to your .dropdown-menu and you're all set! -->
          					<div class="dropdown-menu dropdown-menu-right animate slideIn" aria-labelledby="navbarDropdown">
            				<a class="dropdown-item" href="${pageContext.request.contextPath }/dang-nhap">Đăng nhập</a>
            				<div class="dropdown-divider"></div>
            				<a class="dropdown-item" href="${pageContext.request.contextPath }/dang-ki">Đăng kí</a> 	
          					</div>
        				</li>
        				</c:if>
        				<c:if test="${sessionScope.user != null }">
                        <li class="nav-item dropdown">
          					<a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          					${sessionScope.user}
        					</a>
          					<!-- Here's the magic. Add the .animate and .slide-in classes to your .dropdown-menu and you're all set! -->
          					<div class="dropdown-menu dropdown-menu-right animate slideIn" aria-labelledby="navbarDropdown">
            				<a class="dropdown-item" href="${pageContext.request.contextPath }/dang-xuat">Đăng xuất</a>        				
          					</div>
        				</li>
                        </c:if>
                        <%-- <li class="nav-item mx-0 mx-lg-1">
                        	<a href="#"><img alt="vietnam" src="${pageContext.request.contextPath }/resources/icon/vietnam.png"></a>
                        	<a href="#"><img alt="english" src="${pageContext.request.contextPath }/resources/icon/english.png"></a>
                        </li> --%>
                    </ul>
                </div>
            </div>
        </nav>
        
        <!-- Modal LOGIN HTML -->
<div id="login" class="modal fade">
	<div class="modal-dialog modal-login">
		<div class="modal-content">
			<div class="modal-header">				
				<h4 class="modal-title">ĐĂNG NHẬP</h4>
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			</div>
			<div class="modal-body">
				<form action="/examples/actions/confirmation.php" method="post">
					<div class="form-group">
						<label>Tên đăng nhập</label>
						<input type="text" class="form-control" placeholder="Username" required="required" name="user">
					</div>
					<div class="form-group">
						<label>Mật khẩu</label>
						<input type="password" class="form-control" placeholder="Password" required="required" name="pass">					
					</div>
					<div class="form-group">
						<input type="checkbox" name="reme">	
						<label>  Nhớ tài khoản</label>					
					</div>
					<div class="form-group">
						<input type="submit" class="btn btn-primary btn-block btn-lg" value="Đăng Nhập">
					</div>
				</form>				
				
			</div>
			<div class="modal-footer">
				<a href="#">Quên mật khẩu?</a>
			</div>
		</div>
	</div>
</div>


        <!-- Modal SIGN UP HTML -->
<div id="signup" class="modal fade">
	<div class="modal-dialog modal-login">
		<div class="modal-content">
			<div class="modal-header">				
				<h4 class="modal-title">ĐĂNG KÍ</h4>
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			</div>
			<div class="modal-body">
				<form action="/examples/actions/confirmation.php" method="post">
					<div class="form-group">
						<label>Họ và tên</label>
						<input type="text" class="form-control" placeholder="Họ và tên" required="required" name="name">
					</div>
					<div class="form-group">
						<label>Email</label>
						<input type="email" class="form-control" placeholder="Email" required="required" name="email">					
					</div>
					<div class="form-group">
						<label>Mật khẩu</label>
						<input type="password" class="form-control" placeholder="Mật khẩu" required="required" name="pass">					
					</div>
					<div class="form-group">
						<label>Nhập lại mật khẩu</label>
						<input type="password" class="form-control" placeholder="Nhập lại ..." required="required" name="confirm">					
					</div>
					<div class="form-group">
						<input type="checkbox" name="reme" required="required">	
						<label>  Tôi đồng ý với điều khoản sử dụng</label>					
					</div>
					<div class="form-group">
						<input type="submit" class="btn btn-primary btn-block btn-lg" value="Đăng Kí">
					</div>
				</form>				
				
			</div>
		</div>
	</div>
</div>

        <!-- Modal CHANGEPASS HTML -->
<div id="changePass" class="modal fade">
	<div class="modal-dialog modal-login">
		<div class="modal-content">
			<div class="modal-header">				
				<h4 class="modal-title">ĐỔI MẬT KHẨU</h4>
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			</div>
			<div class="modal-body">
				<form action="/examples/actions/confirmation.php" method="post">
					<div class="form-group">
						<label>Tên đăng nhập</label>
						<input type="text" class="form-control" placeholder="Username" required="required" name="user">
					</div>
					<div class="form-group">
						<label>Mật khẩu cũ</label>
						<input type="password" class="form-control" placeholder="Mật khẩu cũ" required="required" name="oldPass">					
					</div>
					<div class="form-group">
						<label>Mật khẩu mới</label>
						<input type="password" class="form-control" placeholder="Mật khẩu mới" required="required" name="newPass">					
					</div>
					<div class="form-group">
						<label>Nhập lại mật khẩu mới</label>
						<input type="password" class="form-control" placeholder="Nhập lại..." required="required" name="confirm">					
					</div>
					<div class="form-group">
						<input type="submit" class="btn btn-primary btn-block btn-lg" value="Đổi mật khẩu">
					</div>
				</form>				
				
			</div>
		</div>
	</div>
</div>

        <!-- Modal BaiTHi HTML -->
<div id="thi" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content" >
			<div class="modal-header">				
				<h4 class="modal-title">CHỌN BÀI THI</h4>
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			</div>
			<div class="modal-body">
				<form action="/examples/actions/confirmation.php" method="post">
					<div class="form-group">
						<label>Môn học</label>
						<select name="mon">
							<option value="1">Lập trình java</option>
							<option value="2">My SQL</option>
							<option value="3">Lập trình php</option>
							<option value="4">Lập trình C#</option>
							<option value="5">Lập trình python</option>
						</select>
					</div>
					<div class="form-group">
						<input type="submit" class="btn btn-primary btn-block btn-lg" value="Chọn môn học">
					</div>
				</form>				
				<table class="table table-striped table-hover">
                <thead>
                    <tr>
						<th>

						</th>
                        <th>Mã bài học</th>
                        <th>Tên bài học</th>
						<th>Ngày tạo</th>
                        <th>Môn học</th>
                        <th>Hành động</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
						<td>

						</td>
                        <td>1</td>
                        <td>Bài 3: collection trong java</td>
						<td>31/12/2018</td>
                        <td>Lập trình Java</td>
                        <td>
                           	<a href="${pageContext.request.contextPath }/lam-bai-thi"><button type="button" class="btn btn-success">Thi</button></a>
                        </td>
                    </tr>
                    <tr>
						<td>

						</td>
                        <td>2</td>
                        <td>Bài 1: giới thiệul lập trình Python</td>
						<td>10/02/2015</td>
                        <td>Lập trình Python</td>
                        <td>
                            <a href="${pageContext.request.contextPath }/lam-bai-thi"><button type="button" class="btn btn-success">Thi</button></a>
                        </td>
                    </tr>
					<tr>
						<td>

						</td>
                        <td>3</td>
                        <td>Bài 1: lệnh query</td>
						<td>01/01/2020</td>
                        <td>CSDL My SQL</td>
                        <td>
                            <a href="${pageContext.request.contextPath }/lam-bai-thi"><button type="button" class="btn btn-success">Thi</button></a>
                        </td>
                    </tr>
                    <tr>
						<td>

						</td>
                        <td>4</td>
                        <td>Bài 2: viết mã code</td>
						<td>03/02/1998</td>
                        <td>Lập trình C#</td>
                        <td>
                            <a href="${pageContext.request.contextPath }/lam-bai-thi"><button type="button" class="btn btn-success">Thi</button></a>
                        </td>
                    </tr>					
					<tr>
						<td>

						</td>
                        <td>5</td>
                        <td>Bài 3: Lập trình pHp</td>
						<td>09/12/1988</td>
                        <td>Lập trình pHp</td>
                        <td>
                            <a href="${pageContext.request.contextPath }/lam-bai-thi"><button type="button" class="btn btn-success">Thi</button></a>
                        </td>
                    </tr> 
                </tbody>
            </table>
			</div>
		</div>
	</div>
</div>
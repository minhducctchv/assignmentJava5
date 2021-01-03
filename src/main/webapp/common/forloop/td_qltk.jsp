<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ include file="/common/taglib.jsp" %>
                    <tr>
						<td></td>
                        <td>${taikhoan.idtk}</td>
                        <td>${taikhoan.name}</td>
						<td>${taikhoan.email}</td>
                        <td>${taikhoan.vaitro?"Admin":"Khách hàng"}</td>
                        <td>
                            <a href="${pageContext.request.contextPath }/admin/tai-khoan/update?id=${taikhoan.idtk}" class="edit"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                            <a href="#deleteModal${taikhoan.idtk}" class="delete" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
                        </td>
                    </tr>
                  
	<!-- Delete Modal HTML -->
	<div id="deleteModal${taikhoan.idtk}" class="modal fade">
		<div class="modal-dialog"  id="duc123">
			<div class="modal-content">
					<div class="modal-header">						
						<h4 class="modal-title" style="color: navy;">Xóa tài khoản</h4>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">					
						<p style="color: black;">Bạn có chắc muốn xóa tài khoản này?</p>
						<p class="text-warning"><small>Đã xóa rồi sẽ không lấy lại được.</small></p>
					</div>
					<div class="modal-footer">
						<input type="button" class="btn btn-primary" data-dismiss="modal" value="Hủy">
						<a href="${pageContext.request.contextPath }/admin/tai-khoan/delete?id=${taikhoan.idtk}"><input type="button" class="btn btn-danger" value="Xóa"></a>
					</div>
			</div>
		</div>
	</div>
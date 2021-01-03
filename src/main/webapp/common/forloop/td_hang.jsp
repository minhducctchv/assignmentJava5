<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
                    <tr>
						<form action="${pageContext.request.contextPath }/gio-hang" method="post">
                        <td>${hang.sanpham.tensp}</td>
                        <input type="hidden" name="idsp" value="${hang.sanpham.idsp}">
                        <input type="hidden" name="idtk" value="${hang.taikhoan.idtk}">                
                        <td><input type="number" name="sl" min="1" value="${hang.sl}"></td>
						<td>${hang.sanpham.gia}</td>
						<td>${hang.sanpham.gia*hang.sl}</td>
                        <td>
                        	<button class="btn btn-primary">Cập nhật</button>
                        	</form> 
                        </td>
                        <td><a href="#deleteModal${hang.sanpham.idsp}" class="delete" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a></td>
                    </tr>
                  
	<!-- Delete Modal HTML -->
	<div id="deleteModal${hang.sanpham.idsp}" class="modal fade">
		<div class="modal-dialog"  id="duc123">
			<div class="modal-content">
					<div class="modal-header">						
						<h4 class="modal-title" style="color: navy;">Xóa sản phẩm</h4>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">					
						<p style="color: black;">Bạn có chắc muốn xóa sản phẩm này?</p>
						<p class="text-warning"><small>Đã xóa rồi sẽ không lấy lại được.</small></p>
					</div>
					<div class="modal-footer">
						<input type="button" class="btn btn-primary" data-dismiss="modal" value="Hủy">
						<a href="${pageContext.request.contextPath }/gio-hang/delete?id=${hang.sanpham.idsp}"><input type="button" class="btn btn-danger" value="Xóa"></a>
					</div>
			</div>
		</div>
	</div>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
                    <tr>
						<td>${sanpham.idsp}</td>
                        <td>${sanpham.tensp}</td>
                        <td>${sanpham.sl}</td>
						<td>${sanpham.gia}</td>
                        <td><img alt="${sanpham.hinh}" src="${pageContext.servletContext.contextPath }/resources/images/${sanpham.hinh}" style="height: 70px;"></td>
                        <td>
                            <a href="${pageContext.request.contextPath }/admin/san-pham/update?id=${sanpham.idsp}" class="edit"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                            <a href="#deleteModal${sanpham.idsp}" class="delete" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
                        </td>
                    </tr>
                  
	<!-- Delete Modal HTML -->
	<div id="deleteModal${sanpham.idsp}" class="modal fade">
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
						<a href="${pageContext.request.contextPath }/admin/san-pham/delete?id=${sanpham.idsp}"><input type="button" class="btn btn-danger" value="Xóa"></a>
					</div>
			</div>
		</div>
	</div>
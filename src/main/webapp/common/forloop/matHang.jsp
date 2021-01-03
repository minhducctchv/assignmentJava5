<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
                    <!-- Portfolio Items-->
                    <div class="col-md-6 col-lg-4 mb-5">
                        <div class="portfolio-item mx-auto" data-toggle="modal" data-target="#portfolioModal${sanpham.idsp}">
                            <div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
                                <div class="portfolio-item-caption-content text-center text-white"><i class="fas fa-plus fa-3x"></i></div>
                            </div><img class="img-fluid" src="${pageContext.request.contextPath }/resources/images/${sanpham.hinh}" alt="${sanpham.hinh}" style="height: 300px"/>
                        </div>
                    </div>
                    

        <!-- Portfolio Modal-->
        <div class="portfolio-modal modal fade" id="portfolioModal${sanpham.idsp}" tabindex="-1" role="dialog" aria-labelledby="#portfolioModal0Label" aria-hidden="true">
            <div class="modal-dialog modal-xl" role="document">
                <div class="modal-content">
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fas fa-times"></i></span></button>
                    <div class="modal-body text-center">
                        <div class="container">
                            <div class="row justify-content-center">
                                <div class="col-lg-8">
                                    <!-- Portfolio Modal - Title-->
                                    <h2 class="portfolio-modal-title text-secondary mb-0">${sanpham.tensp}</h2>
                                    <!-- Icon Divider-->
                                    <div class="divider-custom">
                                        <div class="divider-custom-line"></div>
                                        <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                                        <div class="divider-custom-line"></div>
                                    </div>
                                    <!-- Portfolio Modal - Image--><img class="img-fluid rounded mb-5" style="height: 200px;" src="${pageContext.request.contextPath }/resources/images/${sanpham.hinh}" alt="${sanpham.hinh}"/>
                                    <!-- Portfolio Modal - Text-->
                                    <p class="mb-5">
										<div class="form-group">
											<span>Giá: <label style="font-size: 30px; color: red;">${sanpham.gia}</label></span>
										</div>
	
										<div class="form-group">
											<span>Số lượng còn: <label>${sanpham.sl}</label></span>
										</div>
										<form action="${pageContext.request.contextPath }/them-vao-gio" method="post">
										<input type="hidden" name="idsp" value="${sanpham.idsp}"/>
										<div class="form-group">
											<label for="slmua">Số lượng mua:</label>
											<input type="number" name="slmua" class="form-control" min="1" value="1"/>
										</div>									
									</p>
                                    <button class="btn btn-primary">Thêm vào giỏ hàng</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
package edu.mdt.controller.customer;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import edu.mdt.dao.GioCTDAO;
import edu.mdt.dao.SanPhamDAO;
import edu.mdt.dao.TaiKhoanDAO;
import edu.mdt.entity.GioCT;
import edu.mdt.entity.SanPham;
import edu.mdt.entity.TaiKhoan;

@Controller
@RequestMapping("/gio-hang")
public class GioHangController {

	@Autowired
	GioCTDAO dao;
	
	@Autowired
	SanPhamDAO spdao;
	
	@Autowired
	TaiKhoanDAO tkdao;
	
	@GetMapping()
	public String show(ModelMap model, HttpSession session) {
		TaiKhoan tk=(TaiKhoan)  session.getAttribute("user");
		int idtk=tk.getIdtk();
		List<GioCT> list=dao.findByTaiKhoan(idtk);
		model.addAttribute("hangs", list);
		return "customer/gioHang";
	}
	
	@PostMapping()
	public String sua(GioCT gioct,
			@RequestParam("idsp") String idsp,
			@RequestParam("idtk") String idtk) {
		SanPham sp=spdao.findById(Integer.parseInt(idsp));
		TaiKhoan tk =tkdao.findById(Integer.parseInt(idtk));
		gioct.setSanpham(sp);
		gioct.setTaikhoan(tk);
		dao.sua(gioct);
		return "redirect:/gio-hang";
	}
	
	@RequestMapping("/delete")
	public String xoa(@RequestParam("id") int id,
			HttpSession session) {
		TaiKhoan tk=(TaiKhoan) session.getAttribute("user");
		GioCT gioct=dao.findById(tk.getIdtk(), id);
		dao.xoa(gioct);
		return "redirect:/gio-hang";
	}
}

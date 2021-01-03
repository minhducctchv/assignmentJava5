package edu.mdt.controller;



import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
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
public class HomeController {

	@Autowired
	SanPhamDAO dao;
	
	@Autowired
	TaiKhoanDAO tkdao;
	
	@Autowired
	GioCTDAO ctdao;
	
	@RequestMapping(value={"/trang-chu","/"})
	public String trangChu(ModelMap model) {
		List<SanPham> list=dao.getAll();
		model.addAttribute("sanphams", list);
		return "trangChu";
	}
	
	@RequestMapping("/them-vao-gio")
	public String themVaoGio(@RequestParam("idsp") String idsp, 
			@RequestParam("slmua") String slmua,
			HttpSession session) {
		
		TaiKhoan tk=(TaiKhoan) session.getAttribute("user");
		int idspp=Integer.parseInt(idsp);
		int idtk= tk.getIdtk();
		int sl=Integer.parseInt(slmua);
		
		GioCT gioct=ctdao.findById(idtk, idspp);
		if(gioct!=null) {
			int slm=gioct.getSl()+sl;
			gioct.setSl(slm);
			ctdao.sua(gioct);
		}else {
			gioct=new GioCT();
			gioct.setSanpham(dao.findById(idspp));
			gioct.setTaikhoan(tk);
			gioct.setSl(sl);
			ctdao.them(gioct);
			
		}
		return "redirect:/gio-hang";
	}
	
	@GetMapping("/dang-nhap")
	public String dangNhap() {
		
		return "dangNhap";
	}
	
	@PostMapping("/dang-nhap")
	public String dangNhap(@RequestParam("email") String email, 
			@RequestParam("pass") String pass,
			@RequestParam(name = "reme", defaultValue = "abc") String reme,
			HttpServletResponse resp,
			HttpSession session,
			ModelMap model) {
		TaiKhoan tk=tkdao.findByEmail(email);
		if(tk!=null&&tk.getPass().equals(pass)) {
			session.setAttribute("user", tk);
			
			if(reme.equalsIgnoreCase("reme")) {
				Cookie ck1=new Cookie("email", email);
				Cookie ck2=new Cookie("pass", pass);
				Cookie ck3=new Cookie("reme", reme);
				resp.addCookie(ck1);
				resp.addCookie(ck2);
				resp.addCookie(ck3);
			}else {
				Cookie ck1=new Cookie("email", null);
				Cookie ck2=new Cookie("pass", null);
				Cookie ck3=new Cookie("reme", null);
				resp.addCookie(ck1);
				resp.addCookie(ck2);
				resp.addCookie(ck3);
			}
			return "redirect:/trang-chu";
		}else {
			model.addAttribute("mess", "Sai tên đăng nhập hoặc mật khẩu.");
		}
		return "dangNhap";
	}
	
	@RequestMapping("/dang-xuat")
	public String dangXuat(HttpSession session) {
		session.removeAttribute("user");
		return "redirect:/trang-chu";
	}
	
	@GetMapping("/dang-ki")
	public String dangKy() {
		return "dangKi";
	}
	
	@PostMapping("/dang-ki")
	public String dangKy(TaiKhoan tk,ModelMap model,@RequestParam("confirm") String confirm) {
		if(tk.getPass().equalsIgnoreCase(confirm)) {
			tkdao.them(tk);
			model.addAttribute("mess", "Đăng kí thành công.");
		}else {
			model.addAttribute("mess", "Xác nhận mật khẩu không chính xác.");
		}
		
		return "dangKi";
	}
	
}
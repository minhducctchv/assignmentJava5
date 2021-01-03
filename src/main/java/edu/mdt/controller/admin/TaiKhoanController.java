package edu.mdt.controller.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import edu.mdt.dao.TaiKhoanDAO;
import edu.mdt.entity.TaiKhoan;

@Controller
@RequestMapping("/admin/tai-khoan")
public class TaiKhoanController {
	
	@Autowired
	TaiKhoanDAO dao;
	
	@RequestMapping()
	public String show(ModelMap model) {
		List<TaiKhoan> list=dao.getAll();
		model.addAttribute("taikhoans", list);
		return "admin/taiKhoan/taiKhoan";
	}
	
	@GetMapping("/update")
	public String sua(ModelMap model, @RequestParam("id") String id) {
		TaiKhoan tk=dao.findById(Integer.parseInt(id));
		model.addAttribute("taikhoan", tk);
		
		return "admin/taiKhoan/suaTaiKhoan";
	}
	
	@ModelAttribute("vaitro")
	public Map<String, String> getMap(){
		Map<String, String> map=new HashMap<String, String>();
		map.put("0", "Khách hàng");
		map.put("1", "Admin");
		return map;
	}
	
	@PostMapping("/update")
	public String sua(@ModelAttribute("taikhoan") TaiKhoan tk, ModelMap model) {
		dao.sua(tk);
		model.addAttribute("mess", "Cập nhật thành công.");
		return "admin/taiKhoan/suaTaiKhoan";
	}
	
	@GetMapping("/insert")
	public String them() {
		return "admin/taiKhoan/themTaiKhoan";
	}
	
	@PostMapping("/insert")
	public String them(TaiKhoan tk, ModelMap model) {
		dao.them(tk);
		model.addAttribute("mess", "Thêm mới thành công.");
		return "admin/taiKhoan/themTaiKhoan";
	}
	
	@RequestMapping("/delete")
	public String xoa(@RequestParam("id") String id) {
		TaiKhoan tk=dao.findById(Integer.parseInt(id));
		dao.xoa(tk);
		return "redirect:/admin/tai-khoan";
	}
}

package edu.mdt.controller.admin;

import java.io.File;
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
import org.springframework.web.multipart.MultipartFile;

import edu.mdt.dao.SanPhamDAO;
import edu.mdt.entity.SanPham;

@Controller
@RequestMapping("/admin/san-pham")
public class SanPhamController {
	
	@Autowired
	SanPhamDAO dao;
	
	@RequestMapping()
	public String show(ModelMap model) {
		List<SanPham> list=dao.getAll();
		model.addAttribute("sanphams", list);
		return "admin/sanPham/sanPham";
	}
	
	@GetMapping("/update")
	public String sua(ModelMap model, @RequestParam("id") String id) {
		SanPham tk=dao.findById(Integer.parseInt(id));
		model.addAttribute("sanpham", tk);
		
		return "admin/sanPham/suaSanPham";
	}
	
	@ModelAttribute("vaitro")
	public Map<String, String> getMap(){
		Map<String, String> map=new HashMap<String, String>();
		map.put("0", "Khách hàng");
		map.put("1", "Admin");
		return map;
	}
	
	@PostMapping("/update")
	public String sua(@ModelAttribute("sanpham") SanPham sp, ModelMap model,@RequestParam("image") MultipartFile file) {
		if(file.isEmpty()) {
			SanPham spCu=dao.findById(sp.getIdsp());
			sp.setHinh(spCu.getHinh());
		}else {
			String path="C:\\Users\\YourComputer\\eclipse-workspace\\assignmentJava5\\src\\main\\webapp\\resources\\images\\"+file.getOriginalFilename();
			try {
				file.transferTo(new File(path));
				sp.setHinh(file.getOriginalFilename());
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}			
		}
		dao.sua(sp);
		model.addAttribute("mess", "Cập nhật thành công.");
		return "admin/sanPham/suaSanPham";
	}
	
	@GetMapping("/insert")
	public String them() {
		return "admin/sanPham/themSanPham";
	}
	
	@PostMapping("/insert")
	public String them(SanPham sp, ModelMap model, @RequestParam("image") MultipartFile file) {
		if(file.isEmpty()) {
			sp.setHinh("noimage.png");
		}else {
			String path="C:\\Users\\YourComputer\\eclipse-workspace\\assignmentJava5\\src\\main\\webapp\\resources\\images\\"+file.getOriginalFilename();
			try {
				file.transferTo(new File(path));
				sp.setHinh(file.getOriginalFilename());
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}			
		}
		dao.them(sp);
		model.addAttribute("mess", "Thêm mới thành công.");
		return "admin/sanPham/themSanPham";
	}
	
	@RequestMapping("/delete")
	public String xoa(@RequestParam("id") String id) {
		SanPham tk=dao.findById(Integer.parseInt(id));
		dao.xoa(tk);
		return "redirect:/admin/san-pham";
	}

}

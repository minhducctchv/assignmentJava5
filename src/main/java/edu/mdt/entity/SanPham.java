package edu.mdt.entity;

import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.GeneratorType;

@Entity
@Table(name = "sanpham")
public class SanPham {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int idsp;
	
	private String tensp;
	private int sl;
	private int gia;
	private String hinh;
	
	@OneToMany(mappedBy = "sanpham", fetch = FetchType.EAGER)
	private Collection<GioCT> giocts;

	public int getIdsp() {
		return idsp;
	}

	public void setIdsp(int idsp) {
		this.idsp = idsp;
	}

	public String getTensp() {
		return tensp;
	}

	public void setTensp(String tensp) {
		this.tensp = tensp;
	}

	public int getSl() {
		return sl;
	}

	public void setSl(int sl) {
		this.sl = sl;
	}

	public int getGia() {
		return gia;
	}

	public void setGia(int gia) {
		this.gia = gia;
	}

	public String getHinh() {
		return hinh;
	}

	public void setHinh(String hinh) {
		this.hinh = hinh;
	}

	public Collection<GioCT> getGiocts() {
		return giocts;
	}

	public void setGiocts(Collection<GioCT> giocts) {
		this.giocts = giocts;
	}

	public SanPham(int idsp, String tensp, int sl, int gia, String hinh, Collection<GioCT> giocts) {
		super();
		this.idsp = idsp;
		this.tensp = tensp;
		this.sl = sl;
		this.gia = gia;
		this.hinh = hinh;
		this.giocts = giocts;
	}

	public SanPham() {
		super();
	}
	
}

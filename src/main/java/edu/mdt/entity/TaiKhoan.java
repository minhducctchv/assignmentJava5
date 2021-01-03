package edu.mdt.entity;

import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;


@Entity
@Table(name = "taikhoan")
public class TaiKhoan {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int idtk;
	
	private String name;
	private String email;
	private String pass;
	private boolean vaitro;
	
	@OneToMany(mappedBy = "taikhoan", fetch = FetchType.EAGER)
	private Collection<GioCT> giocts;

	public int getIdtk() {
		return idtk;
	}

	public void setIdtk(int idtk) {
		this.idtk = idtk;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public boolean isVaitro() {
		return vaitro;
	}

	public void setVaitro(boolean vaitro) {
		this.vaitro = vaitro;
	}

	public Collection<GioCT> getGiocts() {
		return giocts;
	}

	public void setGiocts(Collection<GioCT> giocts) {
		this.giocts = giocts;
	}

	public TaiKhoan(int idtk, String name, String email, String pass, boolean vaitro, Collection<GioCT> giocts) {
		super();
		this.idtk = idtk;
		this.name = name;
		this.email = email;
		this.pass = pass;
		this.vaitro = vaitro;
		this.giocts = giocts;
	}

	public TaiKhoan() {
		super();
	}

	@Override
	public String toString() {
		// TODO Auto-generated method stub
		String vaitro=this.vaitro?"Admin":"khách hàng";
		return "Xin chào, "+vaitro+": "+this.name;
	}
	
}

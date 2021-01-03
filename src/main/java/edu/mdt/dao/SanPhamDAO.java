package edu.mdt.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.mdt.entity.SanPham;

@Service
public class SanPhamDAO {

	@Autowired
	SessionFactory factory;
	
	@Transactional
	public List<SanPham> getAll(){
		Session session=factory.getCurrentSession();
		Query query=session.createQuery("FROM SanPham");
		List<SanPham> list=query.list();
		return list;
	}
	
	public void them(SanPham tk){
		Session session=factory.openSession();
		Transaction tran=session.beginTransaction();
		try {
			session.save(tk);
			tran.commit();
		} catch (Exception e) {
			tran.rollback();
		}finally {
			session.close();
		}
	}
	
	public void sua(SanPham tk){
		Session session=factory.openSession();
		Transaction tran=session.beginTransaction();
		try {
			session.update(tk);
			tran.commit();
		} catch (Exception e) {
			tran.rollback();
			e.printStackTrace();
		}finally {
			session.close();
		}
	}
	
	public void xoa(SanPham tk){
		Session session=factory.openSession();
		Transaction tran=session.beginTransaction();
		try {
			session.delete(tk);
			tran.commit();
		} catch (Exception e) {
			tran.rollback();
			e.printStackTrace();
		}finally {
			session.close();
		}
	}
	
	@Transactional
	public SanPham findById(int id){
		Session session=factory.getCurrentSession();
		SanPham tk= (SanPham) session.get(SanPham.class, id);
		return tk;
	}
}

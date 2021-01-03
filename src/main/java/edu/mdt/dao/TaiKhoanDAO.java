package edu.mdt.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.mdt.entity.TaiKhoan;

@Service
public class TaiKhoanDAO {

	@Autowired
	SessionFactory factory;
	
	@Transactional
	public List<TaiKhoan> getAll(){
		Session session=factory.getCurrentSession();
		Query query=session.createQuery("FROM TaiKhoan");
		List<TaiKhoan> list=query.list();
		return list;
	}
	
	public void them(TaiKhoan tk){
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
	
	public void sua(TaiKhoan tk){
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
	
	public void xoa(TaiKhoan tk){
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
	public TaiKhoan findById(int id){
		Session session=factory.getCurrentSession();
		TaiKhoan tk= (TaiKhoan) session.get(TaiKhoan.class, id);
		return tk;
	}
	
	@Transactional
	public TaiKhoan findByEmail(String email){
		Session session=factory.getCurrentSession();
		String hql="FROM TaiKhoan t WHERE t.email LIKE :email";
		Query query=session.createQuery(hql);
		query.setParameter("email", email);
		TaiKhoan tk=(TaiKhoan) query.uniqueResult();
		return tk;
	}
}

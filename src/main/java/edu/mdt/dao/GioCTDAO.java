package edu.mdt.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.mdt.entity.GioCT;

@Service
public class GioCTDAO {

	@Autowired
	SessionFactory factory;
	
	@Transactional
	public GioCT findById(int idtk, int idsp) {
		Session session=factory.getCurrentSession();
		String hql="FROM GioCT g WHERE g.taikhoan.idtk = :idtk AND g.sanpham.idsp = :idsp";
		Query query =session.createQuery(hql);		
		query.setParameter("idtk", idtk);
		query.setParameter("idsp", idsp);
		GioCT gioct=(GioCT) query.uniqueResult();
		return gioct;
	}
	
	public void sua(GioCT tk){
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
	
	public void them(GioCT tk){
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
	
	@Transactional
	public List<GioCT> findByTaiKhoan(int idtk){
		Session session=factory.getCurrentSession();
		String hql="FROM GioCT g WHERE g.taikhoan.idtk = :idtk";
		Query query =session.createQuery(hql);		
		query.setParameter("idtk", idtk);
		List<GioCT> list=query.list();
		return list;
	}
	
	public void xoa(GioCT tk){
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
}

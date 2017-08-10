package org.crazyit.booksys.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.crazyit.booksys.dao.AdDao;
import org.crazyit.booksys.domain.Ad;
import org.crazyit.booksys.domain.Book;
import org.crazyit.common.dao.impl.BaseDaoHibernate4;
import org.hibernate.Query;

public class AdDaoHibernate4 extends BaseDaoHibernate4<Ad> implements AdDao {

	@SuppressWarnings("unchecked")
	@Override
	public List<Ad> findAds() {
		String hql = "from Ad as a order by a.ad_Id desc";
		Query query = getSessionFactory().getCurrentSession()
				.createQuery(hql);
		List<Ad> ads= new ArrayList<Ad>();
		List<Ad> ads2= new ArrayList<Ad>();
		ads=query.list();
		if(ads.size()>5){
			for(int i=0;i<5;i++){
				ads2.add(ads.get(i));
			}
		}
		return ads2;
	}

}

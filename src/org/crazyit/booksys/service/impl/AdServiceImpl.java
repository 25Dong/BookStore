package org.crazyit.booksys.service.impl;

import java.util.List;

import org.crazyit.booksys.dao.AdDao;
import org.crazyit.booksys.domain.Ad;
import org.crazyit.booksys.domain.PageBean;
import org.crazyit.booksys.domain.User;
import org.crazyit.booksys.service.AdService;

public class AdServiceImpl implements AdService {
	//注入Dao层的类
	private AdDao adDao;
	public void setAdDao(AdDao adDao) {
		this.adDao = adDao;
	}
	@Override
	public int add(Ad ad) {
		return (Integer) adDao.save(ad);
	}
	@Override
	public List<Ad> findAds() {
		return adDao.findAds();
	}
	@Override
	public PageBean<Ad> findBypage(int currPage) {
		PageBean<Ad> pageBean = new PageBean<Ad>();
		//封装每页的显示的记录数
		int pageSize = 6;
		//封装总记录数
		int totalCount = (int) adDao.findCount(Ad.class);
		pageBean.setDate(currPage, pageSize, totalCount);
		List<Ad> list = adDao.findByPage(Ad.class, currPage, pageSize);
		pageBean.setList(list);
		return pageBean;
	}
	@Override
	public void deleteAd(int ad_Id) {
		adDao.delete(Ad.class, ad_Id);
		
	}
	
	
}

package org.crazyit.booksys.service;

import java.util.List;

import org.crazyit.booksys.domain.Ad;
import org.crazyit.booksys.domain.PageBean;

public interface AdService {

	int add(Ad ad);

	List<Ad> findAds();

	PageBean<Ad> findBypage(int currPage);

	void deleteAd(int ad_Id);
	

}

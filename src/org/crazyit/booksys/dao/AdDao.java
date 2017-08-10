package org.crazyit.booksys.dao;

import java.util.List;

import org.crazyit.booksys.domain.Ad;
import org.crazyit.common.dao.BaseDao;

public interface AdDao extends BaseDao<Ad> {

	List<Ad> findAds();

}

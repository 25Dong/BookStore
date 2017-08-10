package org.crazyit.booksys.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="ad_info")
public class Ad {
	@Id @Column(name="ad_id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int ad_Id;
	private String content;
	private String adPhoto;
	private Date RelaseDate;
	public int getAd_Id() {
		return ad_Id;
	}

	public void setAd_Id(int ad_Id) {
		this.ad_Id = ad_Id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getAdPhoto() {
		return adPhoto;
	}

	public void setAdPhoto(String adPhoto) {
		this.adPhoto = adPhoto;
	}

	public Date getRelaseDate() {
		return RelaseDate;
	}

	public void setRelaseDate(Date relaseDate) {
		RelaseDate = relaseDate;
	}
	

}

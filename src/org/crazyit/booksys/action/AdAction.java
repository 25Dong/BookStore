package org.crazyit.booksys.action;
import java.util.Date;
import java.util.List;
import org.crazyit.booksys.domain.Ad;
import org.crazyit.booksys.domain.PageBean;
import org.crazyit.booksys.service.AdService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
/**
 * 
 * @author 易承东
 *
 */
public class AdAction extends ActionSupport implements ModelDriven<Ad> {
	private String uploadFileName;
	private List<Ad> ads;

	//模型驱动
	Ad ad = new Ad();
	@Override
	public Ad getModel() {
		return ad;
	}
	//注入Service层的类
	private AdService adService;
	public void setAdService(AdService adService) {
		this.adService = adService;
	}
	
	//*****************************************用户操作******************************************************
	//查找后四条广告
	public String findAds(){
		System.out.println("================================find the davertises=========================================");
		setAds(adService.findAds());
		ActionContext.getContext().getSession().put("advertise",ads);
		return "findAdsSu";
	}
	
	//*****************************************管理员操作******************************************************
	public String add(){
		ad.setRelaseDate(new Date());
		int result = adService.add(ad);
		if(result>0){
			System.out.println("添加广告成功");
			return "AddSuc";
		}else{
			System.out.println("添加广告失败");
			return  NONE;
		}
	}
	//分页查找所有广告
	private int currPage =1;
	public String advertiseList(){
		PageBean<Ad> pageBean = adService.findBypage(currPage);
		ActionContext.getContext().getValueStack().push(pageBean);
		return "allAdvertise";
	}
	//删除广告
	public String delete(){
		adService.deleteAd(ad.getAd_Id());
		return "deleteUserSu";
	}
	//*****************************************set and get******************************************************
	public String getUploadFileName() {
		return uploadFileName;
	}
	public String adList(){
		
		return "allUsers";
	}

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
		ad.setAdPhoto(uploadFileName);
	}

	public List<Ad> getAds() {
		return ads;
	}

	public void setAds(List<Ad> ads) {
		this.ads = ads;
	}

	public void setCurrPage(int currPage) {
		this.currPage = currPage;
	}

}

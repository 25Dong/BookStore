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
 * @author �׳ж�
 *
 */
public class AdAction extends ActionSupport implements ModelDriven<Ad> {
	private String uploadFileName;
	private List<Ad> ads;

	//ģ������
	Ad ad = new Ad();
	@Override
	public Ad getModel() {
		return ad;
	}
	//ע��Service�����
	private AdService adService;
	public void setAdService(AdService adService) {
		this.adService = adService;
	}
	
	//*****************************************�û�����******************************************************
	//���Һ��������
	public String findAds(){
		System.out.println("================================find the davertises=========================================");
		setAds(adService.findAds());
		ActionContext.getContext().getSession().put("advertise",ads);
		return "findAdsSu";
	}
	
	//*****************************************����Ա����******************************************************
	public String add(){
		ad.setRelaseDate(new Date());
		int result = adService.add(ad);
		if(result>0){
			System.out.println("��ӹ��ɹ�");
			return "AddSuc";
		}else{
			System.out.println("��ӹ��ʧ��");
			return  NONE;
		}
	}
	//��ҳ�������й��
	private int currPage =1;
	public String advertiseList(){
		PageBean<Ad> pageBean = adService.findBypage(currPage);
		ActionContext.getContext().getValueStack().push(pageBean);
		return "allAdvertise";
	}
	//ɾ�����
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

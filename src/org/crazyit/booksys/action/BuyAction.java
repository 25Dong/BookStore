package org.crazyit.booksys.action;

import java.util.ArrayList;
import java.util.List;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
/**
 * 
 * @author 梁家健
 *
 */
public class BuyAction extends ActionSupport {
	private boolean[] buylist;
	private Integer[] ids;
	private int userid;
	
	public int getUserid() {
		this.setUserid();
		return userid;
	}
	public void setUserid() {
		ActionContext context = ActionContext.getContext();
		this.userid = (Integer)context.getSession().get("userid");
	}
	public boolean[] getBuylist() {
		return buylist;
	}

	public void setBuylist(boolean[] buylist) {
		this.buylist = buylist;
	}

	public Integer[] getIds() {
		return ids;
	}

	public void setIds(Integer[] ids) {
		this.ids = ids;
	}

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		List<Integer> selectedids = new ArrayList<Integer>();
		for(int i = 0;i<buylist.length;i++){
			System.out.println("浣犻�鎷╃殑涔︽湰id"+buylist[i]);
			selectedids.add(ids[i]);
		}
		for(int i=0;i<selectedids.size();i++){
			System.out.println("浣犻�鎷╃殑涔︽湰id"+selectedids.get(i));
			
		}
		return SUCCESS;
	}
	
}

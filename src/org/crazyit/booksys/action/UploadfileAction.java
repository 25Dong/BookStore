package org.crazyit.booksys.action;
import java.io.File;
import java.io.FileNotFoundException;
import org.crazyit.component.FileuploadImpl;
import com.opensymphony.xwork2.ActionSupport;
/**
 * 
 * @author ���ν�
 *
 */
public class UploadfileAction extends ActionSupport {
	private FileuploadImpl fileuploadImpl;
	private File upload;
	private String uploadContentType;
	private String uploadFileName;
	
	public void setFileuploadImpl(FileuploadImpl fileuploadImpl) {
		this.fileuploadImpl = fileuploadImpl;
		
	}
	public File getUpload() {
		return upload;
	}
	public void setUpload(File upload) {
		this.upload = upload;
	}
	public String getUploadContentType() {
		return uploadContentType;
	}
	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}
	public String getUploadFileName() {
		return uploadFileName;
	}
	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}
	public String book() throws FileNotFoundException{
		System.out.println("�������Ա�ϴ�ͼ��ͼƬ��action");
		fileuploadImpl.fileupload(this.getUpload(), this.getUploadFileName());
		return "newBookSu";
		
	}
	public String updateBookPhoto() throws FileNotFoundException{
		System.out.println("�������Ա�ϴ�����ͼƬ��action");
		fileuploadImpl.fileupload(this.getUpload(), this.getUploadFileName());
		return "editsuccess";
		
	}
	public String userImage() throws FileNotFoundException{
		System.out.println("���뵽�û��ϴ�ͼƬ����");
		fileuploadImpl.fileupload(this.getUpload(), this.getUploadFileName());
		return "userImageSu";
	}

	public String adImage() throws FileNotFoundException{
		System.out.println("���뵽����Ա�ϴ����ͼƬ����");
		fileuploadImpl.fileupload(this.getUpload(), this.getUploadFileName());
		/*return "adImageSuc";*/
		return NONE;
	}
	
}

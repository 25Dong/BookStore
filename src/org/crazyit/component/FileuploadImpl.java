package org.crazyit.component;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import org.apache.struts2.ServletActionContext;

public class FileuploadImpl implements Fileupload {

	@Override
	public void fileupload(File file,String filename) throws FileNotFoundException {
		// TODO Auto-generated method stub
		 InputStream is = new FileInputStream(file);
         String uploadPath = ServletActionContext.getServletContext()
                             .getRealPath("/upload");
         File toFile = new File(uploadPath, filename);
         OutputStream os = new FileOutputStream(toFile);
         byte[] buffer = new byte[8192];
         int length = 0;
         try {
			while(-1 != (length = is.read(buffer, 0, buffer.length)))
			 {
			     os.write(buffer);
			 }
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
         try {
			is.close();
			os.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
         
	}

}

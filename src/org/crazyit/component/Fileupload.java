package org.crazyit.component;

import java.io.File;
import java.io.FileNotFoundException;

public interface Fileupload {
	public void fileupload(File file,String filename) throws FileNotFoundException;
	
}

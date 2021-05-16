package com.james.test;

import java.io.File;
import java.util.Date;

import org.junit.Test;

public class TestFile {

	@Test
	public void testFile(){
		File f = new File("DeptMapper.xml");
		
		long modified = f.lastModified();
		
		Date data = new Date(modified);
		System.out.println(data.toLocaleString());
	}
}

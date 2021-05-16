package com.james.test;

import org.junit.Test;

public class TestString2 {
	
	@Test
	public void testString(){
		String str = "java.html.python";
		
		String[] split = str.split("\\.");
		
		for (String s : split) {
			System.out.println(s);
		}
	}
}

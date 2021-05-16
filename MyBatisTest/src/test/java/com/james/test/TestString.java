package com.james.test;

import org.junit.Test;

public class TestString {
	
	@Test
	public void testString(){
		String str = "abcdefg";
		
//		System.out.println(str.charAt('a'));
		System.out.println(str.indexOf(0));
		
		System.out.println(str.concat("hello"));
		System.out.println(str);
	}
}

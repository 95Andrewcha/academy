package com.academy.common;

import java.text.DecimalFormat;

public class Common {
	
	private static final String DASH = " - ";
	public static final String ACADEMY = "ACADEMY";
	public static final String MY_PAGE = "마이페이지";
	public static final String COMMUNITY = "커뮤니티";
	
	private Common() {}
	
	/**
	 * <b>웹 브라우저 타이틀 칸에 사용할 단어를 만들어준다.</b> <br/>
	 * <p>
	 * 	setTitle("마이페이지", "ACADEMY") = "마이페이지 - ACADEMY" <br/>
	 * 	setTitle("자료게시판", "커뮤니티") = "자료게시판 - 커뮤니티"
	 * </p>
	 * @param
	 * @return String
	 */
	public static String setTitle(String str1, String str2) {
		return str1 + DASH + str2;
	}
	
	/**
	 * <b>숫자 천 단위마다 쉼표를 찍어준다.</b> <br/>
	 * <p>
	 * 	setComma(1000) = "1,000" <br/>
	 * 	setComma(1000000) = "1,000,000"
	 * </p>
	 * @param
	 * @return String
	 */
	public static String setComma(int num) {
		DecimalFormat df = new DecimalFormat("###,###");
		return df.format(num);
	}
}

package com.academy.common;

public class Common {
	
	private static final String ACADEMY = " - ACADEMY";
	
	private Common() {}
	
	/**
	 * <b>웹 브라우저 타이틀 칸에 사용할 단어를 만들어준다.</b> <br/>
	 * <p>
	 * 	<em>
	 * 	setTitle("마이페이지") = "마이페이지 - ACADEMY" <br/>
	 * 	setTitle("자료게시판") = "자료게시판 - ACADEMY"
	 * 	</em>
	 * </p>
	 * @param str
	 * @return
	 */
	public static String setTitle(String str) {
		return str + ACADEMY;
	}
	
}

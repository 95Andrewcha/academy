package com.academy.common.codes;

public enum Title {
	ACADEMY(""),
	
	/**
	 * 자료게시판
	 */
	DATA_BOARD("자료게시판 - " + ACADEMY);
	
	private String kor;
	
	private Title(String kor) {
		this.kor = kor;
	}
	
	/**
	 * 해당 enum을 한글로 변환해주는 메서드
	 * <p>예) Title.DATA_BOARD.getKorean() = <b>자료게시판 - ACADEMY</b></p>
	 * @return 해당 enum을 한글로 변환 후 - ACADEMY를 합친 문자열
	 */
	public String getKorean() {
		return this.kor;
	}
}

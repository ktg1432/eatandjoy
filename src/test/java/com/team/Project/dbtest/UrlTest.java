package com.team.Project.dbtest;

import java.io.UnsupportedEncodingException;

public class UrlTest {

	public static void main(String[] args) throws UnsupportedEncodingException {
		String url = "c:\\upload\\2021\\s_7df3bab3-9651-4e33-99ec-1247a5716baf_시저샐러드_cover.png";
		String durl = java.net.URLDecoder.decode(url, "UTF-8");
		System.out.println("durl :" + durl);
	}

}

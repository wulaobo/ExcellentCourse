package com.cuit.util;

import org.apache.shiro.crypto.hash.Md5Hash;

public class CryptographyUtil {
	
	/**
	 * Md5加密
	 * @param str
	 * @param salt
	 * @return
	 */
	public static String md5(String str,String salt){
		return new Md5Hash(str,salt).toString();
	}
	
}

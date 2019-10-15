package dao;

import work.crypt.SHA256;


public class transSha {
	public String shaPasswd(String passwd) {
		SHA256 sha = new SHA256();
		String orgPasswd="";
		try {
			orgPasswd = sha.getSha256(passwd.getBytes());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return orgPasswd;
	}
}

package svc;

import static db.JdbcUtil.*;
import java.sql.Connection;
import java.util.ArrayList;

import dao.CmtSns;
import dto.Cust_houseinfo;
import dto.Feed;
import dto.Post_house;

public class MyRecommendListService {
	
	public Cust_houseinfo getcustinfo(String cust_id) throws Exception{
		//db커넥과 객체 초기화
		Connection con = getConnection();
		CmtSns sns = CmtSns.getInstance();
		sns.setConnection(con);  
		Cust_houseinfo houseinfo = sns.selectCustinfo(cust_id);
		
		return houseinfo;
	}
	
	public ArrayList<Post_house> gethouseinfo(Cust_houseinfo houseinfo) { 
		Connection con = getConnection();
		CmtSns sns = CmtSns.getInstance();
		sns.setConnection(con);  
		ArrayList<Post_house> alist = sns.gethouseinfo(houseinfo);
		return alist;
	}
	
	public ArrayList<Post_house> getfamilyinfo(Cust_houseinfo houseinfo) { 
		Connection con = getConnection();
		CmtSns sns = CmtSns.getInstance();
		sns.setConnection(con);  
		ArrayList<Post_house> familylist = sns.getfamilyinfo(houseinfo);
		return familylist;
	}
	




}

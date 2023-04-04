package svc;

import static db.JdbcUtil.*;
import java.sql.Connection;
import java.util.ArrayList;

import dao.CmtSns;
import dto.Feed;

public class SnsListService {

	public int getListCount() throws Exception{
		
		//db커넥과 객체 초기화
		int listCount = 0;
		Connection con = getConnection();
		CmtSns sns = CmtSns.getInstance();
		sns.setConnection(con);          
		// dao 패키지에 연결
		listCount = sns.selectListCount();
		close(con);
		return listCount; //return값
		
	}

	public ArrayList<Feed> getArticleList(int page, int limit) throws Exception{
		
		//db커넥과 객체 초기화		
		ArrayList<Feed> articleList = null; 
		Connection con = getConnection();
		CmtSns sns = CmtSns.getInstance();
		sns.setConnection(con);
		
		// dao 패키지에 연결
		articleList = sns.selectArticleList(page,limit);
		// 닫기
		close(con);
		return articleList;
		
	}

}

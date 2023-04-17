package svc;

import java.sql.Connection;
import java.util.ArrayList;

import dao.CmtSns;
import dto.Feed;
import dto.Feed_like;

import static db.JdbcUtil.*;
public class SnsFollowLoginService {
	
	public int getListCount(String cust_id) throws Exception{
		
		//db커넥과 객체 초기화
		int listCount = 0;
		Connection con = getConnection();
		CmtSns sns = CmtSns.getInstance();
		sns.setConnection(con);          
		// dao 패키지에 연결
		listCount = sns.selectFollowCount(cust_id);
		close(con);
		return listCount; //return값
		
	}

	public ArrayList<Feed> registArticle(String cust_id) throws Exception{
		System.out.println("followloginservice 도착");

		ArrayList<Feed> articleList = null;
		Connection con = getConnection(); //JdbcUtil클래스의 싱글톰패턴
		CmtSns sns = CmtSns.getInstance();
		sns.setConnection(con);

		/* feed_like 테이블에서 로그인한 아이디로 좋아요 한 feed_id 가져오기 */
		articleList= sns.selectFollowLogin(cust_id);

		close(con);
		
		return articleList; // 객체 이름부터가 write success했니? 묻고있음 true값을 들고가야 성공
		
	}

}

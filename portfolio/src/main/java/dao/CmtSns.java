package dao;

import static db.JdbcUtil.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.sql.DataSource;

import dto.Feed;

public class CmtSns {

	DataSource ds;
	Connection con;
	private static CmtSns cmtsns;

	private CmtSns() {
	}

	public static CmtSns getInstance(){   //객체 재사용
		if(cmtsns == null){
			cmtsns = new CmtSns();
		}
		return cmtsns;
	}

	public void setConnection(Connection con){
		this.con = con;
	}
	
	public int insertFeed(Feed feed){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int num =0;
		String sql="";
		int insertCount=0;

		try{
			pstmt=con.prepareStatement("select max(feed_id) from feed"); //feed_id는 PK이므로 제일 큰 값을 가져와서 (값이 있으면) 그것보다 1 큰값을 insert
			rs = pstmt.executeQuery();

			if(rs.next())
				num =rs.getInt(1)+1;
			else
				num=1;

			sql="insert into feed (feed_id,cust_id,feed_pics,feed_txt,";
			sql+=" feed_hashtag, pro_id, used_id, market_id, feed_date)"+"values(?,?,?,?,?,?,?,?,now())";
			System.out.println("insert 잘 되어가나요?");
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, feed.getCust_id());  //cust_id를 해야한다
			pstmt.setString(3, feed.getFeed_pics());
			pstmt.setString(4, feed.getFeed_txt());
			pstmt.setString(5, feed.getFeed_hashtag());
			pstmt.setInt(6, 1);
			pstmt.setInt(7, 1);
			pstmt.setInt(8, 1);

			insertCount=pstmt.executeUpdate(); //수행하면 insertCount=1

		}catch(Exception ex){
			System.out.println(ex+"=> insertFeed에서 오류");
		}finally{
			close(rs);
			close(pstmt);
		}

		return insertCount;

	}

	public int selectListCount() {

		int listCount= 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try{
			pstmt=con.prepareStatement("select count(*) from feed");
			rs = pstmt.executeQuery();

			if(rs.next()){
				listCount=rs.getInt(1); //첫번째 값을 listCount에 넣어라 (어차피 하나의 값 밖에 없지만)
			}
		}catch(Exception ex){

		}finally{
			close(rs);
			close(pstmt);
		}

		return listCount;

	}
	
	public ArrayList<Feed> selectArticleList(int page,int limit){
		PreparedStatement pstmt = null;  
		//PreparedStatement를 사용하면 sql문에서 변수값 대신 ? 를 사용할 수 있다 그리고 setString()이나 setInt로 비워둔 부분에 데이터를 넣어줌
		//물음표가 여러개면 여러개 쓰고 key값에 들어가는 숫자는 물음표의 순번
		ResultSet rs = null;
		String board_list_sql="select * from Feed order by feed_date desc limit ?,8";
						// 가장 최근에 작성한 순서대로 시작지점 부터 10개 셀렉 해오기
		ArrayList<Feed> articleList = new ArrayList<Feed>();
		Feed feed = null;
		int startrow=(page-1)*8; 
		//1페이지는 0~7번(8개), 2페이지는 8~15번(8개), 3페이지는 16~23번(8개)

		try{
			pstmt = con.prepareStatement(board_list_sql);
			pstmt.setInt(1, startrow);  // 첫번째 물음표에 넣을 값지정
			rs = pstmt.executeQuery();

			while(rs.next()){
				feed = new Feed();
				feed.setFeed_id(rs.getInt("feed_id"));
				feed.setCust_id(rs.getString("cust_id"));
				feed.setFeed_pics(rs.getString("feed_pics"));
				feed.setFeed_txt(rs.getString("feed_txt"));
				feed.setFeed_date(rs.getString("feed_date"));
				feed.setFeed_hashtag(rs.getString("feed_hashtag"));
				feed.setPro_id(rs.getInt("pro_id"));
				feed.setUsed_id(rs.getInt("used_id"));
				feed.setMarket_id(rs.getInt("market_id"));
				articleList.add(feed);
			}

		}catch(Exception ex){
		}finally{
			close(rs);
			close(pstmt);
		}

		return articleList;

	}
	public int updateReadCount(int feed_id){

		PreparedStatement pstmt = null;
		int updateCount = 0;
		String sql="update board set BOARD_READCOUNT = "+
				"BOARD_READCOUNT+1 where BOARD_NUM = "+feed_id;

		try{
			pstmt=con.prepareStatement(sql);
			updateCount = pstmt.executeUpdate();
		}catch(SQLException ex){
		}
		finally{
			close(pstmt);

		}

		return updateCount;

	}

	public Feed selectArticle(int feed_id){

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Feed feed = null;

		try{
			pstmt = con.prepareStatement(
					"select * from feed where feed_id = ?");
			pstmt.setInt(1, feed_id);
			rs= pstmt.executeQuery();

			if(rs.next()){
				feed = new Feed();
				feed.setFeed_id(rs.getInt("feed_id"));
				feed.setCust_id(rs.getString("cust_id"));
				feed.setFeed_pics(rs.getString("feed_pics"));
				feed.setFeed_txt(rs.getString("feed_txt"));
				feed.setFeed_date(rs.getString("feed_date"));
				feed.setFeed_hashtag(rs.getString("feed_hashtag"));
				feed.setPro_id(rs.getInt("pro_id"));
				feed.setUsed_id(rs.getInt("used_id"));
				feed.setMarket_id(rs.getInt("market_id"));
			}
		}catch(Exception ex){
		}finally{
			close(rs);
			close(pstmt);
		}

		return feed;

	}
	public int deleteArticle(int feed_id){

		PreparedStatement pstmt = null;
		String board_delete_sql="delete from feed where feed_id=?";
		int deleteCount=0;

		try{
			pstmt=con.prepareStatement(board_delete_sql);
			pstmt.setInt(1, feed_id);
			deleteCount=pstmt.executeUpdate();
		}catch(Exception ex){
		}	finally{
			close(pstmt);
		}

		return deleteCount;

	}
	/*
	public int insertArticle(BoardBean article){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int num =0;
		String sql="";
		int insertCount=0;

		try{
			pstmt=con.prepareStatement("select max(board_num) from board");
			rs = pstmt.executeQuery();

			if(rs.next())
				num =rs.getInt(1)+1;
			else
				num=1;

			sql="insert into board (BOARD_NUM,BOARD_NAME,BOARD_PASS,BOARD_SUBJECT,";
			sql+="BOARD_CONTENT, BOARD_FILE, BOARD_RE_REF,"+
					"BOARD_RE_LEV,BOARD_RE_SEQ,BOARD_READCOUNT,"+
					"BOARD_DATE) values(?,?,?,?,?,?,?,?,?,?,now())";
			System.out.println("dfsdf");
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, article.getBOARD_NAME());
			pstmt.setString(3, article.getBOARD_PASS());
			pstmt.setString(4, article.getBOARD_SUBJECT());
			pstmt.setString(5, article.getBOARD_CONTENT());
			pstmt.setString(6, article.getBOARD_FILE());
			pstmt.setInt(7, num);
			pstmt.setInt(8, 0);
			pstmt.setInt(9, 0);
			pstmt.setInt(10, 0);

			insertCount=pstmt.executeUpdate();

		}catch(Exception ex){
		}finally{
			close(rs);
			close(pstmt);
		}

		return insertCount;

	}

	public int insertReplyArticle(BoardBean article){

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String board_max_sql="select max(board_num) from board";
		String sql="";
		int num=0;
		int insertCount=0;
		int re_ref=article.getBOARD_RE_REF();
		int re_lev=article.getBOARD_RE_LEV();
		int re_seq=article.getBOARD_RE_SEQ();

		try{
			pstmt=con.prepareStatement(board_max_sql);
			rs = pstmt.executeQuery();
			if(rs.next())num =rs.getInt(1)+1;
			else num=1;
			sql="update board set BOARD_RE_SEQ=BOARD_RE_SEQ+1 where BOARD_RE_REF=? ";
			sql+="and BOARD_RE_SEQ>?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1,re_ref);
			pstmt.setInt(2,re_seq);
			int updateCount=pstmt.executeUpdate();

			if(updateCount > 0){
				commit(con);
			}

			re_seq = re_seq + 1;
			re_lev = re_lev+1;
			sql="insert into board (BOARD_NUM,BOARD_NAME,BOARD_PASS,BOARD_SUBJECT,";
			sql+="BOARD_CONTENT, BOARD_FILE,BOARD_RE_REF,BOARD_RE_LEV,BOARD_RE_SEQ,";
			sql+="BOARD_READCOUNT,BOARD_DATE) values(?,?,?,?,?,?,?,?,?,?,now())";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, article.getBOARD_NAME());
			pstmt.setString(3, article.getBOARD_PASS());
			pstmt.setString(4, article.getBOARD_SUBJECT());
			pstmt.setString(5, article.getBOARD_CONTENT());
			pstmt.setString(6, ""); //���忡�� ������ ���ε����� ����.
			pstmt.setInt(7, re_ref);
			pstmt.setInt(8, re_lev);
			pstmt.setInt(9, re_seq);
			pstmt.setInt(10, 0);
			insertCount = pstmt.executeUpdate();
		}catch(SQLException ex){
		}finally{
			close(rs);
			close(pstmt);
		}

		return insertCount;

	}

	public int updateArticle(BoardBean article){

		int updateCount = 0;
		PreparedStatement pstmt = null;
		String sql="update board set BOARD_SUBJECT=?,BOARD_CONTENT=? where BOARD_NUM=?";

		try{
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, article.getBOARD_SUBJECT());
			pstmt.setString(2, article.getBOARD_CONTENT());
			pstmt.setInt(3, article.getBOARD_NUM());
			updateCount = pstmt.executeUpdate();
		}catch(Exception ex){
		}finally{
			close(pstmt);
		}

		return updateCount;

	}





	public boolean isArticleBoardWriter(int board_num,String pass){

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String board_sql="select * from board where BOARD_NUM=?";
		boolean isWriter = false;

		try{
			pstmt=con.prepareStatement(board_sql);
			pstmt.setInt(1, board_num);
			rs=pstmt.executeQuery();
			rs.next();

			if(pass.equals(rs.getString("BOARD_PASS"))){
				isWriter = true;
			}
		}catch(SQLException ex){
		}
		finally{
			close(pstmt);
		}

		return isWriter;

	}
	*/

}

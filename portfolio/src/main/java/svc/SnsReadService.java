package svc;

import java.sql.Connection;
import dao.CmtSns;
import dto.Feed;
import static db.JdbcUtil.*;

public class SnsReadService {

	public Feed getArticle(int feed_id) throws Exception{

		Feed feed = null;
		Connection con = getConnection();
		CmtSns consns = CmtSns.getInstance();
		consns.setConnection(con);
		/*조회수 높이기
		 * int updateCount = consns.updateReadCount(feed_id); 
		if(updateCount > 0){
			commit(con);
		}
		else{
			rollback(con);
		}
		*/
		feed = consns.selectArticle(feed_id);
		close(con);
		return feed;
		
	}

}

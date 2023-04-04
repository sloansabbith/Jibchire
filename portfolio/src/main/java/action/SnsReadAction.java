package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.ActionForward;
import dto.Feed;
import svc.SnsReadService;

 public class SnsReadAction implements Action {
	 
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{ 
	   	
		int feed_id=Integer.parseInt(request.getParameter("feed_id")); //고유번호 feed_id 가져오기
		String page = request.getParameter("page");
	System.out.println("readaction도착");
		SnsReadService snsReadService = new SnsReadService();
		Feed feed = snsReadService.getArticle(feed_id);
		ActionForward forward = new ActionForward();
		request.setAttribute("page", page);
	   	request.setAttribute("Feed", feed);
   		forward.setPath("snsRead.jsp");
   		return forward;

	 }
	 
}
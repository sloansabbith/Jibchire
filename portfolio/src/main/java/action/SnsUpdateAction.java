package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.ActionForward;
import dto.Feed;
import svc.SnsReadService;

public class SnsUpdateAction implements Action {
	
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		 
		 	ActionForward forward = new ActionForward();
			int feed_id=Integer.parseInt(request.getParameter("feed_id"));
			SnsReadService snsReadService = new SnsReadService();	
		   	Feed feed =snsReadService.getArticle(feed_id);
		   	request.setAttribute("Feed", feed);
	   		forward.setPath("snsUpdate.jsp");
	   		return forward;
	   		
	 }
	 
}
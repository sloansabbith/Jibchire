package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.ActionForward;

public class BachiMatchCateAction implements Action {
	
 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
	 
	 ActionForward forward = new ActionForward();
	 String category = request.getParameter("category");
	 System.out.println(category);

	 forward.setPath("/bachi/bachi_match_cate.jsp?category="+ category);
	 
	 return forward;
 }
}

package action;

import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dto.ActionForward;
import dto.Feed;
import dto.PageInfo;
import svc.SnsListService;

 public class SnsListAction implements Action {
	 
	 
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		 
		ArrayList<Feed> articleList=new ArrayList<Feed>();
	  	int page=1;
		int limit=8;
		
		//page가 1일경우의 설정이지만, page가 2,3 등등으로 넘어갈때는 page의 값을 앞장에서 넘겨받은 "page"의 값으로 설정한다
		//snsList.jsp에서 2페이지, 3페이지를 각각 클릭할때 a href = ~~.bo?page= ~~ 이런식으로 넘겨줄 것
		if(request.getParameter("page")!=null){ 
			page=Integer.parseInt(request.getParameter("page"));
		}

		
		SnsListService listService = new SnsListService(); 
		int listCount = listService.getListCount();				 // listCount = feed테이블의 행 수
	System.out.println(listCount+"pageInfo에 넣을 값이 잘 나왔나요?");
		articleList = listService.getArticleList(page,limit);
		//페이징을 하는 거의 공식과 같은 
   		int maxPage=(int)((double)listCount/limit+0.95); // 15/10+0.95=2.45, maxPage=2
   		int startPage = (((int) ((double)page / 10 + 0.9)) - 1) * 10 + 1;
   	    int endPage = startPage+10-1;
   	    
   	    /*페이징*/
   		if (endPage> maxPage) endPage= maxPage;
   		
   		PageInfo pageInfo = new PageInfo();
   		pageInfo.setEndPage(endPage);
   		pageInfo.setListCount(listCount);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setPage(page);
		pageInfo.setStartPage(startPage);	
		
		/*snsList.jsp 에서 이 값들을 사용하기 위해서 setAttribute로 객체를 세팅*/
		request.setAttribute("pageInfo", pageInfo);  // "pageInfo"라는 key값에 pageInfo라는 객체를 value값으로 넣음
		request.setAttribute("articleList", articleList);
		
		/*path를 세팅하기 위해 ActionForward class의 객체 생성*/
		ActionForward forward= new ActionForward();
   		forward.setPath("snsList.jsp"); //ActionForward.java 클래스에 setpath메소드에 setting.
   		return forward;
   		
	 }
	 
 }
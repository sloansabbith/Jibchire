package action;

import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dto.ActionForward;
import dto.Cust_houseinfo;
import dto.Feed;
import dto.PageInfo;
import svc.MyRecommendListService;
import svc.SnsListService;

 public class MyRecommendListAction implements Action {
	 
	 
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		 
		ArrayList<Feed> articleList=new ArrayList<Feed>();
		String cust_id= request.getParameter("cust_id");
		/*필요 기능에 따라 메소드 호출
		 * 1. cust_houseinfo에 입력되어 있는 값을 가져와야 함
		 * 2. 그 값을 다시 select문으로 보내야함
		 * 3. select을 여러개해서 각기다른 arraylist에 담아야 함
		 * 4. jsp에서 ~~님의 취향과 동일한 ~~글입니다 & 글 3개 썸네일 * 3세트 ?
		 * 		i) 주거형태 집평수 방개수
		 * 		ii) 가족인원수 가족형태 
		 * 		iii) 집의방향
		 * 		iv) 
		 * 5. 
		 * */
		MyRecommendListService myRecommendListService = new MyRecommendListService(); 
		Cust_houseinfo houseinfo = myRecommendListService.getcustinfo(cust_id);
		myRecommendListService.gethouseinfo(houseinfo);
		
		/*snsList.jsp 에서 이 값들을 사용하기 위해서 setAttribute로 객체를 세팅*/
		request.setAttribute("articleList", articleList);
		
		/*path를 세팅하기 위해 ActionForward class의 객체 생성*/
		ActionForward forward= new ActionForward();
   		forward.setPath("snsList.jsp"); //ActionForward.java 클래스에 setpath메소드에 setting.
   		return forward;
   		
	 }
	 
 }
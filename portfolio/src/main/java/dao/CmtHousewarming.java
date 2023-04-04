package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import dto.Cust_houseinfo;
import dto.Post_house;

public class CmtHousewarming {
	Connection conn = null;
	Statement stmt = null;
	Post_house po = new Post_house();
	ArrayList<Post_house> alist = new ArrayList<Post_house>(); 
	
	public CmtHousewarming() { //라이브러리 접근하기
		try {
			Class.forName("com.mysql.jdbc.Driver");   			 // 드라이버 작업할거야? 라이브러리 불러오겠음 ! 라이브러리 불러오는 건 이 프로젝트 전체에 한 번만 부르면 된다
		}catch(Exception e){
			System.out.println(e+"라이브러리 연결실패");
		}	
	}
	public void conn() {  // 커넥하는 동작
		try {
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/interior?useUnicode=true&characterEncoding=utf8","root","1111"); 
		}catch(Exception e){
			System.out.println(e+"커넥션 연결실패");		
		}
	}
	public void disconn() { // 커넥션, statement 닫기
		try {
			stmt.close();
			conn.close();
		}catch(Exception e) {
			System.out.println(e+"커넥션 닫기 실패");
		}
	}
	public Post_house select_one(int num) { // 게시글 하나 읽는 페이지 
		try {
			conn();
			stmt = conn.createStatement();
			String select = "select*from post_house where post_id ="+num+";";
			ResultSet rs = stmt.executeQuery(select);  //메소드 안에 아직 조건문 넣지 않았음
			if(rs.next()) {
				po.setPost_id(rs.getInt("post_id"));
				po.setCust_id(rs.getString("cust_id"));
				po.setPost_title(rs.getString("post_title"));
				po.setPost_txt(rs.getString("post_txt"));
				po.setPost_house(rs.getString("post_house"));
				
				po.setPost_rooms(rs.getInt("post_rooms"));
				po.setPost_m2(rs.getInt("post_m2"));
				po.setPost_fam(rs.getInt("post_fam"));
				po.setPost_houseold(rs.getInt("post_houseold"));
				po.setPost_budget(rs.getInt("post_budget"));
				
				po.setPost_family(rs.getString("post_family"));
				po.setPost_direc(rs.getString("post_direc"));
				po.setPost_region(rs.getString("post_region"));
				po.setPost_pet(rs.getString("post_pet"));
				po.setPost_startdate(rs.getString("post_startdate"));
				po.setPost_enddate(rs.getString("post_enddate"));
				po.setPost_pics(rs.getString("post_pics"));
				po.setPost_style(rs.getString("post_style"));
				po.setPost_color(rs.getString("post_color"));
			}
			
		}catch(Exception e) {
			System.out.println(e+"select_one() 메소드 오류");
		}finally {
			disconn();
		}
		return po;
	}
	public ArrayList<Post_house> select_all() { // 게시글 메인화면
		try {
			conn();
			stmt = conn.createStatement();
			String select = "select*from post_house;";
			ResultSet rs = stmt.executeQuery(select);  
			while(rs.next()) {
				Post_house po = new Post_house();
				
				po.setPost_id(rs.getInt("post_id"));
				po.setCust_id(rs.getString("cust_id"));
				po.setPost_title(rs.getString("post_title"));
				po.setPost_txt(rs.getString("post_txt"));
				po.setPost_house(rs.getString("post_house"));
				
				po.setPost_rooms(rs.getInt("post_rooms"));
				po.setPost_m2(rs.getInt("post_m2"));
				po.setPost_fam(rs.getInt("post_fam"));
				po.setPost_houseold(rs.getInt("post_houseold"));
				po.setPost_budget(rs.getInt("post_budget"));
				
				po.setPost_family(rs.getString("post_family"));
				po.setPost_direc(rs.getString("post_direc"));
				po.setPost_region(rs.getString("post_region"));
				po.setPost_pet(rs.getString("post_pet"));
				po.setPost_startdate(rs.getString("post_startdate"));
				po.setPost_enddate(rs.getString("post_enddate"));
				// po.setPost_pics(rs.getString("post_pic"));
				po.setPost_style(rs.getString("post_style"));
				po.setPost_color(rs.getString("post_color"));
				
				alist.add(po);
			}
		}catch(Exception e) {
			System.out.println(e+"select_all() 메소드 오류");
		}finally {
			disconn();
		}
		return alist;
	}
	public void insert_board(Post_house po) { // 게시판에서 글 쓴 정보 넣기
		try {
			conn();
			stmt = conn.createStatement();
			String insert = String.format("insert into post_house (post_id,cust_id,post_title,post_txt,post_house,"
					+ "post_rooms,post_m2,post_fam,post_houseold,post_budget,post_family,post_direc,post_region,"
					+ "post_pet,post_startdate,post_enddate,post_pics,post_style,post_color"
					+ ") values(%s,'%s','%s','%s','%s',%s,%s,%s,%s,%s,'%s','%s','%s','%s','%s','%s','%s','%s','%s');", "default","123123",po.getPost_title(),po.getPost_txt(),po.getPost_house(),
					po.getPost_rooms(),po.getPost_m2(),po.getPost_fam(),po.getPost_houseold(),po.getPost_budget(),
					po.getPost_family(),po.getPost_direc(),po.getPost_region(),po.getPost_pet(),po.getPost_startdate(),
					po.getPost_enddate(),po.getPost_pics(),po.getPost_style(),po.getPost_color());
			stmt.executeUpdate(insert);	
		}catch(Exception e){
			System.out.println(e+"insert_board() 메소드에서 오류남");
			
		}finally {
			disconn();
		}		
	}
	public void update_board(Post_house po) { //게시글 수정하는 메소드 
		try {
			conn();
			stmt = conn.createStatement();
			String update = "update post_house set post_title='"+po.getPost_title()+"', post_txt='"+po.getPost_txt()+"',"
					+"post_house='"+po.getPost_house()+"',"+"post_rooms="+po.getPost_rooms()+","+"post_m2="+po.getPost_m2()+","
					+"post_fam="+po.getPost_fam()+","+"post_houseold="+po.getPost_houseold()+","+"post_budget="+po.getPost_budget()+","
					+"post_family='"+po.getPost_family()+"',"+"post_direc='"+po.getPost_direc()+"',"+"post_region='"+po.getPost_region()+"',"
					+"post_pet='"+po.getPost_pet()+"',"+"post_startdate='"+po.getPost_startdate()+"',"+"post_enddate='"+po.getPost_enddate()+"',"
					+"post_pics='"+po.getPost_pics()+"',"+"post_style='"+po.getPost_style()+"',"+"post_color='"+po.getPost_color()+"'"
					+"where post_id="+po.getPost_id()+";";
			stmt.executeUpdate(update);	
		}catch(Exception e){
			System.out.println(e+" update_board() 메소드에서 오류남");
			
		}finally {
			disconn();
		}
	}
	public void insert_houseinfo(Cust_houseinfo cust) { // 고객이 입력한 '집'에 대한 정보를 넣어놓는 테이블
		try {
			conn();
			stmt = conn.createStatement();
			String insert = String.format("insert into Cust_houseinfo (cust_id,cust_house,cust_room,cust_m2,"
					+ "cust_fam,cust_household,cust_family,cust_direc,cust_pet,cust_region"
					+ ") values('%s','%s',%s,%s,%s,%s,'%s','%s','%s','%s');", cust.getCust_id(),cust.getCust_house(),
					cust.getCust_room(),cust.getCust_m2(),cust.getCust_fam(),cust.getCust_household(),
					cust.getCust_family(),cust.getCust_direc(),cust.getCust_pet(),cust.getCust_region() );
			stmt.executeUpdate(insert);	
		}catch(Exception e){
			System.out.println(e+"insert_houseinfo() 메소드에서 오류남");
			
		}finally {
			disconn();
		}		
	}
	public void delete(int del) {
		try {
			conn();
			stmt = conn.createStatement();
			String delete = "delete from post_house where post_id ="+del;
			stmt.executeUpdate(delete);	
		}catch(Exception e){
			System.out.println(e+"delete() 메소드에서 오류남");
			
		}finally {
			disconn();
		}	
	}

}

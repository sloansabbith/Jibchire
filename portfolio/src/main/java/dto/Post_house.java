package dto;

public class Post_house {
	
	// 추가 : 작성일, 그리고 사진 +설명, 사진+설명 이런식으로 가야할 수도 있다
	public int post_id;  //auto increment
	public String cust_id; // cust_info테이블에 이미 들어가있는 데이터여야만 한다는 걸 주의!!!
	public String post_title; //게시글 제목
	public String post_txt;  //게시글 내용
	public String post_txt2;  //게시글 내용
	public String post_txt3;  //게시글 내용
	public String post_txt4;  //게시글 내용
	public String post_house; //주거형태

	public int post_rooms; // 방의 갯수
	public int post_m2;  //집 평수
	public int post_fam; //가족인원수
	public int post_houseold; //집 연식
	public int post_budget; // 예산
	
	public String post_family; //가족형태 (1인가구 등등)
	public String post_direc; //집의 방향
	public String post_region; //지역
	public String post_pet; // char y or n
	public String post_startdate; //공사시작일
	public String post_enddate; //공사마감일
	public String post_style; // 컬러풀,등등
	public String post_color; // 색상 00,00,00,
	public String post_pics; // 이미지 루트?
	public String post_pic2;
	public String post_pic3;
	public String post_pic4;
	public String post_writetime;
	public String bookmark_time;
	public int post_read;
	
	public String post_item10; // 아이템의 사진 이름등록해서 mouse hover 했을 때 해당 상품의 이름과, 가격, 브랜드 등 보일 수 있게 
	public String post_item11;
	public String post_item12;
	public String post_item13;
	public String post_item14;
	public String post_item15;
	
	public String post_item20; 
	public String post_item21;
	public String post_item22;
	public String post_item23;
	public String post_item24;
	
	public String post_item30;
	public String post_item31;
	public String post_item32;
	public String post_item33;
	public String post_item34;
	
	public String post_item40;
	public String post_item41;
	public String post_item42;
	public String post_item43;
	public String post_item44;
	
	public int getPost_id() {
		return post_id;
	}
	public void setPost_id(int post_id) {
		this.post_id = post_id;
	}
	public String getCust_id() {
		return cust_id;
	}
	public void setCust_id(String cust_id) {
		this.cust_id = cust_id;
	}
	public String getPost_title() {
		return post_title;
	}
	public void setPost_title(String post_title) {
		this.post_title = post_title;
	}
	public String getPost_txt() {
		return post_txt;
	}
	public void setPost_txt(String post_txt) {
		this.post_txt = post_txt;
	}
	public String getPost_house() {
		return post_house;
	}
	public void setPost_house(String post_house) {
		this.post_house = post_house;
	}
	public int getPost_rooms() {
		return post_rooms;
	}
	public void setPost_rooms(int post_rooms) {
		this.post_rooms = post_rooms;
	}
	public int getPost_m2() {
		return post_m2;
	}
	public void setPost_m2(int post_m2) {
		this.post_m2 = post_m2;
	}
	public int getPost_fam() {
		return post_fam;
	}
	public void setPost_fam(int post_fam) {
		this.post_fam = post_fam;
	}
	public int getPost_houseold() {
		return post_houseold;
	}
	public void setPost_houseold(int post_houseold) {
		this.post_houseold = post_houseold;
	}
	public int getPost_budget() {
		return post_budget;
	}
	public void setPost_budget(int post_budget) {
		this.post_budget = post_budget;
	}
	public String getPost_family() {
		return post_family;
	}
	public void setPost_family(String post_family) {
		this.post_family = post_family;
	}
	public String getPost_direc() {
		return post_direc;
	}
	public void setPost_direc(String post_direc) {
		this.post_direc = post_direc;
	}
	public String getPost_region() {
		return post_region;
	}
	public void setPost_region(String post_region) {
		this.post_region = post_region;
	}
	public String getPost_pet() {
		return post_pet;
	}
	public void setPost_pet(String post_pet) {
		this.post_pet = post_pet;
	}
	public String getPost_startdate() {
		return post_startdate;
	}
	public void setPost_startdate(String post_startdate) {
		this.post_startdate = post_startdate;
	}
	public String getPost_enddate() {
		return post_enddate;
	}
	public void setPost_enddate(String post_enddate) {
		this.post_enddate = post_enddate;
	}
	public String getPost_pics() {
		return post_pics;
	}
	public void setPost_pics(String post_pics) {
		this.post_pics = post_pics;
	}
	public String getPost_style() {
		return post_style;
	}
	public void setPost_style(String post_style) {
		this.post_style = post_style;
	}
	public String getPost_color() {
		return post_color;
	}
	public void setPost_color(String post_color) {
		this.post_color = post_color;
	}
	public String getPost_pic2() {
		return post_pic2;
	}
	public void setPost_pic2(String post_pic2) {
		this.post_pic2 = post_pic2;
	}
	public String getPost_pic3() {
		return post_pic3;
	}
	public void setPost_pic3(String post_pic3) {
		this.post_pic3 = post_pic3;
	}
	
	public String getPost_pic4() {
		return post_pic4;
	}
	public void setPost_pic4(String post_pic4) {
		this.post_pic4 = post_pic4;
	}
	public String getPost_writetime() {
		return post_writetime;
	}
	public void setPost_writetime(String post_writetime) {
		this.post_writetime = post_writetime;
	}
	public String getBookmark_time() {
		return bookmark_time;
	}
	public void setBookmark_time(String bookmark_time) {
		this.bookmark_time = bookmark_time;
	}
	public String getPost_txt2() {
		return post_txt2;
	}
	public void setPost_txt2(String post_txt2) {
		this.post_txt2 = post_txt2;
	}
	public String getPost_txt3() {
		return post_txt3;
	}
	public void setPost_txt3(String post_txt3) {
		this.post_txt3 = post_txt3;
	}
	public String getPost_txt4() {
		return post_txt4;
	}
	public void setPost_txt4(String post_txt4) {
		this.post_txt4 = post_txt4;
	}
	public int getPost_read() {
		return post_read;
	}
	public void setPost_read(int post_read) {
		this.post_read = post_read;
	}
	public String getPost_item10() {
		return post_item10;
	}
	public void setPost_item10(String post_item10) {
		this.post_item10 = post_item10;
	}
	public String getPost_item11() {
		return post_item11;
	}
	public void setPost_item11(String post_item11) {
		this.post_item11 = post_item11;
	}
	public String getPost_item12() {
		return post_item12;
	}
	public void setPost_item12(String post_item12) {
		this.post_item12 = post_item12;
	}
	public String getPost_item13() {
		return post_item13;
	}
	public void setPost_item13(String post_item13) {
		this.post_item13 = post_item13;
	}
	public String getPost_item14() {
		return post_item14;
	}
	public void setPost_item14(String post_item14) {
		this.post_item14 = post_item14;
	}
	public String getPost_item15() {
		return post_item15;
	}
	public void setPost_item15(String post_item15) {
		this.post_item15 = post_item15;
	}
	public String getPost_item20() {
		return post_item20;
	}
	public void setPost_item20(String post_item20) {
		this.post_item20 = post_item20;
	}
	public String getPost_item21() {
		return post_item21;
	}
	public void setPost_item21(String post_item21) {
		this.post_item21 = post_item21;
	}
	public String getPost_item22() {
		return post_item22;
	}
	public void setPost_item22(String post_item22) {
		this.post_item22 = post_item22;
	}
	public String getPost_item23() {
		return post_item23;
	}
	public void setPost_item23(String post_item23) {
		this.post_item23 = post_item23;
	}
	public String getPost_item24() {
		return post_item24;
	}
	public void setPost_item24(String post_item24) {
		this.post_item24 = post_item24;
	}
	public String getPost_item30() {
		return post_item30;
	}
	public void setPost_item30(String post_item30) {
		this.post_item30 = post_item30;
	}
	public String getPost_item31() {
		return post_item31;
	}
	public void setPost_item31(String post_item31) {
		this.post_item31 = post_item31;
	}
	public String getPost_item32() {
		return post_item32;
	}
	public void setPost_item32(String post_item32) {
		this.post_item32 = post_item32;
	}
	public String getPost_item33() {
		return post_item33;
	}
	public void setPost_item33(String post_item33) {
		this.post_item33 = post_item33;
	}
	public String getPost_item34() {
		return post_item34;
	}
	public void setPost_item34(String post_item34) {
		this.post_item34 = post_item34;
	}
	public String getPost_item40() {
		return post_item40;
	}
	public void setPost_item40(String post_item40) {
		this.post_item40 = post_item40;
	}
	public String getPost_item41() {
		return post_item41;
	}
	public void setPost_item41(String post_item41) {
		this.post_item41 = post_item41;
	}
	public String getPost_item42() {
		return post_item42;
	}
	public void setPost_item42(String post_item42) {
		this.post_item42 = post_item42;
	}
	public String getPost_item43() {
		return post_item43;
	}
	public void setPost_item43(String post_item43) {
		this.post_item43 = post_item43;
	}
	public String getPost_item44() {
		return post_item44;
	}
	public void setPost_item44(String post_item44) {
		this.post_item44 = post_item44;
	}

	
	

}

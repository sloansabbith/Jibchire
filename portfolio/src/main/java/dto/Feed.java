package dto;

public class Feed {
	public int feed_id;
	public String cust_id;
	public String feed_pics;
	public String feed_txt;
	public String feed_date; //글작성일
	public String feed_hashtag;
	public int pro_id;  //제품번호
	public int used_id; //중고거래 후기
	public int market_id; //고수 마켓 후기
	
	public int getFeed_id() {
		return feed_id;
	}
	public void setFeed_id(int feed_id) {
		this.feed_id = feed_id;
	}
	public String getCust_id() {
		return cust_id;
	}
	public void setCust_id(String cust_id) {
		this.cust_id = cust_id;
	}
	public String getFeed_pics() {
		return feed_pics;
	}
	public void setFeed_pics(String feed_pics) {
		this.feed_pics = feed_pics;
	}
	public String getFeed_txt() {
		return feed_txt;
	}
	public void setFeed_txt(String feed_txt) {
		this.feed_txt = feed_txt;
	}
	public String getFeed_date() {
		return feed_date;
	}
	public void setFeed_date(String feed_date) {
		this.feed_date = feed_date;
	}
	public String getFeed_hashtag() {
		return feed_hashtag;
	}
	public void setFeed_hashtag(String feed_hastag) {
		this.feed_hashtag = feed_hastag;
	}
	public int getPro_id() {
		return pro_id;
	}
	public void setPro_id(int pro_id) {
		this.pro_id = pro_id;
	}
	public int getUsed_id() {
		return used_id;
	}
	public void setUsed_id(int used_id) {
		this.used_id = used_id;
	}
	public int getMarket_id() {
		return market_id;
	}
	public void setMarket_id(int market_id) {
		this.market_id = market_id;
	}
	
}

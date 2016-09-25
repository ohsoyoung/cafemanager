package jdpcJava;

public class CafeStorage {

	private String id;
	private String name;
	private String tell;
	private String pw;
	private String intro;
	private String address;
	private int tableNum;
	
	public CafeStorage(){}
	
	public CafeStorage(String id, String name, String pw, String tell, String intro, String address, int tableNum){
		this.id = id;
		this.name = name;
		this.pw = pw;
		this.tell = tell;
		this.intro = intro;
		this.address = address;
		this.tableNum = tableNum;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	//�옄�룞移댁슫�듃
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getTell() {
		return tell;
	}
	public void setTell(String tell) {
		this.tell = tell;
	}
	
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	
	public String getIntro(){
		return intro;
	}
	public void setIntro(String intro){
		this.intro = intro;
	}
	//移댄럹�냼媛�
	
	public String getAddress(){
		return address;
	}
	public void setAddress(String address){
		this.address = address;
	}
	
	public int getTableNum(){
		return tableNum;
	}
	public void setTableNum(int tableNum){
		this.tableNum = tableNum;
	}
	
	public String toString(){
		String rslt = "";
		
		rslt += "id:" + getId() + ", ";
		rslt += "name:" + getName() + ", ";
		rslt += "tell:" + getTell();
		
		return rslt;
	}
	
}

package jdpcJava;

public class CafeTableStorage {

	private String id;
	private int tableSitu;
	private int tableSeq;
	
	public CafeTableStorage(){
		
	}

	public CafeTableStorage(String id, int tableSeq, int tableSitu){
		this.id = id;
		this.tableSitu = tableSitu;
		this.tableSeq = tableSeq;
	}
	
	
	public CafeTableStorage(String id, int tableSitu){
		this.id = id;
		this.tableSitu = tableSitu;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	public int getTableSeq(){
		return tableSeq;
	}
	public void setTableSeq(int tableSeq){
		this.tableSeq = tableSeq;
	}
	
	public int getTableSitu() {
		return tableSitu;
	}
	public void setTableSitu(int tableSitu) {
		this.tableSitu = tableSitu;
	}
	
	
}

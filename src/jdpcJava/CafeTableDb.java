package jdpcJava;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Scanner;

public class CafeTableDb {

	Scanner scan = new Scanner(System.in);

	String DRIVER1 = "org.mariadb.jdbc.Driver";
	//String DRIVER1 = "com.mysql.jdbc.Driver";
//	String DRIVER2 = "org.git.mm.mysql.Driver";
	String DBURL = "jdbc:mysql://localhost:3306/cafe";
	//String USERID = "bttb";
	//String PW = "bttb6232";
	String USERID = "root";
	String PW = "";
	Statement st = null;
	ResultSet rs = null;
	Connection con = null;
	PreparedStatement ps = null;
	
	public CafeTableDb(){
		try{
			Class.forName(DRIVER1);
			con = DriverManager.getConnection(DBURL, USERID, PW);
			System.out.println("DB �꽦怨듭쟻 �뿰寃�");
		
		} catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public void dbClose(){
		try{
			if(rs != null)
				rs.close();
			if(st != null)
				st.close();
		} catch(SQLException e){
			e.printStackTrace();
		}
	}
	
	public int cafeTableInfoInsert(CafeTableStorage cts, int tableNum){
		int result = 0;
		
		try{
			for(int i = 1; i <= tableNum; i++){
				String query = "INSERT INTO cafeTable (ID, tableSeq, tableSitu) values(?, ?, ?)";
				ps = con.prepareStatement(query);
				
				ps.setString(1, cts.getId());
				ps.setInt(2, i);
				ps.setInt(3, 0);
				
				result = ps.executeUpdate();
			}
			
			
		} catch(Exception e){
			System.out.println(e + "=> cafeInfo insert fail");
		}finally{
			dbClose();
		}
		
		return result;
	}
	
	public int seqInitalize (){
		String query = "alter table cafeTable auto_increment=1";
		int result = 0;
		
		try {
			ps = con.prepareStatement(query);
			result = ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e + "=> sequence initialize fail");
		}
		
		return result;
	}
	
	public void tableSituUpdate (String id, int tableSeq, int tableSitu){
		String query = "update cafeTable set tableSitu='" + tableSitu + "' where ID='" + id + "' and tableSeq='" + tableSeq + "'";
		try{
			st.executeUpdate(query);
		} catch(Exception e){
			System.out.println(e + "=> tableSitu update fail");
		}
	}
	
	public int getTableSitu(CafeStorage cafe){
		
		ArrayList<CafeTableStorage> list = new ArrayList<>();
		int ts = 0;
		try{		
			String query = "SELECT * FROM cafeTable where ID = '" + cafe.getId() + "'";
			System.out.println("getTableSitu query = " + query);
			st = con.createStatement();
			rs = st.executeQuery(query);
			System.out.println("getTableSitu st, rs");
			
			while(rs.next()){
				CafeTableStorage c = new CafeTableStorage();
				
				c.setId(rs.getString(1));
				System.out.println("getTableSitu 1111");
				c.setTableSitu(rs.getInt(4));
				System.out.println("getTableSitu 3333");
				
				list.add(c);
			}
			for(int i = 0; i < list.size(); i++){
				ts += list.get(i).getTableSitu();
			}
		} catch(Exception e){
			System.out.println(e + "=> get cafeTableInfo list fail");
		} finally{
			dbClose();
		}
		
		return ts;
	}
}

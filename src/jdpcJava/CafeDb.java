package jdpcJava;

import java.util.Scanner;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class CafeDb {
	
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
	
	public CafeDb(){
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
	
	public int cafeInfoInsert(CafeStorage cs){
		int result = 0;
		
		try{
			String query = "INSERT INTO cafeInfo values(?, ?, ?, ?, ?, ?, ?)";
			
			ps = con.prepareStatement(query);
			ps.setString(1, cs.getId());
			ps.setString(2, cs.getName());
			ps.setString(3, cs.getPw());
			ps.setString(4, cs.getTell());
			ps.setString(5, cs.getIntro());
			ps.setString(6, cs.getAddress());
			ps.setInt(7, cs.getTableNum());
			
			result = ps.executeUpdate();
		} catch(Exception e){
			System.out.println(e + "=> cafeInfo insert fail");
		}finally{
			dbClose();
		}
		
		return result;
	}
	
	public ArrayList<CafeStorage> getCafeInfo(String field, String key){
		
		ArrayList<CafeStorage> list = new ArrayList<>();
		
		try{		
			String query = "SELECT * FROM cafeInfo where " + field + " like '%" + key + "%'";
			System.out.println("정상");
			st = con.createStatement();
			rs = st.executeQuery(query);
			
			while(rs.next()){
				CafeStorage c = new CafeStorage();
				
				c.setId(rs.getString(1));
				c.setName(rs.getString(2));
				c.setPw(rs.getString(3));
				c.setTell(rs.getString(4));
				c.setIntro(rs.getString(5));
				c.setAddress(rs.getString(6));
				c.setTableNum(rs.getInt(7));
				
				list.add(c);
			}
		} catch(Exception e){
			System.out.println(e + "=> get cafeInfo list fail");
		} finally{
			dbClose();
		}
		
		return list;
	}
	
	public ArrayList<CafeStorage> getAllCafeInfo(){
		
		ArrayList<CafeStorage> list = new ArrayList<>();
		
		try{		
			String query = "SELECT * FROM cafeInfo";
			st = con.createStatement();
			rs = st.executeQuery(query);
			
			while(rs.next()){
				CafeStorage c = new CafeStorage();
				
				c.setId(rs.getString(1));
				c.setName(rs.getString(2));
				c.setPw(rs.getString(3));
				c.setTell(rs.getString(4));
				c.setIntro(rs.getString(5));
				c.setAddress(rs.getString(6));
				c.setTableNum(rs.getInt(7));
				
				list.add(c);
			}
		} catch(Exception e){
			System.out.println(e + "=> get cafeInfo list fail");
		} finally{
			dbClose();
		}
		
		return list;
	}
	
	
	public CafeStorage getCafeDetailInfo(String field, String key){
		CafeStorage c = new CafeStorage();
		
		try{		
			String query = "SELECT * FROM cafeInfo where " + field + " = '" + key + "'";
			System.out.println("aaaaa: "+query);
			st = con.createStatement();
			rs = st.executeQuery(query);
			System.out.println("st, rs");
			rs.next();
/*			System.out.println("rs.getString(0)" + rs.getString(0));*/
			System.out.println("rs.getString(1)" + rs.getString(1));
			System.out.println("rs.getString(2)" + rs.getString(2));
			System.out.println("rs.getString(3)" + rs.getString(3));
			System.out.println("rs.getString(4)" + rs.getString(4));
			System.out.println("rs.getString(5)" + rs.getString(5));
			c.setId(rs.getString(1));
			c.setName(rs.getString(2));
			System.out.println("111,222");
			c.setPw(rs.getString(3));
			c.setTell(rs.getString(4));
			System.out.println("333,444");
			c.setIntro(rs.getString(5));
			c.setAddress(rs.getString(6));
			System.out.println("555,666");
			c.setTableNum(rs.getInt(7));
			System.out.println("7777");
				
		} catch(Exception e){
			System.out.println(e + "=> get cafeInfo list fail");
		} finally{
			dbClose();
		}
		
		return c;
	}
	
}

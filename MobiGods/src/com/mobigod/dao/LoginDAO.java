package com.mobigod.dao;

import java.sql.Connection;
import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.ArrayList;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mobigod.beans.LoginBean;
import com.mobigod.beans.CompanyBean;
import com.mobigod.dao.DBDAO;

public class LoginDAO {
	static Connection con = null;
	static PreparedStatement pst = null;
	static PreparedStatement pstmt = null;
	static PreparedStatement stmt = null;
	static ResultSet rs = null;
	static boolean flag = false;
	static int check = 0;
	static int c_id=0;

	// ----------
	/**
	 *
	 * @author:Ashwin Menon
	 * @see:DBDAO
	 * @version:1.0
	 * @param:Nothing
	 */

	public static Connection getDbConnection() throws SQLException {

		try {
			DBDAO.connect();
			con = DBDAO.getDbCon();

		} catch (ClassNotFoundException ex) {
			ex.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return con;
	}

	// -------------
	/**
	 *
	 * @author:Ashwin Menon
	 * @see:getDbConnection()
	 * @version:1.0
	 * @param:LoginBean
	 */
	public static int loginUser(LoginBean loginbean) {
		try {
			con = getDbConnection();
			pst = con.prepareStatement("select l_id,l_role from tbl_login where l_uname=? AND l_pass=?");
			pst.setString(1, loginbean.getUname());
			pst.setString(2, loginbean.getUpass());
			rs = pst.executeQuery();
			while (rs.next()) {
				loginbean.setId(rs.getInt(1));
				if (rs.getString(2).equals("company") || rs.getString(2).equals("Company")) {
					
					check = 1;
				} else if (rs.getString(2).equals("user")) {
					check = 2;
				} else
					check = 3;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return check;
	}
	
	public static int getCompanyId(LoginBean loginbean) {
		 
		try {
			con = getDbConnection();
			pst = con.prepareStatement("select u_id from tbl_login where l_uname=? AND l_pass=?");
			pst.setString(1, loginbean.getUname());
			pst.setString(2, loginbean.getUpass());
			rs = pst.executeQuery();
			while (rs.next()) {
				c_id=rs.getInt(1);
				System.out.println("Login:::::"+c_id);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("Login Return"+c_id);
		return c_id;
	}

	// ----------
	/**
	 *
	 * @author:Ashwin Menon
	 * @see:getDbConnection()
	 * @version:1.0
	 * @param:LoginBean
	 */
	public static ArrayList<CompanyBean> productViewCompany(CompanyBean companyBean) {
		ArrayList<CompanyBean> eb = new ArrayList<CompanyBean>();
		try {
			con = getDbConnection();
			pst = con.prepareStatement("select * from tbl_product where c_id=? ");
			pst.setInt(1, companyBean.getC_id());
			rs = pst.executeQuery();
			while (rs.next()) {
				CompanyBean com = new CompanyBean();
				com.setId(rs.getInt(1));
				com.setC_id(rs.getInt(2));
				com.setName(rs.getString(3));
				com.setPrice(rs.getInt(4));
				com.setOffer(rs.getInt(5));
				com.setUp_price(rs.getInt(6));
				eb.add(com);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return eb;

	}

	public static ArrayList<CompanyBean> reportViewCompany(CompanyBean companyBean) {
		ArrayList<CompanyBean> eb = new ArrayList<CompanyBean>();
		try {
			con = getDbConnection();
			pst = con.prepareStatement(
					"select * from tbl_updt where u_date between to_date('"+companyBean.getF_date()+"','yyyy/mm/dd') AND to_date('"+companyBean.getL_date()+"','yyyy/mm/dd') AND U_C_ID=? ");
			pst.setInt(1, companyBean.getC_id());
			// pst.setString(2, companyBean.getL_date());
			rs = pst.executeQuery();
			System.out.println("******************:" + rs);
			while (rs.next()) {
				CompanyBean company = new CompanyBean();
				System.out.println("while");
				company.setId(rs.getInt(1));
				company.setC_id(rs.getInt(2));
				company.setP_name(rs.getString(3));
				company.setPrice(rs.getInt(4));
				company.setType(rs.getString(5));
				company.setO_date(rs.getString(6));
				eb.add(company);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("-------------" + eb);
		return eb;

	}

	public static int countProduct(LoginBean loginBean) {
		int i = 0;
		try {
			con = getDbConnection();
			pst = con.prepareStatement("select count(*) from tbl_product where c_id=?");
			pst.setInt(1, loginBean.getId());
			rs = pst.executeQuery();
			while (rs.next()) {
				i = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return i;

	}

	public static int countOrder(LoginBean loginBean) {
		int i = 0;
		try {
			con = getDbConnection();
			pst = con.prepareStatement("select count(*) from tbl_orders where O_C_ID=? AND O_DATE=SYSDATE");
			pst.setInt(1, loginBean.getId());
			rs = pst.executeQuery();
			while (rs.next()) {
				i = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return i;

	}

	public static int addOffer(CompanyBean companyBean) {
		int i = 0;
		java.util.Date now = new java.util.Date();
		java.sql.Date sqlDate = new java.sql.Date(now.getTime());
		try {
			con = getDbConnection();
			int p_offer = companyBean.getOffer();
			int p_price = companyBean.getPrice();
			int updated_price = p_price - ((p_offer * p_price) / 100);
			pst = con.prepareStatement("update tbl_product set p_offer=?,p_o_price=? where p_product=? ");
			pst.setInt(1, p_offer);
			pst.setInt(2, updated_price);
			pst.setString(3, companyBean.getP_name());
			i = pst.executeUpdate();
			pstmt=con.prepareStatement("insert into tbl_updt(U_C_ID,U_P_NAME,U_UPDATE_AMOUNT,U_UPDATE_TYPE,U_DATE) values(?,?,?,?,?)");
			pstmt.setInt(1, companyBean.getC_id());
			pstmt.setString(2, companyBean.getP_name());
			pstmt.setInt(3,updated_price);
			pstmt.setString(4, "Offer");
			pstmt.setDate(5, sqlDate);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return i;
	}

	public static int updateProduct(CompanyBean companyBean) {
		int i = 0;
		int upPrice = 0;
		String mark = "";
		java.util.Date now = new java.util.Date();
		java.sql.Date sqlDate = new java.sql.Date(now.getTime());
		try {
			con = getDbConnection();
			mark = companyBean.getMark();
			if (mark.equals("markup")) {
				upPrice = companyBean.getPrice() + companyBean.getUp_price();
			} else {
				upPrice = companyBean.getPrice() - companyBean.getUp_price();
			}
			pst = con.prepareStatement("update tbl_product set p_price=? where p_product=?");
			pst.setInt(1, upPrice);
			pst.setString(2, companyBean.getP_name());
			i = pst.executeUpdate();
			pstmt=con.prepareStatement("insert into TBL_UPDT(U_C_ID,U_P_NAME,U_UPDATE_AMOUNT,U_UPDATE_TYPE,U_DATE) values(?,?,?,?,?)");
			pstmt.setInt(1, companyBean.getC_id());
			pstmt.setString(2, companyBean.getP_name());
			pstmt.setInt(3,upPrice);
			pstmt.setString(4, "MarkUp/Down");
			pstmt.setDate(5,sqlDate);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return i;
	}

	public static int deleteProduct(CompanyBean companyBean) {
		int i = 0;
		try {
			con = getDbConnection();
			pst = con.prepareStatement("delete from tbl_product where p_id=?");
			pst.setInt(1, companyBean.getId());
			pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return i;
	}

	public static int launchProduct(CompanyBean companyBean) {
		int i = 0;
		try {
			con = getDbConnection();
			pst = con.prepareStatement("insert into tbl_product(c_id,p_product,P_PRICE,P_DESC) values(?,?,?,?)");
			pst.setInt(1, companyBean.getC_id());
			pst.setString(2, companyBean.getP_name());
			pst.setInt(3, companyBean.getPrice());
			pst.setString(4, companyBean.getDesc());
			pst.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return i;
	}

	public static int insertCompany(LoginBean loginBean) {
		int i = 0;
		int uId=0;
		try {
			con = getDbConnection();
			pst = con.prepareStatement(
					"insert into tbl_company(c_name,c_hq,C_PHONE,C_REG_STATUS,C_EMAIL) values(?,?,?,?,?)");
			pst.setString(1, loginBean.getCname());
			pst.setString(2, loginBean.getChq());
			pst.setString(3, loginBean.getPhone());
			pst.setString(4, loginBean.getReg_status());
			pst.setString(5, loginBean.getEmail());
			pst.executeUpdate();
			stmt=con.prepareStatement("select c_id from tbl_company where c_email=?");
			stmt.setString(1,loginBean.getEmail());
			rs=stmt.executeQuery();
			while(rs.next()){
				 uId=rs.getInt(1);
			}
			pstmt = con.prepareStatement("insert into tbl_login(L_UNAME,L_PASS,L_ROLE,U_ID) values(?,?,'Company',?)");
			pstmt.setString(1, loginBean.getEmail());
			pstmt.setString(2, loginBean.getUpass());
			pstmt.setInt(3,uId);
			i = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return i;
	}

	public static int checkStatus(LoginBean loginBean) {
		int status = 0;
		try {
			con = getDbConnection();
			pst = con.prepareStatement("select C_REG_STATUS from tbl_company where C_EMAIL=?");
			pst.setString(1, loginBean.getUname());
			System.out.println(loginBean.getUname());
			rs = pst.executeQuery();

			while (rs.next()) {
				if (rs.getString(1).equals("Approved")) {
					status = 1;
				} else {
					status = 0;
				}
			}
		} catch (Exception e) {

		}
		return status;
	}
	public static String dateGenerate(){

		String date=null;
		String val=null;
		try{
		date= new SimpleDateFormat("yyyy/mm/dd").format(Calendar.getInstance().getTime());
		if(date.length()>2){
		val=date.substring(4,6);
		}
		}catch(Exception e){
		e.printStackTrace();
		}
		return val;



		}

}

package DB;

import java.io.*;
import java.sql.*;
import java.util.*;
import DB.DBvar;

public class DBlist {
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	String sql;

	public int insertmember(DBvar dv) {// ȸ������ insert�ϴ� �κ�
		int result = 0;

		try {
			String sql = "insert into member values(?,?,?,?)";

			System.out.println("sql = " + sql);

			// System.out.println("1");
			con = databases.getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dv.getName());
			// System.out.println("2");
			pstmt.setString(2, dv.getId());
			// System.out.println("3");
			pstmt.setString(3, dv.getEmail());
			// System.out.println("4");
			pstmt.setString(4, dv.getPsw());
			// System.out.println("5");
			pstmt.executeUpdate();

			result = 1;

		} catch (SQLException se) {
			System.out.println(se.getMessage());
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (SQLException se) {
				System.out.println(se.getMessage());
			}
		}
		return result;
	}

	public int checkid(DBvar dv) throws Exception {// ȸ�����Կ��� ���̵� �ߺ�üũ �ϴ� �κ�
		int x = -1;
		try {
			con = databases.getCon();// DBĿ�ؼǿ���
			sql = "select id from member where id = ?";
			pstmt = con.prepareStatement(sql);
			System.out.println("checkid sql ->" + sql);
			pstmt.setString(1, dv.getId());
			//System.out.println(dv.getId());
			rs = pstmt.executeQuery();
			// System.out.println("checkid->rstmt.executeQuery()��");

			if (rs.next()) {
				System.out.println("rs.next()��");
				x = 1;
				// msg="�� �̹� ������� ���̵� �Դϴ�.\n �ٸ� ���̵� �����ϼ���";
			} else {
				System.out.println("rs.next()�ȵ�.");
				x = -1;
				// msg="�� ����Ͻ� �� �ִ� ���̵��Դϴ�.";
			}
		} catch (Exception ex) {
			ex.printStackTrace();
			System.out.println("checkid ���� ����");
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (SQLException se) {
				System.out.println(se.getMessage());
			}
		}
		return x;
	}

	public String FindPsw(DBvar dv) {// ��й�ȣ ã�� �ϴ� �κ�
	
		String checkpsw = "nofindpsw";
		try {
			String sql = "select psw from member where name=? and id=?";
			// �̸��� ���̵� �Է��Ͽ� ��й�ȣ ã�� sql��

			System.out.println("sql = " + sql);

			System.out.println("1");
			con = databases.getCon();
			pstmt = con.prepareStatement(sql);
			System.out.println("sql ->" + sql);
			pstmt.setString(1, dv.getName());
			pstmt.setString(2, dv.getId());
			System.out.println("dv.get??()Ȯ��");
			
			rs = pstmt.executeQuery();
			System.out.println("rs : " + rs);

			while(rs.next()) {
				checkpsw = rs.getString("psw");
				System.out.println("rs.next()����!!");
			}
		} catch (SQLException se) {
			System.out.println(se.getMessage());
			System.out.println("try �� ����!");
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (SQLException se) {
				System.out.println(se.getMessage());
			}
		}
		return checkpsw;
	}

	public ArrayList<String> Asurvey(DBvar dv) {// ������ ����� DBlist�� mood ���� �η��ͼ� �´��� Ȯ��
		
		ArrayList<String> result = new ArrayList<>();
		
		try {
			String sql_1 = "select image from result_list where area=? and mood=? and nature=? and activity=?";
			System.out.println("Asurvey -> " + sql_1);
			con = databases.getCon();
			pstmt = con.prepareStatement(sql_1);
			System.out.println("Asurvey�� con -> " + pstmt);
			rs = pstmt.executeQuery();
			
			
			pstmt.setString(1, dv.getLocation());
			pstmt.setString(2, dv.getMood());
			pstmt.setString(3, dv.getNature());
			pstmt.setString(4, dv.getActivity());

			System.out.println("query : " + pstmt.toString());
			
			System.out.println("Asurvey�� rs : " + rs);
			
			while(rs.next()) {
				//result.add(rs.getString("country"));
			}

		} catch (SQLException se) {
			System.out.println(se.getMessage());
			System.out.println("DB try ������~");
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (SQLException se) {
				System.out.println(se.getMessage());
			}
		}
		return result;
		
	}
	/*
	public String Insertreview(DBvar dv) {
		String result=null;
		try {
			String sql = "insert into reviews values(?,?,?,?,?,?,?,?)";

			System.out.println("sql = " + sql);

			// System.out.println("1");
			con = databases.getCon();
			pstmt = con.prepareStatement(sql);			

		} catch (SQLException se) {
			System.out.println(se.getMessage());
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (SQLException se) {
				System.out.println(se.getMessage());
			}
		}
		return result;
	}
	*/
	/*
	public String ShowAllreview(DBvar dv) {
		String result=null;
		
		try {
			String sql = "select review from reviews";
			System.out.println("ShowAllreview -> " + sql);
			con = databases.getCon();
			pstmt = con.prepareStatement(sql);
			System.out.println("ShowAllreview�� con -> " + pstmt);
		}catch (SQLException se) {
			System.out.println(se.getMessage());
			System.out.println("DB try ������~");
		}finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (SQLException se) {
				System.out.println(se.getMessage());
			}
		}
		
		return result;
	}
	*/
	/*
	public String Myreview(DBvar dv) {
		String result="noreview";
		
		try {
			String sql = "select review from reviews where id=?";
			System.out.println("Myreview�� sql -> "+sql);
			con=databases.getCon();
			pstmt=con.prepareStatement(sql);
			System.out.println("Myreview�� con->"+pstmt);
			
			pstmt.setString(1, dv.getReview());
			
			rs = pstmt.executeQuery();
			System.out.println("rs : " + rs);
			while(rs.next()) {
				result = rs.getString("review");
				System.out.println("rs.next()����!!");
			}
		}catch (SQLException se) {
			System.out.println(se.getMessage());
			System.out.println("DB try ������~");
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (SQLException se) {
				System.out.println(se.getMessage());
			}
		}
		return result;
	}
	*/
}
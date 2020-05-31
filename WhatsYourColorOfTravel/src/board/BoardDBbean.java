package board;

import java.sql.*;
//議곌굔 : �뾽�뜲�씠�듃�� �씤�꽌�듃�븯�뒗 荑쇰━臾몄씠 �엳�쓣 寃쎌슦 寃곌낵媛� result 瑜� 由ы꽩�븯�뿬 �빖�뱾留곹븳�떎.
import java.util.*;
import javax.naming.NamingException;

import board.BoardBean;

public class BoardDBbean {
	Connection conn;
	PreparedStatement pstmt;
	String sql;
	ResultSet rs;
	
	public BoardDBbean() {

	}
	
	public Connection getConn() throws SQLException, NamingException {
		conn = DBconnection.getConnection();
		return conn;
	}
	
	public int insertBoard(BoardBean bd) {
		int result = 0;
		int ref = 0;
		try {
			sql = "select max(ref) from tblboard group by ref";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ref = rs.getInt(1);
			}
			bd.setRef(ref+1);
			sql = "insert into tblboard values (?, ?, ?, date_format(NOW(), '%Y%m%d%H%i%s'), ?, ?, ?, 0, ?, 0, 0, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, 0);
			pstmt.setString(2, bd.getWriter());
			pstmt.setString(3, bd.getPass());
			pstmt.setString(4, bd.getEmail());
			pstmt.setString(5, bd.getSubject());
			pstmt.setString(6, bd.getContent());
			pstmt.setInt(7, bd.getRef());
			pstmt.setString(8, bd.getIp());
			pstmt.executeUpdate();
			result = 1;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return result;
	}
	
	public BoardBean readBoard(int num) {
		BoardBean bd = new BoardBean();
		sql = "select * from tblboard where num = " + num;
		try {			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			bd = new BoardBean();
			while(rs.next()) {				
				bd.setNum(rs.getInt(1));
				bd.setWriter(rs.getString(2));
				bd.setPass(rs.getString(3));
				bd.setRegdate(rs.getString(4));
				bd.setEmail(rs.getString(5));
				bd.setSubject(rs.getString(6));
				bd.setContent(rs.getString(7));
				bd.setReadcnt(rs.getInt(8));
				bd.setRef(rs.getInt(9));
				bd.setRef_step(rs.getInt(10));
				bd.setRe_level(rs.getInt(11));				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return bd;
	}
	
	public int getBoardCount() {
		int total = 0;
		sql = "select count(num) from tblboard";
		try {			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();		
			while(rs.next()) {				
				total = rs.getInt(1);				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return total;
	}
	
	public Vector<BoardBean> selectBoard() {
		sql = "select num, writer, subject, regdate, readcnt, re_level from tblboard order by ref desc, ref_step"; 
		Vector<BoardBean> boardList = new Vector<BoardBean>();
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BoardBean bd = new BoardBean();
				bd.setNum(rs.getInt(1));
				bd.setWriter(rs.getString(2));
				bd.setSubject(rs.getString(3));
				bd.setRegdate(rs.getString(4));
				bd.setReadcnt(rs.getInt(5));
				bd.setRe_level(rs.getInt(6));
				boardList.add(bd);
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("寃뚯떆臾� 寃��깋 �삤瑜�");
		}
		return boardList;
	}
	
	public int updateReadcnt(int num) {
		int result = 0;
		sql = "update tblboard set readcnt = readcnt+1 where num = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			result = 1;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	
	public int upReply(int ref, int ref_step) {
		int result = 0;
		sql = "update tblboard set ref_step = ref_step+1 where ref= ? and ref_step > ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ref);
			pstmt.setInt(2, ref_step);
			pstmt.executeUpdate();
			result = 1;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	
	public int replyBoard(BoardBean bd) {
		int result = 0;
		int ref_step = bd.getRef_step() + 1;
		int re_level = bd.getRe_level() + 1;
		sql = "insert into tblboard (num, writer, email, subject, content, ref, ref_step, re_level, regdate, pass, ip)"
				+ "values (?, ?, ?, ?, ?, ?, ?, ?, date_format(NOW(), '%Y%m%d%H%i%s'), ?, ?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, 0);
			pstmt.setString(2, bd.getWriter());
			pstmt.setString(3, bd.getEmail());
			pstmt.setString(4, bd.getSubject());
			pstmt.setString(5, bd.getContent());
			pstmt.setInt(6, bd.getRef());
			pstmt.setInt(7, ref_step);
			pstmt.setInt(8, re_level);
			pstmt.setString(9, bd.getPass());
			pstmt.setString(10, bd.getIp());
			pstmt.executeUpdate();
			result = 1;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// �젙�긽 �벑濡� 寃쎌슦 result = 1
		return result;
	}
	
	public int checkPass(int num, String pass) {
		int result = 0;
		String isPass = "";
		sql = "select pass from tblboard where num =?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				isPass = rs.getString(1);
			}
			if(!(pass.equals(""))) {
				if(pass.equals(isPass)) result = 1;
				else result = 2;
			} else 
				result = 3;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	
	public int updateBoard(BoardBean bd) {
		int result = 0;
		sql = "update tblboard set pass=?, email=?, content=? where num =?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bd.getPass());
			pstmt.setString(2, bd.getEmail());
			pstmt.setString(3, bd.getContent());
			pstmt.setInt(4, bd.getNum());
			pstmt.executeUpdate();
			result = 1;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	
	public int deleteBoard(int num) {
		int result = 0;
		int ref, re_level = 0;
		sql = "select ref, re_level from tblboard where num = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ref = rs.getInt("ref");
				re_level = rs.getInt("re_level");
				if(re_level == 0) {
					sql = "delete from tblboard where ref = ?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, ref);
					pstmt.executeUpdate();
					result = 1;
					
				} else {
					
					// select num from tblboard where ref = ? and re_level >= ? order by ref_step;
					sql = "delete from tblboard where num = ? or (ref = ? and re_level >= ?)";
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, num);
					pstmt.setInt(2, ref);
					pstmt.setInt(3, re_level);
					pstmt.executeUpdate();
					result = 1;
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
}

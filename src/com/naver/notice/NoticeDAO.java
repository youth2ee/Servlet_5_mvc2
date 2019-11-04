package com.naver.notice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


public class NoticeDAO {

	//noticeList 글목록
	public ArrayList<NoticeDTO> noticeList(Connection con) throws Exception {
		ArrayList<NoticeDTO> ar = new ArrayList<NoticeDTO>();
		NoticeDTO noticeDTO = null;
		
		String sql = "select * from notice order by num desc";
		PreparedStatement st = con.prepareStatement(sql);
		ResultSet rs = st.executeQuery();
		
		while(rs.next()) {
			noticeDTO = new NoticeDTO();
			noticeDTO.setNum(rs.getInt(1));
			noticeDTO.setTitle(rs.getString(2));
			noticeDTO.setWriter(rs.getString(3));
			noticeDTO.setContents(rs.getString(4));
			noticeDTO.setReg_date(rs.getDate(5));
			noticeDTO.setHit(rs.getInt(6));
			
			ar.add(noticeDTO);
		}
		
		rs.close();
		st.close();
		
		return ar;
	}
	
	//noticeSelect 글하나보기
	public NoticeDTO noticeSelect(Connection con, int num) throws Exception {
		NoticeDTO noticeDTO = null;
		
		String sql = "select * from notice where num=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, num);
		
		ResultSet rs = st.executeQuery();
		
		if(rs.next()) {
			noticeDTO = new NoticeDTO();
			noticeDTO.setNum(rs.getInt(1));
			noticeDTO.setTitle(rs.getString(2));
			noticeDTO.setWriter(rs.getString(3));
			noticeDTO.setContents(rs.getString(4));
			noticeDTO.setReg_date(rs.getDate(5));
			noticeDTO.setHit(rs.getInt(6));
		}
		
		rs.close();
		st.close();
		
		return noticeDTO;
	}
	
	//noticeWrite : insert 글쓰기
	public int noticeWrite(Connection con, NoticeDTO noticeDTO) throws Exception {
		int result = 0;
		
		String sql = "insert into notice values (notice_seq.nextval,?,?,?,sysdate,0)";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, noticeDTO.getTitle());
		st.setString(2, noticeDTO.getWriter());
		st.setString(3, noticeDTO.getContents());
		
		result = st.executeUpdate();
		
		st.close();
		
		return result;
	}
	
	//noticeUpdate update 글수정
	public int noticeUpdate(Connection con, NoticeDTO noticeDTO) throws Exception {
		int result = 0;
		
		String sql = "update notice set title=?, contents=? where num=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, noticeDTO.getTitle());
		st.setString(2, noticeDTO.getContents());
		st.setInt(3, noticeDTO.getNum());
		
		result = st.executeUpdate();
		
		st.close();
		
		return result;
	}
	
	//noticeDelete delete 글삭제
	public int noticeDelete(Connection con, int num) throws Exception {
		int result = 0;
		
		String sql = "delete notice where num=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, num);
		
		result = st.executeUpdate();
		
		st.close();
		
		return result;
	}
	
}

package com.naver.notice;

import java.sql.Connection;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.naver.action.ActionFoward;
import com.naver.util.DBConnector;

public class NoticeService {
	private NoticeDAO noticeDAO;
	
	public NoticeService() {
		noticeDAO = new NoticeDAO();
	}
	
	public ActionFoward noticeList(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();
		try {
			Connection con = DBConnector.getConnection();
			ArrayList<NoticeDTO> ar = noticeDAO.noticeList(con);
			con.close();
			
			request.setAttribute("list", ar);
			
			actionFoward.setFlag(true);
			actionFoward.setPath("./noticeList.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return actionFoward;
	}
	
	public ActionFoward noticeSelect(HttpServletRequest request, HttpServletResponse response) {
		//DAO 보내기 전 전처리 작업
		//DAO 호출 후 후처리 작업
		ActionFoward actionFoward = new ActionFoward();
		
		try {
			Connection con = DBConnector.getConnection();
			int num = Integer.parseInt(request.getParameter("num"));
			NoticeDTO noticeDTO = noticeDAO.noticeSelect(con, num);
			
			if(noticeDTO!=null) {
				request.setAttribute("dto", noticeDTO);
				actionFoward.setFlag(true);
				actionFoward.setPath("./noticeSelect.jsp");
			} else {
				actionFoward.setFlag(false);
				actionFoward.setPath("./noticeList.notice");
			}
			con.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	
		return actionFoward;
	}
	
	
	public ActionFoward noticeWrite(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();
		
		String method = request.getMethod();
		System.out.println(method);
		
		if(method.equals("POST")) {
			try {
				Connection con = DBConnector.getConnection();
				NoticeDTO noticeDTO = new NoticeDTO();
				
				noticeDTO.setTitle(request.getParameter("title"));
				noticeDTO.setWriter(request.getParameter("writer"));
				noticeDTO.setContents(request.getParameter("contents"));
				int result = noticeDAO.noticeWrite(con, noticeDTO);

				con.close();
				
				String msg = "실패";
				if(result > 0) {
					msg = "성공";
					request.setAttribute("msg", msg);
					request.setAttribute("path", "./noticeList.notice");
					RequestDispatcher view = request.getRequestDispatcher("../common/common_result.jsp");
					view.forward(request, response);
				}else {
					request.setAttribute("msg", msg);
					request.setAttribute("path", "./noticeList.notice");
					RequestDispatcher view = request.getRequestDispatcher("../common/common_result.jsp");
					view.forward(request, response);
				}

			} catch (Exception e) {
			}

		} else {
			actionFoward.setFlag(true);
			actionFoward.setPath("./noticeWrite.jsp");			
		}
		
		return actionFoward;
	}

}

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
			//foward로 찍을꺼면 true
			actionFoward.setPath("./noticeList.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return actionFoward;
	}
	
	public ActionFoward noticeSelect(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();
		
		try {
			Connection con = DBConnector.getConnection();
			int num = Integer.parseInt(request.getParameter("num"));
			NoticeDTO noticeDTO = noticeDAO.noticeSelect(con, num);
			
			if(noticeDTO!=null) {
				request.setAttribute("dto", noticeDTO);
				actionFoward.setFlag(true);
				actionFoward.setPath("./noticeSelect.jsp");
				//포워드 foward : 바로 jsp로 간다. 포워드일때 jsp거쳐서 client로 가므로 .jsp를 써줘야한다.
			} else {
				actionFoward.setFlag(false);
				actionFoward.setPath("./noticeList.notice");
				//리다이렉트 redirect : noticeList는 배열값을 받아야 하므로 service에서 noticeList를 거쳐야 한다. 
				//따라서 controller를 통해 다시 들어가 줘야 한다. 따라서 .notice를 써서 리다이렉트로 주소를 받은
				//클라이언트가 컨트롤러controller로 들어올수있는 주소인 .notice를 써줘야한다.
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

	public ActionFoward noticeUpdate(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();

		String method = request.getMethod();
		if(method.equals("POST")) { //post는 수정창을 넘긴다음을 받는다.
			try {
				Connection con = DBConnector.getConnection();
				NoticeDTO noticeDTO = new NoticeDTO();

				noticeDTO.setTitle(request.getParameter("title"));
				noticeDTO.setContents(request.getParameter("contents"));
				noticeDTO.setNum(Integer.parseInt(request.getParameter("num")));
				int result = noticeDAO.noticeUpdate(con, noticeDTO);
				
				actionFoward.setFlag(true);
				actionFoward.setPath("../common/common_result.jsp");
				request.setAttribute("path", "./noticeList.notice");
				
				con.close();

				String msg = "실패";
				if(result > 0) {
					msg = "성공";
				}
				request.setAttribute("msg", msg);
			} catch (Exception e) {
			}

		}else { //get이면 일단 수정창이 뜬다 
			int num = Integer.parseInt(request.getParameter("num"));
			try {
				Connection con = DBConnector.getConnection();
				NoticeDTO noticeDTO = noticeDAO.noticeSelect(con, num);
				request.setAttribute("dto", noticeDTO);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			actionFoward.setFlag(true);
			actionFoward.setPath("./noticeUpdate.jsp");
		}
		return actionFoward;
	}
}

package com.naver.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.naver.action.ActionFoward;
import com.naver.notice.NoticeService;


@WebServlet("/NoticeController")
public class NoticeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private NoticeService noticeService;
       
    public NoticeController() {
        super();
        noticeService = new NoticeService();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String url = request.getServletPath();
		url = url.substring(url.lastIndexOf("/")+1, url.lastIndexOf("."));
		ActionFoward actionFoward = null; 
		
		if(url.equals("noticeList")) {
			actionFoward = noticeService.noticeList(request, response);
		} else if (url.equals("noticeSelect")) {
			actionFoward = noticeService.noticeSelect(request, response);
		} else if(url.equals("noticeWrite")) {
			actionFoward = noticeService.noticeWrite(request, response);
		} else if(url.equals("noticeUpdate")) {
			actionFoward = noticeService.noticeUpdate(request, response);
		}
		
		if(actionFoward.isFlag()) {
			//true면 foward
			RequestDispatcher view = request.getRequestDispatcher(actionFoward.getPath());
			view.forward(request, response);
		} else {
			//false면 redirect
			response.sendRedirect(actionFoward.getPath());
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

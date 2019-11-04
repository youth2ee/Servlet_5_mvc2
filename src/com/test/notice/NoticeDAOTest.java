package com.test.notice;

import static org.junit.Assert.*;

import java.sql.Connection;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

import com.naver.notice.NoticeDAO;
import com.naver.util.DBConnector;

public class NoticeDAOTest {
	private NoticeDAO noticeDAO;
	private Connection con;
	
	public NoticeDAOTest() {
		noticeDAO = new NoticeDAO();
	}
	
	
	//@BeforeClass
	public static void beforeClass() {
		System.out.println("Before Class");
	}
	//모든 @Test가 실행되기 전 딱 한번만 실행된다.
	
	//@AfterClass
	public static void afterClass() {
		System.out.println("after Class");
	}
	//모든 @Test가 실행된 후 딱 한번만 실행된다.
	
	//@Before
	public void before() throws Exception {
		System.out.println("before");
		con = DBConnector.getConnection();
		con.setAutoCommit(false); //db에는 넣지말자
	}
	//@Test 실행전에 반드시 한번 실행된다.
	
	//@After
	public void after() throws Exception {
		System.out.println("after");
		//con.commit();
		con.rollback();
		con.setAutoCommit(true);
		//순서주의 : 취소 rollback하고 자동커밋 auto commit해줘야 한다.
		
		con.close();
	}
	//@Test 실행 후에 반드시 한번 실행된다.
	
	@Test
	public void listTest() throws Exception {
		noticeDAO.noticeList(con);
	}
	


}

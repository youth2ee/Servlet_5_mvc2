package com.test.util;

import static org.junit.Assert.*;

import java.sql.Connection;

import org.junit.Test;

import com.naver.util.DBConnector;

public class DBconnectorTest {

	@Test
	public void test() throws Exception {
		Connection con = DBConnector.getConnection();
		
		assertNotNull(con);
	}
	
	

}

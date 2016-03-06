package com.srccodes.example;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.*;
import java.sql.*;

/**
 * Servlet implementation class Transportation
 */
@WebServlet("/HelloWorld")
public class Transportation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Transportation() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter printWriter = response.getWriter();
		
		Connection conn = null;
		String error_msg = "";
		ResultSet rset = null;
		
		int topic = Integer.valueOf(request.getParameter("flag"));
		printWriter.println(topic);
		try{
			Class.forName("org.postgresql.Driver");
			conn = DriverManager.getConnection("jdbc:postgresql://128.59.17.200:5432/lsde","jiayu","dvmm32123");
			Statement stmt = conn.createStatement();
			rset = stmt.executeQuery("select location_lat, location_long from jams where level = "+ topic + ";");
			//rset = stmt.executeQuery("select location_lat, location_long from jams where level = 5;");
			if(rset != null) {
				while (rset.next()) {
					printWriter.println(rset.getString(1));
					printWriter.println(rset.getString(2));
					//printWriter.print("hahahaha");
				}
			}
		}catch (SQLException e) {
			error_msg = e.getMessage(); 
			printWriter.print(error_msg);
			if( conn != null ) {
				//conn.close();
				}
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		//response.setContentType("text/html");
		//printWriter.println("hei hei hei");
		// TODO Auto-generated method stub
		
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

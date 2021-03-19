package com.web_five.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public interface MainCommand {
	
	public void execute(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws ServletException, IOException;
}
	
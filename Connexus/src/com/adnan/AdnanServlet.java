package com.adnan;

import java.io.IOException;
import javax.servlet.http.*;


// APT: not related to connexus, just a hello world exercise
@SuppressWarnings("serial")
public class AdnanServlet extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		resp.setContentType("text/plain");
		resp.getWriter().println("Hello, world");
	}
}

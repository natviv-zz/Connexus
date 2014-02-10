package com.adnan;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.*;

import static com.adnan.OfyService.ofy;


// APT: part of my warmup exercise, ignore this class
@SuppressWarnings("serial")
public class ImageUploadTestServlet extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		resp.setContentType("text/plain");
		resp.getWriter().println("Hello, world from image upload test!");
		resp.getWriter().println(req.getQueryString());
		Greeting greeting = new Greeting("Adnan", "Killjoy was here!");
		ofy().save().entity(greeting).now();
		List<Greeting> th = ofy().load().type(Greeting.class).list();
		resp.getWriter().println(th);
		Greeting g = ofy().load().type(Greeting.class).id(4644337115725824L).get();
		resp.getWriter().println(g);
	}
}

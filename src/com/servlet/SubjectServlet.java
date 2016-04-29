package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.service.SubjectService;

import net.sf.json.JSONObject;
import sample.util.IOUtil;

/**
 * Servlet implementation class VerifySubjectServlet
 */
public class SubjectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SubjectServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		SubjectService service = new SubjectService();
		String type = request.getParameter("type");
		if ("check".equals(type)) {
			response.setContentType("text/plain;charset=utf-8");
			PrintWriter out = response.getWriter();
			JSONObject object = new JSONObject();
			/*String uString = IOUtil.readJSONString(request);
			JSONObject jsonObject = JSONObject.fromObject(uString);
			JSONObject object = new JSONObject();
			System.out.println(object);
			String subjectName = (String) jsonObject.get("subjectName");*/
			String subjectName =URLDecoder.decode(request.getParameter("subjectName"),"UTF-8");
			
			try {
				if (service.verity(subjectName)) {
					object.put("code", "1");
				}else {
					object.put("code", "0");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			out.write(object.toString());
			return;

		}else if ("add".equals(type)) {
			
			response.setContentType("text/plain;charset=utf-8");
			PrintWriter out = response.getWriter();
			JSONObject object = new JSONObject();
			String subjectName =URLDecoder.decode(request.getParameter("subjectName"),"UTF-8");
			try {
				service.add(subjectName);
				object.put("code", "1");
			} catch (Exception e) {
				// TODO: handle exception
				object.put("code", "0");
			}
			out.write(object.toString());
			return;
			
		}else if ("update".equals(type)) {
			
			
		}else if ("get".equals(type)) {
			
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

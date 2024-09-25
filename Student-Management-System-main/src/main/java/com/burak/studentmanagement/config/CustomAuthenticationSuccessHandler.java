package com.burak.studentmanagement.config;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;
import com.burak.studentmanagement.entity.Student;
import com.burak.studentmanagement.entity.Teacher;
import com.burak.studentmanagement.service.StudentService;
import com.burak.studentmanagement.service.TeacherService;

@Component
public class CustomAuthenticationSuccessHandler implements AuthenticationSuccessHandler {
	
	@Autowired
	private StudentService studentService;
	
	@Autowired
	private TeacherService teacherService;
	
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication auth) throws IOException, ServletException {
		
		
		String role = auth.getAuthorities().iterator().next().toString();
		
		//redirecting the user to proper url depending on the authority
		if(role.equals("ROLE_STUDENT")) {
			String userName = auth.getName();
			Student theStudent = studentService.findByStudentName(userName);
			int userId = theStudent.getId(); //student id is a part of the url to get the current student in the controller class 
			HttpSession session = request.getSession();
			session.setAttribute("user", theStudent);
			response.sendRedirect(request.getContextPath() + "/student/" + userId + "/courses");
			
		} else if(role.equals("ROLE_TEACHER")) {
			String userName = auth.getName();
			Teacher theTeacher = teacherService.findByTeacherName(userName);
			int userId = theTeacher.getId();
			HttpSession session = request.getSession();
			session.setAttribute("user", theTeacher);
			response.sendRedirect(request.getContextPath() + "/teacher/" + userId + "/courses");
		} else { //if the role is admin
			response.sendRedirect(request.getContextPath() + "/admin/adminPanel");
		}

	}

//	
//	@Override
//	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
//	        Authentication auth) throws IOException, ServletException {
//
//	    String role = auth.getAuthorities().iterator().next().toString();
//	    System.out.println("Authenticated role: " + role);
//	    
//	    if (role.equals("ROLE_STUDENT")) {
//	        String userName = auth.getName();
//	        System.out.println("Username: " + userName);
//	        Student theStudent = studentService.findByStudentName(userName);
//	        
//	        if (theStudent == null) {
//	            System.out.println("Student not found for username: " + userName);
//	            response.sendRedirect(request.getContextPath() + "/error");
//	            return;
//	        }
//	        
//	        int userId = theStudent.getId();
//	        System.out.println("Redirecting to: /student/" + userId + "/courses");
//	        HttpSession session = request.getSession();
//	        session.setAttribute("user", theStudent);
//	        response.sendRedirect(request.getContextPath() + "/student/" + userId + "/courses");
//
//	    } else if (role.equals("ROLE_TEACHER")) {
//	        String userName = auth.getName();
//	        System.out.println("Username: " + userName);
//	        Teacher theTeacher = teacherService.findByTeacherName(userName);
//	        
//	        if (theTeacher == null) {
//	            System.out.println("Teacher not found for username: " + userName);
//	            response.sendRedirect(request.getContextPath() + "/error");
//	            return;
//	        }
//	        
//	        int userId = theTeacher.getId();
//	        System.out.println("Redirecting to: /teacher/" + userId + "/courses");
//	        HttpSession session = request.getSession();
//	        session.setAttribute("user", theTeacher);
//	        response.sendRedirect(request.getContextPath() + "/teacher/" + userId + "/courses");
//
//	    } else { // Admin role
//	        System.out.println("Redirecting admin to: /admin/adminPanel");
//	        response.sendRedirect(request.getContextPath() + "/admin/adminPanel");
//	    }
//	}
}


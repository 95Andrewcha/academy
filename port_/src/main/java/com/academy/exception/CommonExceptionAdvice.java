package com.academy.exception;

import org.springframework.http.HttpStatus;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.NoHandlerFoundException;

@ControllerAdvice
public class CommonExceptionAdvice {

	@ExceptionHandler(Exception.class)
	public String exception(Exception ex, Model model) {
		/* System.out.println("Exceoptn......." + ex.getMessage()); */
		
		model.addAttribute("exception", ex);
		System.out.println("model:" + model);
		
		return "error_page";
	}
	
@ExceptionHandler(NoHandlerFoundException.class)
@ResponseStatus(HttpStatus.NOT_FOUND)
public String handle404(NoHandlerFoundException ex) {
	
	return "custom404";
}
}

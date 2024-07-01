//package com.one.view.controller;
//
//import org.springframework.http.HttpStatus;
//import org.springframework.web.bind.annotation.ControllerAdvice;
//import org.springframework.web.bind.annotation.ExceptionHandler;
//import org.springframework.web.servlet.ModelAndView;
//
//@ControllerAdvice
//public class ErrorHandleController {
//	
//	@ExceptionHandler(value = Exception.class)
//    public ModelAndView handleException(Exception e) {
//		ModelAndView modelAndView = new ModelAndView();
//        modelAndView.setViewName("redirect:/main.jsp"); 
//        modelAndView.setStatus(HttpStatus.INTERNAL_SERVER_ERROR);
//        return modelAndView;
//    }
//}

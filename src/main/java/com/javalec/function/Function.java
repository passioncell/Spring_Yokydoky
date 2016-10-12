package com.javalec.function;

import java.util.Enumeration;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
@Service
public class Function {

	@SuppressWarnings({"rawtypes", "unchecked"})
	public Map<String, Object> parseMap(HttpServletRequest request) {
		
		Map parameterMap = new HashMap();
		System.out.println("request : " +request );
		Enumeration enums = request.getParameterNames();
		System.out.println("enums : " + enums);
		while (enums.hasMoreElements()) {
			String paramName = (String) enums.nextElement();
			String[] parameters = request.getParameterValues(paramName);
			// Parameter가 배열일 경우
			if (parameters.length > 1) {
				parameterMap.put(paramName, parameters);
				// Parameter가 배열이 아닌 경우
			} else {
				parameterMap.put(paramName, parameters[0]);
			}
		}
		return parameterMap;
	}
	
}

package com.javalec.function;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

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
			// Parameter�� �迭�� ���
			if (parameters.length > 1) {
				parameterMap.put(paramName, parameters);
				// Parameter�� �迭�� �ƴ� ���
			} else {
				parameterMap.put(paramName, parameters[0]);
			}
		}
		return parameterMap;
	}
	
	public List<String> extractText(List<Map<String, Object>> articleList, String rate) {
		
		List<String> resultList = new ArrayList<String>();
		
		if(rate != "1"){
			for(int i = 0; i < articleList.size(); i++){
				String rawContent = articleList.get(i).get("content").toString();
				String[] tmpList1 = rawContent.split("<symbol2>");
				int articleLength = Math.round((tmpList1.length * (Float.parseFloat(rate)/100)));
				
				HashMap map = new HashMap();
				String[] tmpList2 =null;
				for(int j=0; j< tmpList1.length; j++){ 
					tmpList2 = tmpList1[j].split("<symbol1>");
					
					if(tmpList2[0].contains("News") ||tmpList2[0].contains("com") || tmpList2[0].contains("동아닷컴")||tmpList2[0].contains("【서울=뉴시스】")||tmpList2[0].contains("사진제공")){
						continue;
					}
					tmpList2[0] = tmpList2[0].replace("$", "");
					
					map.put(tmpList2[0],tmpList2[1]);  //Float.parseFloat(tmpList2[1]));
					
				}
				
				//map에 있는 하나의 기사 정렬 후 add
				TreeMap<String, String> treeMapReverse = new TreeMap<String, String>(Collections.reverseOrder());
			    treeMapReverse.putAll(map);
			 
		        Iterator<String> treeMapReverseIter = treeMapReverse.keySet().iterator();
		        
		        HashMap tmpMap = new HashMap();
//		        while( treeMapReverseIter.hasNext()) {
		        for(int k=0; k<articleLength; k++){
		            String key = treeMapReverseIter.next();
		            String value = treeMapReverse.get( key );
		            tmpMap.put(value,key);	 
		            
		        }
		        
		        Iterator<String> tmpMap2 = tmpMap.keySet().iterator();
		        Iterator<String> tmpMap3 = map.keySet().iterator();
		        String result = "";
		        
		        while(tmpMap3.hasNext()){
		        	String key2 = tmpMap3.next();
		        	//반복자 초기화
		        	
		        	tmpMap2 = tmpMap.keySet().iterator();
		        	while( tmpMap2.hasNext() ){
		        		String key1 = tmpMap2.next();		        		
//		        		System.out.println("key1 : "+ tmpMap.get(key1));
//		        		System.out.println("key2 : "+ key2);		        		
		        		if(key2 == tmpMap.get(key1)){
		        			result = result +  key2 + ". ";
		        		}
		        	}
		        }
		        
		        resultList.add(result);
		        
			}
		// 생성 요약일때
		}else{
			
		}	
		return resultList;
	}
	
}

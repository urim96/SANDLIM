package com.one.san.util;

import java.util.HashMap;


import org.json.simple.JSONObject;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;


public class PhoneVerification {

   private String phno;
   
   public PhoneVerification(String phno) {
      this.phno = phno;
   }
   
   public void phoneVerfMethod(String random, String api_key, String api_secret) {
      
     Message coolsms = new Message(api_key, api_secret);
   
     HashMap<String, String> set = new HashMap<String, String>();
   
     String phno2 = phno.replace("-", "");
   
     set.put("to", phno2); // 수신번호
     set.put("from", "01083818803"); // 발신번호
     set.put("text", "[산들림] 회원가입 인증 번호는 [" + random + "] 입니다."); // 문자내용
     set.put("type", "sms"); // 문자 타입
   
     try {
        JSONObject result = coolsms.send(set); // 보내기&전송결과받기
            
         } catch (CoolsmsException e) {
            
            
         }
   }

}
package com.rice.common;

import java.net.URI;
import java.net.URISyntaxException;
 
import com.rice.common.KakaoPayApprovalVO;
import com.rice.common.KakaoPayReadyVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;
 
 
@Service
public class KakaoPay {
	String item_name=null;
	Integer total_amount=null;
	String partner_order_id = null;
    private static final String HOST = "https://kapi.kakao.com";
    
    @Autowired
    KakaoPayReadyVO kakaoPayReadyVO;
    KakaoPayApprovalVO kakaoPayApprovalVO;
    
    public String kakaoPayReady(KakaoPayApprovalVO kakaoPayApprovalVO,AmountVO amountVO) {
//    	System.out.println("카카오자바 kakaoPayApprovalVO: "+kakaoPayApprovalVO);
    	item_name= kakaoPayApprovalVO.getItem_name();
//    	System.out.println("카카오자바 amountVO : "+amountVO.toString());
    	total_amount= amountVO.getTotal_amount();
    	partner_order_id = kakaoPayApprovalVO.getPartner_order_id();
        RestTemplate restTemplate = new RestTemplate();
       // System.out.println("kakaoPayReady(1)");
        // 서버로 요청할 Header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK " + "15b6257bc5be453a5083e39de1cce08a");
        headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
        
        // 서버로 요청할 Body
        MultiValueMap<String, Object> params = new LinkedMultiValueMap<String, Object>();
      //  System.out.println("입력1");
        params.add("cid", "TC0ONETIME");
        params.add("partner_order_id", partner_order_id);
        params.add("partner_user_id", "gorany");
        params.add("item_name", item_name);
        params.add("quantity", "1");
        params.add("total_amount", total_amount);
        params.add("tax_free_amount", "100");
        params.add("approval_url", "http://52.14.195.150:8080/kakaoPaySuccess");
        params.add("cancel_url", "http://52.14.195.150:8080/kakaoPayCancel");
        params.add("fail_url", "http://52.14.195.150:8080/kakaoPaySuccessFail");
       // System.out.println("kakaoPayReady(2)");
 
         HttpEntity<MultiValueMap<String, Object>> body = new HttpEntity<MultiValueMap<String, Object>>(params, headers);
         //System.out.println("body : "+body);
         //System.out.println("kakaoPayReady(입력2)");
 
        try {
            kakaoPayReadyVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/ready"), body, KakaoPayReadyVO.class);
            //System.out.println("kakaoPayReadyVO : "+ kakaoPayReadyVO);
           // System.out.println("kakaoPayReady(3)");
            //System.out.println("주소 : "  + kakaoPayReadyVO.getNext_redirect_pc_url());
            return kakaoPayReadyVO.getNext_redirect_pc_url();
 
        } catch (RestClientException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (URISyntaxException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
        return "/pay";
        
    }
    
    public KakaoPayApprovalVO kakaoPayInfo(String pg_token) {
    	//System.out.println("kakaoPayReady(4)");
        RestTemplate restTemplate = new RestTemplate();
 
        // 서버로 요청할 Header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK " + "15b6257bc5be453a5083e39de1cce08a");
        headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
        //System.out.println("kakaoPayReady(5)");
        // 서버로 요청할 Body
        MultiValueMap<String, Object> params = new LinkedMultiValueMap<String, Object>();
        params.add("cid", "TC0ONETIME");
        params.add("tid", kakaoPayReadyVO.getTid());
        params.add("partner_order_id", partner_order_id);
        params.add("partner_user_id", "gorany");
        params.add("pg_token", pg_token);
        params.add("total_amount", total_amount);
        //System.out.println("kakaoPayReady(6)");
        HttpEntity<MultiValueMap<String, Object>> body = new HttpEntity<MultiValueMap<String, Object>>(params, headers);
        
        try {
            kakaoPayApprovalVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/approve"), body, KakaoPayApprovalVO.class);
          System.out.println("kakaoPayApprovalVO : "+kakaoPayApprovalVO);
            return kakaoPayApprovalVO;
        
        } catch (RestClientException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (URISyntaxException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
        return null;
    }
    
}
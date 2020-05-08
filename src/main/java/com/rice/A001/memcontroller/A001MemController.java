package com.rice.A001.memcontroller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rice.A001.memservice.A001MemService;
import com.rice.A001.memvo.A001MemVO;
import com.rice.M001.mailservice.M001MailService;

@Controller
@RequestMapping("/member/*")
public class A001MemController { 
	private static final Logger logger = LoggerFactory.getLogger(A001MemController.class);
	
	@Autowired
	private A001MemService a001MemService;
	@Autowired 
	private M001MailService mailService;


	// GET 濡쒓렇�씤, 濡쒓렇�씤 �럹�씠吏� �씠�룞
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String getLogin(Model model, HttpServletRequest request, HttpServletResponse response) {
		logger.info("get login");
		return "Alogin";
	}
	
	// POST 濡쒓렇�씤, 濡쒓렇�씤 check 
	@RequestMapping(value = "/loginPost", method = RequestMethod.POST)
	public String postLogin(A001MemVO vo, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		logger.info("post loginPost");
		HttpSession session = request.getSession();
		
		A001MemVO login = null;
		login = a001MemService.login(vo);
		
		if(login == null) {	// 濡쒓렇�씤 �떎�뙣
			logger.info("login fail");
			session.setAttribute("loginMem", null);
			model.addAttribute("loginMsg", "false");
			return "redirect:/member/login";		
		} else {		// 濡쒓렇�씤 �꽦怨�
			logger.info("login ok");
			session.setAttribute("loginMem", login);
		}
		
		return "redirect:/";
	}
	
	// GET 濡쒓렇�븘�썐, 濡쒓렇�븘�썐 �썑 硫붿씤�럹�씠吏� �씠�룞
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String getLogout(Model model, HttpServletRequest request, HttpServletResponse response) {
		logger.info("get logout");
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:/";
	}
	
	// GET Account �쉶�썝媛��엯 �꽑�깮
	@RequestMapping(value = "/account", method = RequestMethod.GET)
	public String account(Model model, HttpServletRequest request, HttpServletResponse response) {
		logger.info("get account");
		return "Aaccount";
	}
	
	// �쉶�썝媛��엯 GET, �쉶�썝媛��엯 �럹�씠吏� �씠�룞
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public String getSignup(Model model, HttpServletRequest request, HttpServletResponse response) {
		logger.info("get signup");
		return "Asignup";
	}

	// �쉶�썝媛��엯 POST, �쉶�썝媛��엯 �떆�룄
	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public String postSignup(A001MemVO vo,Model model, HttpServletRequest request, HttpServletResponse response) {
		logger.info("post signup");
		try {
			a001MemService.signup(vo);
			model.addAttribute("signupMsg", "true");	// �쉶�썝媛��엯 �꽦怨� 硫붿떆吏�, "�쉶�썝媛��엯 �꽦怨듯뻽�뒿�땲�떎"
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			model.addAttribute("signupMsg", "false");	// �쉶�썝媛��엯 �떎�뙣 硫붿떆吏�, "�쉶�썝媛��엯 �떎�뙣�뻽�뒿�땲�떎"
			return "redirect:/member/signup"; 
		}
		
		return "redirect:/member/login";
	}
	
	// POST memId 以묐났泥댄겕, ajax
	@RequestMapping(value = "/idCheck", method = RequestMethod.POST)
	@ResponseBody
	public String idCheck(@RequestBody String memId, HttpServletRequest request, HttpServletResponse response) throws Exception {
		logger.info("post idCheck");
		String idCheck = "1";
		idCheck = Integer.toString(a001MemService.idCheck(memId));

		return idCheck;
	}


	// GET NAVER callback page �꽆湲곌린
	@RequestMapping(value = "/naverlogin", method = RequestMethod.GET)
	public String getNaver(Model model, HttpServletRequest request, HttpServletResponse response) {
		return "AnaverCallback";
	}
	

	// POST NAVER 濡쒓렇�씤
	@RequestMapping(value = "/naverlogin", method = RequestMethod.POST)
	@ResponseBody
	public String postNaver(@RequestBody A001MemVO vo,Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		logger.info("post naverlogin");
		
		HttpSession session = request.getSession();
		A001MemVO login = null;
		
		String snsId = vo.getSnsId();
		if(a001MemService.snsIdCheck(snsId) == 0) {	// 媛��엯�맂�쟻 �뾾�뒗 SNS ID �씪 寃쎌슦
			try {
				a001MemService.snsSignup(vo);	//	SNS �쉶�썝媛��엯 
				login = a001MemService.snsLogin(vo);	// SNS 濡쒓렇�씤 				
				if(login == null) {	// 濡쒓렇�씤 �떎�뙣
					logger.info("login fail");
					session.setAttribute("loginMem", null);
					model.addAttribute("loginMsg", "false");
					return "false";		// 濡쒓렇�씤 �떎�뙣 硫붿떆吏�, 濡쒓렇�씤 �떎�뙣 硫붿떆吏�. 蹂댁뿬二쇨린
				} else {		// 濡쒓렇�씤 �꽦怨�
					logger.info("login ok");
					session.setAttribute("loginMem", login);
				}
			} catch (Exception e) {
				e.printStackTrace();
				model.addAttribute("signupMsg", "false");	// �쉶�썝媛��엯 �떎�뙣 硫붿떆吏�, �쉶�썝媛��엯 �떎�뙣�뻽�뒿�땲�떎. 蹂댁뿬二쇨린
				return "false"; 
			}
		} else {	// �씠誘� 媛��엯�맂 SNS ID �씪 寃쎌슦
			login = a001MemService.snsLogin(vo);
			if(login == null) {	// 濡쒓렇�씤 �떎�뙣
				logger.info("login fail");
				session.setAttribute("loginMem", null);
				model.addAttribute("loginMsg", "false");
				return "false";		// 濡쒓렇�씤 �떎�뙣 硫붿떆吏�, 濡쒓렇�씤 �떎�뙣 硫붿떆吏�. 蹂댁뿬二쇨린
			} else {		// 濡쒓렇�씤 �꽦怨�
				logger.info("login ok");
				session.setAttribute("loginMem", login);
			}
		}
		
		return "true";
	}
	
	// POST KAKAO 濡쒓렇�씤
	@RequestMapping(value = "/kakaologin", method = RequestMethod.POST)
	@ResponseBody
	public String postKakao(@RequestBody A001MemVO vo, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		logger.info("post kakaologin");		
		HttpSession session = request.getSession();
		A001MemVO login = null;
		
		String snsId = vo.getSnsId();
		if(a001MemService.snsIdCheck(snsId) == 0) {	// 媛��엯�맂�쟻 �뾾�뒗 SNS ID �씪 寃쎌슦
			try {
				a001MemService.snsKakaoSignup(vo);	//	SNS �쉶�썝媛��엯 
				login = a001MemService.snsLogin(vo);	// SNS 濡쒓렇�씤 				
				if(login == null) {	// 濡쒓렇�씤 �떎�뙣
					logger.info("login fail");
					session.setAttribute("loginMem", null);
					model.addAttribute("loginMsg", "false");
					return "false";		// 濡쒓렇�씤 �떎�뙣 硫붿떆吏�, 濡쒓렇�씤 �떎�뙣 硫붿떆吏�. 蹂댁뿬二쇨린
				} else {		// 濡쒓렇�씤 �꽦怨�
					logger.info("login ok");
					session.setAttribute("loginMem", login);
				}
			} catch (Exception e) {
				e.printStackTrace();
				model.addAttribute("signupMsg", "false");	// �쉶�썝媛��엯 �떎�뙣 硫붿떆吏�, �쉶�썝媛��엯 �떎�뙣�뻽�뒿�땲�떎. 蹂댁뿬二쇨린
				return "false";
			}
		} else {	// �씠誘� 媛��엯�맂 SNS ID �씪 寃쎌슦
			login = a001MemService.snsLogin(vo);
			if(login == null) {	// 濡쒓렇�씤 �떎�뙣
				logger.info("login fail");
				session.setAttribute("loginMem", null);
				model.addAttribute("loginMsg", "false");
				return "false";		// 濡쒓렇�씤 �떎�뙣 硫붿떆吏�, 濡쒓렇�씤 �떎�뙣 硫붿떆吏�. 蹂댁뿬二쇨린
			} else {		// 濡쒓렇�씤 �꽦怨�
				logger.info("login ok");
				session.setAttribute("loginMem", login);
			}
		}
		
		return "true";
	}

	// GET modify/info, �쉶�썝�젙蹂댁닔�젙 �럹�씠吏� �씠�룞
	@RequestMapping(value = "/modify/info", method = RequestMethod.GET)
	public String getModifyInfo(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		logger.info("get /modify/info");
		HttpSession session = request.getSession();
		A001MemVO vo = (A001MemVO) session.getAttribute("loginMem");
		if(vo == null) {
			return "redirect:/";
		}
		else {
			String memNum = vo.getMemNum();
			A001MemVO result = null;
			result = a001MemService.memInfo(memNum);
			model.addAttribute("memInfo", result);
		}
		return "Amodify";
	}

	// POST /modify/info �쉶�썝 �젙蹂� �닔�젙
	@RequestMapping(value = "/modify/info", method = RequestMethod.POST)
	public String postModifyInfo(A001MemVO vo, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Integer result = 0;
		if(vo != null) {
			result = a001MemService.updateInfo(vo);
		}
		
		if(result == 0) {
			model.addAttribute("modifyMsg", false);
		} else {
			model.addAttribute("modifyMsg", "info");
		}
		return "redirect:/member/modify/info";
	}
	
	// POST /modify/pwd 鍮꾨�踰덊샇 �닔�젙
	@RequestMapping(value = "/modify/pwd", method = RequestMethod.POST)
	public String postModifyPwd(A001MemVO vo, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Integer result = 0;
		if(vo != null) {
			result = a001MemService.updatePwd(vo);
		}
		if(result == 0) {
			model.addAttribute("modifyMsg", false);
		} else {
			model.addAttribute("modifyMsg", "pwd");
		}
		return "redirect:/member/modify/info";
	}
	

	// POST /modify/auth 媛뺤궗濡� 沅뚰븳 蹂�寃�
	@RequestMapping(value = "/modify/auth", method = RequestMethod.POST)
	public String postModifyAuth(A001MemVO vo, Model model, HttpServletRequest request, HttpServletResponse response) {
		logger.info("post /modify/auth");
		
		if(vo != null) {
			try {
				a001MemService.updateAuth(vo);
				model.addAttribute("modifyMsg", "auth");
			} catch (Exception e) {
				e.printStackTrace();
				model.addAttribute("modifyMsg", false);
			}
		}
		return "redirect:/member/modify/info";
	}
	
	// GET find/id, �븘�씠�뵒 李얘린
	@RequestMapping(value = "/find/id", method = RequestMethod.GET)
	public String getFindId(Model model, HttpServletRequest request, HttpServletResponse response) {
		logger.info("get FindId");
		return "Afindid";
	}
	
	// POST find/id, �븘�씠�뵒 李얘린
	@RequestMapping(value = "/find/id", method = RequestMethod.POST)
	public String postFindId(A001MemVO vo, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		logger.info("post /find/id");
		String resultid = a001MemService.findId(vo);
		model.addAttribute("resultid", resultid);
		return "Aidresult";
	}
	
	// GET find/pwd, �븘�씠�뵒 李얘린
	@RequestMapping(value = "/find/pwd", method = RequestMethod.GET)
	public String getFindPwd(Model model, HttpServletRequest request, HttpServletResponse response) {
		logger.info("get FindPwd");
		return "Afindpwd";
	}
	
	// POST find/pwd, �븘�씠�뵒 李얘린
	@RequestMapping(value = "/find/pwd", method = RequestMethod.POST)
	public String postFindPwd(A001MemVO vo, Model model, HttpServletRequest request, HttpServletResponse response) {
		logger.info("post FindPwd");
		try {
			String memNum = a001MemService.findPwd(vo);
			if(memNum != null) {
				vo.setMemNum(memNum);							// 鍮꾨�踰덊샇 update瑜� �쐞�븳 �쉶�썝踰덊샇
				String newpwd = getRamdomPassword(10);
				vo.setMemPwd(newpwd);			// random�븯寃� 留뚮뱺 �깉 鍮꾨�踰덊샇
				Integer update_result = a001MemService.updatePwd(vo);
				if(update_result != 0) {
					mailService.sendMail(vo.getMemEmail(), "RiceLMS �엫�떆 鍮꾨�踰덊샇 諛쒓툒", newpwd + " �엫�떆 鍮꾨�踰덊샇 �엯�땲�떎.");
					model.addAttribute("findpwdMsg", "true");
				}
			}
		} catch (Exception e) {	// 鍮꾨�踰덊샇 李얘린 �떎�뙣 �뻽�쓣 寃쎌슦
			e.printStackTrace();
		}
		return "redirect:/member/login";
	}
	
	public static String getRamdomPassword(int len) { 
		char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 
				'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N',
				'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' 
				}; 
		int idx = 0; 
		StringBuffer sb = new StringBuffer();  
		for (int i = 0; i < len; i++) {
			idx = (int) (charSet.length * Math.random()); // 36 * �깮�꽦�맂 �궃�닔瑜� Int濡� 異붿텧 (�냼�닽�젏�젣嫄�) 
			sb.append(charSet[idx]); 
		} 
		logger.info(sb.toString());
		return sb.toString(); 
	}
}
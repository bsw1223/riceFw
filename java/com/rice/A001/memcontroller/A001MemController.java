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


	// GET 로그인, 로그인 페이지 이동
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String getLogin(Model model, HttpServletRequest request, HttpServletResponse response) {
		logger.info("get login");
		return "Alogin";
	}
	
	// POST 로그인, 로그인 check 
	@RequestMapping(value = "/loginPost", method = RequestMethod.POST)
	public String postLogin(A001MemVO vo, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		logger.info("post loginPost");
		HttpSession session = request.getSession();
		
		A001MemVO login = null;
		login = a001MemService.login(vo);
		
		if(login == null) {	// 로그인 실패
			logger.info("login fail");
			session.setAttribute("loginMem", null);
			model.addAttribute("loginMsg", "false");
			return "redirect:/member/login";		// 로그인 실패 메시지, 로그인 실패 메시지. 보여주기
		} else {		// 로그인 성공
			logger.info("login ok");
			session.setAttribute("loginMem", login);
		}
		
		return "redirect:/";
	}
	
	// GET 로그아웃, 로그아웃 후 메인페이지 이동
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String getLogout(Model model, HttpServletRequest request, HttpServletResponse response) {
		logger.info("get logout");
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:/";
	}
	
	// GET Account 회원가입 선택
	@RequestMapping(value = "/account", method = RequestMethod.GET)
	public String account(Model model, HttpServletRequest request, HttpServletResponse response) {
		logger.info("get account");
		return "Aaccount";
	}
	
	// 회원가입 GET, 회원가입 페이지 이동
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public String getSignup(Model model, HttpServletRequest request, HttpServletResponse response) {
		logger.info("get signup");
		return "Asignup";
	}

	// 회원가입 POST, 회원가입 시도
	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public String postSignup(A001MemVO vo,Model model, HttpServletRequest request, HttpServletResponse response) {
		logger.info("post signup");
		try {
			a001MemService.signup(vo);
			model.addAttribute("signupMsg", "true");	// 회원가입 성공 메시지, "회원가입 성공했습니다"
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			model.addAttribute("signupMsg", "false");	// 회원가입 실패 메시지, "회원가입 실패했습니다"
			return "redirect:/member/signup"; 
		}
		
		return "redirect:/member/login";
	}
	
	// POST memId 중복체크, ajax
	@RequestMapping(value = "/idCheck", method = RequestMethod.POST)
	@ResponseBody
	public String idCheck(@RequestBody String memId, HttpServletRequest request, HttpServletResponse response) throws Exception {
		logger.info("post idCheck");
		String idCheck = "1";
		idCheck = Integer.toString(a001MemService.idCheck(memId));

		return idCheck;
	}


	// GET NAVER callback page 넘기기
	@RequestMapping(value = "/naverlogin", method = RequestMethod.GET)
	public String getNaver(Model model, HttpServletRequest request, HttpServletResponse response) {
		return "AnaverCallback";
	}
	

	// POST NAVER 로그인
	@RequestMapping(value = "/naverlogin", method = RequestMethod.POST)
	@ResponseBody
	public String postNaver(@RequestBody A001MemVO vo,Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		logger.info("post naverlogin");
		
		HttpSession session = request.getSession();
		A001MemVO login = null;
		
		String snsId = vo.getSnsId();
		if(a001MemService.snsIdCheck(snsId) == 0) {	// 가입된적 없는 SNS ID 일 경우
			try {
				a001MemService.snsSignup(vo);	//	SNS 회원가입 
				login = a001MemService.snsLogin(vo);	// SNS 로그인 				
				if(login == null) {	// 로그인 실패
					logger.info("login fail");
					session.setAttribute("loginMem", null);
					model.addAttribute("loginMsg", "false");
					return "false";		// 로그인 실패 메시지, 로그인 실패 메시지. 보여주기
				} else {		// 로그인 성공
					logger.info("login ok");
					session.setAttribute("loginMem", login);
				}
			} catch (Exception e) {
				e.printStackTrace();
				model.addAttribute("signupMsg", "false");	// 회원가입 실패 메시지, 회원가입 실패했습니다. 보여주기
				return "false"; 
			}
		} else {	// 이미 가입된 SNS ID 일 경우
			login = a001MemService.snsLogin(vo);
			if(login == null) {	// 로그인 실패
				logger.info("login fail");
				session.setAttribute("loginMem", null);
				model.addAttribute("loginMsg", "false");
				return "false";		// 로그인 실패 메시지, 로그인 실패 메시지. 보여주기
			} else {		// 로그인 성공
				logger.info("login ok");
				session.setAttribute("loginMem", login);
			}
		}
		
		return "true";
	}
	
	// POST KAKAO 로그인
	@RequestMapping(value = "/kakaologin", method = RequestMethod.POST)
	@ResponseBody
	public String postKakao(@RequestBody A001MemVO vo, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		logger.info("post kakaologin");		
		HttpSession session = request.getSession();
		A001MemVO login = null;
		
		String snsId = vo.getSnsId();
		if(a001MemService.snsIdCheck(snsId) == 0) {	// 가입된적 없는 SNS ID 일 경우
			try {
				a001MemService.snsKakaoSignup(vo);	//	SNS 회원가입 
				login = a001MemService.snsLogin(vo);	// SNS 로그인 				
				if(login == null) {	// 로그인 실패
					logger.info("login fail");
					session.setAttribute("loginMem", null);
					model.addAttribute("loginMsg", "false");
					return "false";		// 로그인 실패 메시지, 로그인 실패 메시지. 보여주기
				} else {		// 로그인 성공
					logger.info("login ok");
					session.setAttribute("loginMem", login);
				}
			} catch (Exception e) {
				e.printStackTrace();
				model.addAttribute("signupMsg", "false");	// 회원가입 실패 메시지, 회원가입 실패했습니다. 보여주기
				return "false";
			}
		} else {	// 이미 가입된 SNS ID 일 경우
			login = a001MemService.snsLogin(vo);
			if(login == null) {	// 로그인 실패
				logger.info("login fail");
				session.setAttribute("loginMem", null);
				model.addAttribute("loginMsg", "false");
				return "false";		// 로그인 실패 메시지, 로그인 실패 메시지. 보여주기
			} else {		// 로그인 성공
				logger.info("login ok");
				session.setAttribute("loginMem", login);
			}
		}
		
		return "true";
	}

	// GET modify/info, 회원정보수정 페이지 이동
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

	// POST /modify/info 회원 정보 수정
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
	
	// POST /modify/pwd 비밀번호 수정
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
	

	// POST /modify/auth 강사로 권한 변경
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
	
	// GET find/id, 아이디 찾기
	@RequestMapping(value = "/find/id", method = RequestMethod.GET)
	public String getFindId(Model model, HttpServletRequest request, HttpServletResponse response) {
		logger.info("get FindId");
		return "Afindid";
	}
	
	// POST find/id, 아이디 찾기
	@RequestMapping(value = "/find/id", method = RequestMethod.POST)
	public String postFindId(A001MemVO vo, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		logger.info("post /find/id");
		String resultid = a001MemService.findId(vo);
		model.addAttribute("resultid", resultid);
		return "Aidresult";
	}
	
	// GET find/pwd, 아이디 찾기
	@RequestMapping(value = "/find/pwd", method = RequestMethod.GET)
	public String getFindPwd(Model model, HttpServletRequest request, HttpServletResponse response) {
		logger.info("get FindPwd");
		return "Afindpwd";
	}
	
	// POST find/pwd, 아이디 찾기
	@RequestMapping(value = "/find/pwd", method = RequestMethod.POST)
	public String postFindPwd(A001MemVO vo, Model model, HttpServletRequest request, HttpServletResponse response) {
		logger.info("post FindPwd");
		try {
			String memNum = a001MemService.findPwd(vo);
			if(memNum != null) {
				vo.setMemNum(memNum);							// 비밀번호 update를 위한 회원번호
				String newpwd = getRamdomPassword(10);
				vo.setMemPwd(newpwd);			// random하게 만든 새 비밀번호
				Integer update_result = a001MemService.updatePwd(vo);
				if(update_result != 0) {
					mailService.sendMail(vo.getMemEmail(), "RiceLMS 임시 비밀번호 발급", newpwd + " 임시 비밀번호 입니다.");
					model.addAttribute("findpwdMsg", "true");
				}
			}
		} catch (Exception e) {	// 비밀번호 찾기 실패 했을 경우
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
			idx = (int) (charSet.length * Math.random()); // 36 * 생성된 난수를 Int로 추출 (소숫점제거) 
			sb.append(charSet[idx]); 
		} 
		logger.info(sb.toString());
		return sb.toString(); 
	}
}

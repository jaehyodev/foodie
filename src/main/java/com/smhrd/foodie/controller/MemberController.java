package com.smhrd.foodie.controller;

import java.util.List;

import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.smhrd.foodie.mapper.MemberMapper;
import com.smhrd.foodie.model.AllergyInfo;
import com.smhrd.foodie.model.DislikeInfo;
import com.smhrd.foodie.model.Member;
import com.smhrd.foodie.model.MemberAllergy;
import com.smhrd.foodie.model.MemberDislike;
import com.smhrd.foodie.model.OrderInfo;

@Controller
public class MemberController {

	@Autowired
	MemberMapper mapper;

	// 회원가입 실행 메소드
	@RequestMapping(value = "/join.do", method = RequestMethod.POST)
	public String join(@RequestParam("mem_id") String mem_id, @RequestParam("mem_pw") String mem_pw,
			@RequestParam("mem_pwck") String mem_pwck, @RequestParam("mem_email") String mem_email,
			@RequestParam("mem_tel") String mem_tel, @RequestParam("mem_addr") String mem_addr,
			@RequestParam(name = "allergy_list", required = false) List<String> allergy_list,
			@RequestParam(name = "dislike_list", required = false) List<String> dislike_list) {

		Member member = new Member(mem_id, mem_pw, mem_pwck, mem_email, mem_tel, mem_addr);

		// sql문 실행
		// 1. mapper에 있는 userJoin 메소드 실행
		// 흐름 : contoller -> 인터페이스 -> xml -> controller로 값 반환
		
		int row = 0;
		
		// 비밀번호 확인
		if(mem_pw.equals(mem_pwck)) {
			
			row = mapper.join(member);
			
			if(allergy_list != null) {
				
				// 회원가입 mapper 코드보다 뒤에 와야함. 외래키 제약 때문에 회원가입이 먼저 되어야 테이블에 insert 가능함
				for (int i = 0; i < allergy_list.size(); i++) {
					// jsp에서 받아온 mem_id와 allergy_list의 value(allergy_idx로 사용되는 것)를 MemberAllergy에
					// set
					MemberAllergy memberAllergy = new MemberAllergy(mem_id, Integer.parseInt(allergy_list.get(i)));
					mapper.allergy(memberAllergy);

				}
			}
			
			
			if(dislike_list != null) {
				// 비선호 식재료
				int rowDislike = 0; // 알러지가 총 몇개 들어갔는 지 카운트
				
				for (int i = 0; i < dislike_list.size(); i++) {
					MemberDislike memberDislike = new MemberDislike(mem_id, Integer.parseInt(dislike_list.get(i)));
					mapper.dislike(memberDislike);
					rowDislike++;
				}
				
				// 총 몇개의 비선호 식재료가 들어갔는 지 확인하기
				for (int i = 0; i < rowDislike; i++) {
					System.out.println("비선호 식재료 추가" + (i + 1));
				}
			}
			
		} // 비밀번호 확인 끝 중괄호
			
		
		System.out.println("insert 반환 값 : " + row);

		if (row > 0) {
			System.out.println("회원가입 성공");
		} else {
			System.out.println("회원가입 실패");
		}

		return "redirect:/login";
	}

	// 로그인 확인 메소드
	@RequestMapping(value = "/loginCheck", method = RequestMethod.POST)
	public String loginCheck(@RequestParam("id") String id, @RequestParam("pw") String pw, HttpSession session,
			RedirectAttributes ra) {

		// 1. 전달받은 id 와 pw 를 DTO 에 set
		Member member = new Member();
		member.setMem_id(id);
		member.setMem_pw(pw);

		// 2. 해당하는 Mapper 인터페이스 메소드 호출 (SQL문 실행 / ID, PW를 DB에서 확인)
		Member m = mapper.loginCheck(member);

		if (m != null) {
			System.out.println("loginCheck 값 (select 반환 값) : " + m); // DB에서 해당하는 데이터 가져왔는지 확인

			// 기존에 존재하는 session에 key 와 value 값으로 객체를 set
			// 해당 값으로 사용자 구분
			session.setAttribute("member", m);

			// member 객체의 필드 값들을 확인
			System.out.println("member : " + session.getAttribute("member"));

			System.out.println("로그인 성공");
			return "redirect:/";
		} else {
			ra.addFlashAttribute("error", "아이디 또는 비밀번호를 다시 확인해주세요.");
			System.out.println("로그인 실패");

			// 로그인 실패 시 세션의 값이 null 인지 확인
			System.out.println(session.getAttribute("member"));

			// 오류 메세지를 담고 있는 값 출력 테스트
			System.out.println(ra.getFlashAttributes());

			return "redirect:/login";
		}
	}

	// 비밀번호 변경
	@RequestMapping(value = "/updatePw.do", method = RequestMethod.POST)
	public String updatePw(HttpSession session, @RequestParam("curPw") String curPw,
			@RequestParam("newPw") String newPw, @RequestParam("pwCheck") String pwCheck) {

		// session member에 저장되어 있는 현재 사용자의 정보들 member에 담기
		Member member = (Member) session.getAttribute("member");

		// session에 저장되어 있는 사용자의 pw가 담긴 member의 mem_pw 가져오기
		String mem_pw = member.getMem_pw();

		System.out.println("사용자의 현재 비밀번호 : " + mem_pw);

		if (mem_pw.equals(curPw)) {

			// member의 현재 비밀번호인 mem_pw에 newPw를 set
			member.setMem_pw(newPw);

			// 수정된 mem_pw를 가진 member 객체 보내기
			int row = mapper.updatePw(member);

			if (row > 0) {
				System.out.println("비밀번호 변경 성공");
			}
		} else {

			// 나중에 홈페이지에 알림창 띄우기
			System.out.println("현재 비밀번호를 잘못 입력하셨습니다.");

		}

		return "updatepw";
	}

	// 회원 정보 수정
	@RequestMapping(value = "/update.do", method = RequestMethod.POST)
	public String update(HttpSession session, @RequestParam("mem_name") String mem_name,
			@RequestParam("mem_email") String mem_email, @RequestParam("mem_phone") String mem_phone,
			@RequestParam("mem_addr") String mem_addr, RedirectAttributes ra) {

		// session에 저장되어 있는 사용자의 *현재* 정보 memeber 객체에 set
		Member member = (Member) session.getAttribute("member");

		System.out.println("현재 session의 값 : " + member);

		// RequestParam으로 가져온 값들 member에 set
		member.setMem_name(mem_name);
		member.setMem_email(mem_email);
		member.setMem_phone(mem_phone);
		member.setMem_addr(mem_addr);

		// 회원 정보 수정하는 매퍼 메소드 실행
		int row = mapper.update(member);

		if (row > 0) {
			System.out.println("회원 정보 수정 성공");
			
			ra.addFlashAttribute("massage", "회원 정보가 수정되었습니다.");

			System.out.println("변경된 session의 값 : " + member);
		}

		return "redirect:/update";
	}

	// 로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.POST)
	public String logout(HttpSession session) {

		System.out.println("로그아웃 전 세션 값 : " + session.getAttribute("member"));

		// 기존에 존재하던 session에 저장되어 있던 객체값을 delete
		session.removeAttribute("member");

		System.out.println("로그아웃 후 세션 값 : " + session.getAttribute("member"));

		// redirect : /logout 이 리턴해주는 jsp로 이동하는 것이 아니라 (리턴해주는 곳으로 갈 경우 url에 /logout으로 뜸)
		// value가 / 인 곳으로 가게 하는 것
		return "redirect:/";
	}

	// 회원탈퇴
	@RequestMapping(value = "/delete.do", method = RequestMethod.POST)
	public String delete(HttpSession session, @RequestParam("input_id") String input_id,
			@RequestParam("input_pw") String input_pw) {

		Member member = (Member) session.getAttribute("member");

		String mem_id = member.getMem_id();
		String mem_pw = member.getMem_pw();

		System.out.println("회원탈퇴 전 session 값 : " + session.getAttribute("member"));
		
		// 현재 session에 담긴 member 정보와 입력받은 member 정보가 같은지 확인 -> 다른 유저의 아이디 회원탈퇴 방지
		if (mem_id.equals(input_id) && mem_pw.equals(input_pw)) {
			
			// 회원 탈퇴
			mapper.delete(member);
			
			// session에 있는 값 삭제
			session.removeAttribute("member");
				
			// 회원탈퇴 후 session값을 따로 삭제해주지 않으면 DB에서 데이터를 삭제하더라도 session에 값이 남아있음
			System.out.println("회원탈퇴 후 session 값 : " + session.getAttribute("member")); // null값인 것을 확인

			System.out.println("회원탈퇴 성공");
			
			return "redirect:/";
			
		} else {
			System.out.println("회원탈퇴 실패");
			
			return "redirect:/delete";
		
		}

	}

	// 알러지 마이페이지 (사용자의 알러지와 비선호 정보만 받아서 출력만함)
	@RequestMapping(value = "/allergy", method = RequestMethod.GET)
	public String allergy(HttpSession session, Model model) {

		// 알러지 idx와 name가지고 오기
		List<AllergyInfo> allergyInfo = mapper.allergyInfo();

		System.out.println("DB에서 가져온 알러지 테이블 : " + allergyInfo); // 확인용 코드

		model.addAttribute("allergyInfo", allergyInfo);

		// 비선호 식재료 idx, name
		List<DislikeInfo> dislikeInfo = mapper.dislikeInfo();

		System.out.println("DB에서 가져온 비선호 식재료 테이블 : " + dislikeInfo); // 확인용 코드

		model.addAttribute("dislikeInfo", dislikeInfo);

		// 여기까지 코드는 JSP에서 반복문으로 테이블을 생성하기 위한 것

		// 1. 알러지 페이지에 접속했을 때 해당 유저의 id값 가져오기 -> 이유 : 해당 유저의 id값을 가져온다면 각 사용자를 구분할 수 있다는
		// 것을 확인할 수 있음
		System.out.println("session의 object 값 : " + session.getAttribute("member")); // 확인용

		// 2. object 타입을 Member로 바꿔주고 Member타입의 변수에 담기
		Member member = (Member) session.getAttribute("member"); // 확인용

		// 3. member의 mem_id에 사용자의 id가 잘 담겼는지 확인
		System.out.println("mem_id 값 : " + member.getMem_id()); // 확인용

		// 4. "Member"안에 있는 mem_id 값 db에 보내기 -> 이유 : 해당 유저의 알러지, 비선호 식재료 정보를 DB에서 조회하기
		// 위해서
		// 인터페이스에 있는 메소드의 매개변수에도 똑같이 적어줘야 함.
		List<MemberAllergy> joinAllergyIdx = mapper.allergyMypage(member); // member가 mem_id값을 가지고 있기 때문에 member를 매개변수로 설정 -> select로 조호된 값에 적합한 모델인 MemberAllery에 담기 * 여러행을 출력하기 때문에 List형태 사용
		List<MemberDislike> joinDislikeIdx = mapper.dislikeMypage(member);

		System.out.println("member_allergy_info의 select문 반환 값 : " + joinAllergyIdx); // select문 (확인용) // 이거 사용할것
		System.out.println("member_dislike_info의 select문 반환 값 : " + joinDislikeIdx); // select문 (확인용)


		model.addAttribute("joinAllergyIdx", joinAllergyIdx);
		model.addAttribute("joinDislikeIdx", joinDislikeIdx);

		return "allergy"; // allergy.jsp가 실행되는 순간 위 정보들이 반영
	}

	
	
	
	
	
	// 알러지, 비선호 식재료 수정 기능
	@RequestMapping(value = "/updateAllergy", method = RequestMethod.POST)
	public String updateAllergy(HttpSession session, Model model,
			@RequestParam(name = "allergy_list", required = false) List<String> allergy_list, @RequestParam(name = "dislike_list", required = false) List<String> dislike_list,
			@RequestParam(name = "deleteAllergy", required = false) String deleteAllergy, @RequestParam(name = "deleteDislike", required = false) String deleteDislike) {

		Member member = (Member) session.getAttribute("member");
		
		
		// 알러지 idx와 name가지고 오기
		List<AllergyInfo> allergyInfo = mapper.allergyInfo();

		System.out.println("DB에서 가져온 알러지 테이블 : " + allergyInfo); // 확인용 코드

		model.addAttribute("allergyInfo", allergyInfo);

		// 비선호 식재료 idx, name
		List<DislikeInfo> dislikeInfo = mapper.dislikeInfo();

		System.out.println("DB에서 가져온 비선호 식재료 테이블 : " + dislikeInfo); // 확인용 코드

		model.addAttribute("dislikeInfo", dislikeInfo);

		// 여기까지 코드는 JSP에서 반복문으로 테이블을 생성하기 위한 것
		
		if(allergy_list != null) {
			for (int i = 0; i < allergy_list.size(); i++) {
				// session에 저장되어 있는 id와 jsp checkBox에서 넘겨준 allergy_list 담기
				MemberAllergy memberAllergy = new MemberAllergy(member.getMem_id(), Integer.parseInt(allergy_list.get(i)));
				mapper.updateAllergy(memberAllergy);
			}
		}
			
		if(dislike_list != null) {
			for (int i = 0; i < dislike_list.size(); i++) {
				// session에 저장되어 있는 id와 jsp checkBox에서 넘겨준 allergy_list 담기
				MemberDislike memberDislike = new MemberDislike(member.getMem_id(), Integer.parseInt(dislike_list.get(i)));
				mapper.updateDislike(memberDislike);
			}
		}
			
			
		// 체크가 해제된 알러지의 idx를 db에 넘겨줘서 delete
		System.out.println("삭제될 allergy_idx : " + deleteAllergy); // 현재 ,로 나눠져 있는 상태
		System.out.println("삭제될 dislike_idx : " + deleteDislike);
		
		// split 을 사용하여 , 기준으로 문자열을 나누어 배열 생성
		String[] deleteAllergyList = deleteAllergy.split(",");
		String[] deleteDislikeList = deleteDislike.split(",");
		
		
		if(deleteAllergyList != null) {
			for(int i=0; i<deleteAllergyList.length; i++) {
				MemberAllergy memberAllergy = new MemberAllergy(member.getMem_id(), Integer.parseInt(deleteAllergyList[i]));
				mapper.deleteAllergy(memberAllergy);
			}
		}
			
		if(deleteDislikeList != null) {
			for(int i=0; i<deleteDislikeList.length; i++) {
				MemberDislike memberDislike = new MemberDislike(member.getMem_id(), Integer.parseInt(deleteDislikeList[i]));
				mapper.deleteDislike(memberDislike);
			}
		}
			
			
		
		List<MemberAllergy> joinAllergyIdx = mapper.allergyMypage(member);
		List<MemberDislike> joinDislikeIdx = mapper.dislikeMypage(member);
		
		model.addAttribute("joinAllergyIdx", joinAllergyIdx);
		model.addAttribute("joinDislikeIdx", joinDislikeIdx);
		
		
		
		return "allergy";

	};
	
	// 마이페이지 이동 시 첫페이지인 주문 내역 정보 호출
	@RequestMapping(value = "mypage", method = RequestMethod.GET)
	public String orderList(HttpSession session, Model model) {
		
		// session에 담긴 member 객체의 id값 가져오기
		Member member = (Member)session.getAttribute("member");
		
		
		// 주문 내역 불러오는 sql문 실행 후 반환되는 값 orderInfo 객체에 담기
		List<OrderInfo> orderInfo = mapper.orderInfo(member);
		
		System.out.println(orderInfo);
		
		// jsp에서 사용하기 위해 model에 담기
		model.addAttribute("orderInfo", orderInfo);
		
		return "mypage";
	}
}

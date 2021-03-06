package com.bitacademy.myportal.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bitacademy.myportal.exception.UserDaoException;
import com.bitacademy.myportal.repository.BoardVo;
import com.bitacademy.myportal.repository.UserVo;
import com.bitacademy.myportal.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {
	@Autowired
	private BoardService boardServiceImpl;
	
	@RequestMapping({"", "/", "/list"})
	public String list(Model model) {
		List<BoardVo> list = boardServiceImpl.getList();
		model.addAttribute("list", list);
		return "board/list";
	}
	
	//	게시물 작성 폼
	@RequestMapping(value="/write", method=RequestMethod.GET)
	public String writeForm(HttpSession session) {
		//	로그인 사용자 확인 -> 인터셉터에 처리 위임
//		UserVo authUser = (UserVo)session.getAttribute("authUser");
//		if (authUser == null) {
//			System.err.println("로그인 사용자가 아님!");
//			return "redirect:/";
//		}
		
		return "board/write";
	}
	
	//	게시물 작성
	@RequestMapping(value="/write", method=RequestMethod.POST)
	public String write(@ModelAttribute BoardVo boardVo, 
						HttpSession session) {
		//	로그인 사용자 확인 -> 인터셉터에 처리 위임
		UserVo authUser = (UserVo)session.getAttribute("authUser");
//		if (authUser == null) {
//			return "redirect:/";
//		}
		//	작성자 정보 추가
		boardVo.setUserNo(authUser.getNo());
		//	삽입
		boardServiceImpl.write(boardVo);
		
		return "redirect:/board/list";
	}
	
	//	게시물 조회
	@RequestMapping("/view/{no}")
	public String view(@PathVariable Long no, Model model) {
		
		BoardVo vo = boardServiceImpl.getContent(no);
		model.addAttribute("vo", vo);
		
		return "/board/view";
	}
	
	//	게시물 수정
	@RequestMapping(value="/modify/{no}", method=RequestMethod.GET)
	public String modifyForm(@PathVariable Long no, Model model) {
	
		model.addAttribute("boardVo", no);
		
		return "/board/modify";
	}
	
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	public String modify(BoardVo vo) {
		
		boolean bSuccess = false;
		try {
			bSuccess = boardServiceImpl.update(vo);
		} catch (Exception e) {
			System.err.println("에러상황의 BoardVo:" + vo);
			e.printStackTrace();
		}
		if (bSuccess) {	// 성공

			return "redirect:/board/view/" + vo.getNo();
		}
		return "redirect:/board/list";
	}
	
	//	게시물 삭제
	@RequestMapping(value="/delete/{no}")
	public String delete(@PathVariable Long no) {
		boardServiceImpl.delete(no);
		return "redirect:/board/list";
	}
	
}

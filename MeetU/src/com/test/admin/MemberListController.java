package com.test.admin;

import java.util.ArrayList;
import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.test.members.IMemberDAO;
import com.test.members.MemberDTO;

@Controller
public class MemberListController
{
	@Autowired
	private SqlSession sqlSession;
	
	@Resource(name = "AdminPage")
	private AdminPage adminpage;
	
	@RequestMapping(value="/memberlist.action")
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		
		// 현재 페이지
		int page = Integer.parseInt(request.getParameter("page")==null?"1":request.getParameter("page"));
		
		IMemberDAO dao = sqlSession.getMapper(IMemberDAO.class);
		
		// 한 화면에 출력될 페이지 수
		int countPage = 10;
		
		int[] sePage = adminpage.StartEndPage(page,  dao.memberPageCount(), countPage, 10);
		
		int startPage = sePage[0];
		int endPage = sePage[1];
		int totalPage = sePage[2];
		
		HashMap<String, Integer> stMap = new HashMap<String, Integer>();
		stMap.put("startPage", (page-1)*10+1);
		stMap.put("countPage", page*countPage);
		
		ModelAndView mav = new ModelAndView();
		ArrayList<MemberDTO> memberLists = new ArrayList<MemberDTO>();
		memberLists = dao.adminMemberList(stMap);
		
		mav.addObject("page", page);
		 mav.addObject("memberList", memberLists);
		mav.addObject("startPage", startPage);
		mav.addObject("endPage", endPage);
		mav.addObject("totalPage", totalPage);
		
		 mav.setViewName("WEB-INF/view/admin/AdminMemberMain.jsp");
		
		 return mav;
		
	}
	
	
}

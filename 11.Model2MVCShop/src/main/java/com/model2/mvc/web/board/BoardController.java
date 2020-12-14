package com.model2.mvc.web.board;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.board.BoardService;
import com.model2.mvc.service.comment.CommentService;
import com.model2.mvc.service.domain.Board;
import com.model2.mvc.service.domain.Comment;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.user.UserService;

@Controller
@RequestMapping("/board/*")
public class BoardController {

	@Autowired
	@Qualifier("commentServiceImpl")
	private CommentService commentService;
	@Autowired
	@Qualifier("boardServiceImpl")
	private BoardService boardService;
	
	@Value("#{commonProperties['pageUnit']}")
	//@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	//@Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
	public BoardController() {
		System.out.println(this.getClass());
		System.out.println("Board Controller");
	}
	
	@RequestMapping(value="addBoard", method=RequestMethod.GET)
	public String addBoard( HttpSession session ) throws Exception {

		System.out.println("Add Board Action Start");
		User user = (User)session.getAttribute("user");
		System.out.println("Add Board Action End");
		return "redirect:/board/addBoard.jsp";
	}
	
	@RequestMapping(value="addBoard", method=RequestMethod.POST)
	public String addBoard(@ModelAttribute("board") Board board,@RequestParam("file")MultipartFile file, HttpSession session) throws Exception {

		System.out.println("Add Board Action Start");
		User user = (User)session.getAttribute("user");
		board.setUser(user);
		boardService.addBoard(board);
		System.out.println("Add Board Action End");
		return "redirect:/board/listBoard.jsp";
	}
	
	@RequestMapping(value="getBoard",method=RequestMethod.GET)
	public String getBoard(@RequestParam("boardNo")int boardNo, Model model) throws Exception{
		
		Board board = boardService.getBoard(boardNo);
		model.addAttribute("board",board);
		return "forward:/board/getBoard.jsp";
	}
	
	@RequestMapping(value="listBoard",method=RequestMethod.GET)
	public String listBoard(Search search, Model model,HttpServletRequest request,
			HttpSession session ) throws Exception {
		System.out.println("listBoard");
		if( request.getParameter("page") == null){
			search.setCurrentPage(1);
		}else if (request.getParameter("page") != null) {
			search.setCurrentPage(Integer.parseInt(request.getParameter("page")));
		}
		search.setSearchCondition(request.getParameter("searchCondition"));
		search.setSearchKeyword(request.getParameter("searchKeyword"));
		search.setPageSize(pageSize);
		System.out.println(search);
		// Business logic 수행
		Map<String , Object> map=null;
		
		map = boardService.getBoardList(search);
		System.out.println("?");
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		System.out.println("??");
		// Model 과 View 연결
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		System.out.println("listBoard End");
		return "forward:/board/listBoard.jsp";
		
	}
	
	
	
}
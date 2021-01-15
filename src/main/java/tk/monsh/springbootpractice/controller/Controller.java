package tk.monsh.springbootpractice.controller;

import java.util.List;
import java.util.Random;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import tk.monsh.springbootpractice.domain.Board;
import tk.monsh.springbootpractice.domain.Item;
import tk.monsh.springbootpractice.domain.User;
import tk.monsh.springbootpractice.service.BoardService;
import tk.monsh.springbootpractice.service.ItemService;
import tk.monsh.springbootpractice.service.UserService;

@org.springframework.stereotype.Controller
public class Controller {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired BoardService boardService;
	@Autowired ItemService itemService;
	@Autowired UserService userService;
	
	Item item = null;
	List<Item> item_list = null;
	
	@RequestMapping("/")
	public String home(Model model) {
		List<Board> list = boardService.selectBoardList();
		model.addAttribute("list", list);
		
		logger.debug("debug");
		logger.info("info");
		logger.error("error");
		
		return "/index";
	}
	
	@RequestMapping("/before-sign-up")
	public String beforeSignUp() {
		return "/signup";
	}
	
	@RequestMapping("/signup")
	public String signup(User user) {
		// Encode password
		String encodedPassword = new BCryptPasswordEncoder().encode(user.getPassword());
		
		// Set user data
		user.setPassword(encodedPassword);
		user.setAccountNonExpired(true);
		user.setAccountNonLocked(true);
		user.setAuthorities(AuthorityUtils.createAuthorityList("ROLE_USER"));
		user.setCredentialsNonExpired(true);
		user.setEnabled(true);
		
		// Create user
		userService.createUser(user);
		
		// Create authority
		userService.createAuthorities(user);
		
		return "/login";
	}
	
	@RequestMapping(value="/login")
	public String beforeLogin(Model model) {
		return "/login";
	}
	
	@Secured({"ROLE_ADMIN"})
	@RequestMapping(value="/admin")
	public String admin(Model model) {
		return "/admin";
	}
	
	@Secured({"ROLE_USER"})
	@RequestMapping(value="/user/info")
	public String userInfo(Model model) {		
		return "/user_info";
	}
	
	@RequestMapping(value="/denied")
	public String denied(Model model) {
		return "/denied";
	}
	
	@Secured({"ROLE_USER"})
	@RequestMapping(value="/item-list")
	public String readItems(Model model) {
		item_list = itemService.readItems();
		model.addAttribute("item_list", item_list);
		
		return "/item-list";
	}
	
	@Secured({"ROLE_USER"})
	@RequestMapping("/before-add-item")
	public String beforeAddItem() {
		return "/add-item";
	}
	
	@Secured({"ROLE_USER"})
	@RequestMapping(value="/add-item")
	public String addItem(Item item, Model model) {
		// Set item data
		Random random = new Random();
		random.setSeed(System.currentTimeMillis());
		String itemId = String.format("%08d", random.nextInt(99999999));
		System.out.println(itemId);
		item.setItemId(itemId);
		item.setImage(null);
		
		// Add the item
		itemService.addItem(item);
		
		// Read the item just added
		item = itemService.readItem(itemId);
		model.addAttribute("item", item);
		
		return "/item";
	}
}

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
		user.setIsAccountNonExpired(true);
		user.setIsAccountNonLocked(true);
		user.setAuthorities(AuthorityUtils.createAuthorityList("ROLE_USER"));
		user.setIsCredentialsNonExpired(true);
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
	
	@RequestMapping(value="/denied")
	public String denied(Model model) {
		return "/denied";
	}
	
	@Secured({"ROLE_USER"})
	@RequestMapping(value="/my-account")
	public String userInfo(Model model) {
		return "/my-account";
	}
	
	@Secured({"ROLE_ADMIN"})
	@RequestMapping(value="/admin")
	public String admin(Model model) {
		return "/admin";
	}
	
	@Secured({"ROLE_ADMIN"})
	@RequestMapping(value="/user-list")
	public String readUsers(Model model) {
		List<User> user_list = userService.readUsers();
		model.addAttribute("user_list", user_list);
		
		return "/user-list";
	}
	
	@Secured({"ROLE_USER"})
	@RequestMapping(value="user-info")
	public String readUser(Model model, String username) {
		
		User user = userService.readUser(username);
		model.addAttribute("user", user);
		
		return "/user-info";
	}
	
	@Secured({"ROLE_USER"})
	@RequestMapping(value="/item-list")
	public String readItems(Model model) {
		
		List<Item> item_list = itemService.readItems();
		model.addAttribute("item_list", item_list);
		
		return "/item-list";
	}
	
	@Secured({"ROLE_USER"})
	@RequestMapping(value="/item")
	public String readItem(Model model, String itemId) {
		
		Item item = itemService.readItem(itemId);
		model.addAttribute("item", item);
		
		return "/item";
	}
	
	@Secured({"ROLE_USER"})
	@RequestMapping("/add-item")
	public String addItem() {
		return "/add-item";
	}
	
	@Secured({"ROLE_ADMIN"})
	@RequestMapping(value="/add-item-result")
	public String addItemResult(Model model, Item item) {
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
		Item item_added = itemService.readItem(itemId);
		model.addAttribute("item", item_added);
		
		return "/item";
	}
	
	@Secured({"ROLE_ADMIN"})
	@RequestMapping(value="/edit-item")
	public String editItem(Model model, String itemId) {
		
		Item item_edit = itemService.readItem(itemId);
		model.addAttribute("item", item_edit);
		
		return "/edit-item";
	}
	
	@Secured({"ROLE_ADMIN"})
	@RequestMapping(value="/edit-item-result")
	public String editItemResult(Model model, Item item) {
		
		return "/item";
	}
	
}

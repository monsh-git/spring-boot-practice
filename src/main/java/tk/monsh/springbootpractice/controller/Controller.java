package tk.monsh.springbootpractice.controller;

import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.security.Principal;
import java.util.List;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.swing.filechooser.FileSystemView;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import tk.monsh.springbootpractice.domain.Board;
import tk.monsh.springbootpractice.domain.Item;
import tk.monsh.springbootpractice.domain.Order;
import tk.monsh.springbootpractice.domain.OrderDetail;
import tk.monsh.springbootpractice.domain.User;
import tk.monsh.springbootpractice.service.BoardService;
import tk.monsh.springbootpractice.service.ItemService;
import tk.monsh.springbootpractice.service.OrderDetailService;
import tk.monsh.springbootpractice.service.OrderService;
import tk.monsh.springbootpractice.service.UserService;

@org.springframework.stereotype.Controller
public class Controller {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired BoardService boardService;
	@Autowired ItemService itemService;
	@Autowired UserService userService;
	@Autowired OrderService orderService;
	@Autowired OrderDetailService orderDetailService;
	
	@RequestMapping("/")
	public String home(Model model) {
		List<Item> itemList = itemService.readItems();
		model.addAttribute("itemList", itemList);
		
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
		List<User> userList = userService.readUsers();
		model.addAttribute("userList", userList);
		
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
	@RequestMapping(value="edit-user")
	public String editUserForm(Model model, String username) {
		
		User userEdit = userService.readUser(username);
		model.addAttribute("user", userEdit);
		
		return "/edit-user";
	}
	
	@Secured({"ROLE_USER"})
	@RequestMapping(value="edit-user-result")
	public String editUser(Model model, User user) {
		
		// Encode password
		String encodedPassword = new BCryptPasswordEncoder().encode(user.getPassword());
		// Set user data
		user.setPassword(encodedPassword);
		userService.editUser(user);
		
		// Read the item just edited
		User userEdited = userService.readUser(user.getUsername());
		model.addAttribute("user", userEdited);
		
		return "/user-info";
	}
	
	@Secured({"ROLE_USER"})
	@RequestMapping(value="/item-list")
	public String readItems(Model model) {
		
		List<Item> itemList = itemService.readItems();
		model.addAttribute("itemList", itemList);
		
		return "/item-list";
	}
	
	@Secured({"ROLE_USER"})
	@RequestMapping(value="/item")
	public String readItem(Model model, String itemId) {
		
		Item item = itemService.readItem(itemId);
		model.addAttribute("item", item);
		
		List<Board> boardList = boardService.getBoards(itemId);
		model.addAttribute("boardList", boardList);
		
		return "/item";
	}
	
	@Secured({"ROLE_USER"})
	@RequestMapping("/add-item")
	public String addItemForm() {
		return "/add-item";
	}
	
	@Secured({"ROLE_ADMIN"})
	@RequestMapping(value="/add-item-result")
	public String addItem(Model model, Item item, @RequestParam("imageFile") MultipartFile multipartFile) {

		// Set item data
		String path = "D:/SpringToolWorkspace/SpringBootPractice/src/main/resources/static/images/";
		String thumbPath = path + "thumb/";
		String filename = multipartFile.getOriginalFilename();
		String ext = filename.substring(filename.lastIndexOf(".")+1);
		
		Random random = new Random();
		random.setSeed(System.currentTimeMillis());
		String now = String.format("%08d", random.nextInt(99999999));
		String itemId = now;
		
		filename = "IMG" + now;
		File file = new File(path + filename);
		File thumbFile = new File(thumbPath + filename);
		
		try {
			InputStream input = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(input, file);
			
			BufferedImage imageBuf = ImageIO.read(file);
			int fixWidth = 500;
			double ratio = imageBuf.getWidth() / (double)fixWidth;
			int thumbWidth = fixWidth;
			int thumbHeight = (int)(imageBuf.getHeight() / ratio);
			BufferedImage thumbImageBf = new BufferedImage(thumbWidth, thumbHeight, BufferedImage.TYPE_3BYTE_BGR);
			Graphics2D g = thumbImageBf.createGraphics();
			Image thumbImage = imageBuf.getScaledInstance(thumbWidth, thumbHeight, Image.SCALE_SMOOTH);
			g.drawImage(thumbImage, 0,  0,  thumbWidth,  thumbHeight,  null);
			g.dispose();
			ImageIO.write(thumbImageBf, ext, thumbFile);
		} catch (IOException e) {
			FileUtils.deleteQuietly(file);
			e.printStackTrace();
		}
				
		// System.out.println(itemId);
		item.setItemId(itemId);
		item.setImage(filename);
		item.setThumbnail("thumb/" + filename);
		
		// Add the item
		itemService.addItem(item);
		
		// Read the item just added
		Item item_added = itemService.readItem(itemId);
		model.addAttribute("item", item_added);
		
		return "/item";
	}
	
	@Secured({"ROLE_ADMIN"})
	@RequestMapping(value="/edit-item")
	public String editItemForm(Model model, String itemId) {
		
		Item itemEdit = itemService.readItem(itemId);
		model.addAttribute("item", itemEdit);
		
		return "/edit-item";
	}
	
	@Secured({"ROLE_ADMIN"})
	@RequestMapping(value="/edit-item-result")
	public String editItem(Model model, Item item, @RequestParam("imageFile") MultipartFile multipartFile) {
		
		String path = "D:/SpringToolWorkspace/SpringBootPractice/src/main/resources/static/images/";
		String thumbPath = path + "thumb/";
		String filename = multipartFile.getOriginalFilename();
		String ext = filename.substring(filename.lastIndexOf(".")+1);

		Random random = new Random();
		random.setSeed(System.currentTimeMillis());
		String now = String.format("%08d", random.nextInt(99999999));
		
		filename = "IMG" + now;		
		File file = new File(path + filename);
		File thumbFile = new File(thumbPath + filename);
		
		try {
			InputStream input = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(input, file);
			
			BufferedImage imageBuf = ImageIO.read(file);
			int fixWidth = 500;
			double ratio = imageBuf.getWidth() / (double)fixWidth;
			int thumbWidth = fixWidth;
			int thumbHeight = (int)(imageBuf.getHeight() / ratio);
			BufferedImage thumbImageBf = new BufferedImage(thumbWidth, thumbHeight, BufferedImage.TYPE_3BYTE_BGR);
			Graphics2D g = thumbImageBf.createGraphics();
			Image thumbImage = imageBuf.getScaledInstance(thumbWidth, thumbHeight, Image.SCALE_SMOOTH);
			g.drawImage(thumbImage, 0,  0,  thumbWidth,  thumbHeight,  null);
			g.dispose();
			ImageIO.write(thumbImageBf, ext, thumbFile);
		} catch (IOException e) {
			FileUtils.deleteQuietly(file);
			e.printStackTrace();
		}
				
		item.setImage(filename);
		item.setThumbnail("thumb/" + filename);
		
		itemService.editItem(item);
		
		// Read the item just edited
		Item itemEdited = itemService.readItem(item.getItemId());
		model.addAttribute("item", itemEdited);
		
		return "/item";
	}
	
	@Secured({"ROLE_USER"})
	@RequestMapping(value="/add-to-cart")
	public String addToCart(Model model, Principal principal, String itemId, int quantity) {
		
		String username = principal.getName();
		
		Order order = orderService.getOrder(username);
		if(order == null) {
			orderService.makeOrder(username);
			order = orderService.getOrder(username);
		}
		int orderId = order.getOrderId();
			
		OrderDetail orderDetail = new OrderDetail();
		orderDetail.setOrderId(orderId);
		orderDetail.setItemId(itemId);
		orderDetail.setQuantity(quantity);
		
		orderDetailService.makeOrderDetail(orderDetail);
		List<OrderDetail> orderDetailList = orderDetailService.getOrderDetails(orderId);
		model.addAttribute("orderDetailList", orderDetailList);
		
		return "/cart";
	}
	
	@Secured({"ROLE_USER"})
	@RequestMapping(value="/cart")
	public String viewCart(Model model, Principal principal) {
		
		String username = principal.getName();
		Order order = orderService.getOrder(username);
		if(order == null) {
			orderService.makeOrder(username);
			order = orderService.getOrder(username);
		}
		int orderId = order.getOrderId();
		order.setTotalAmount(orderService.getTotalAmount(orderId));
		if(order.isPurchased() != true) {
			List<OrderDetail> orderDetailList = orderDetailService.getOrderDetails(orderId);
			model.addAttribute("orderId", orderId);
			model.addAttribute("order", order);
			model.addAttribute("orderDetailList", orderDetailList);
		}
		
		return "/cart";
	}
	
	@Secured({"ROLE_USER"})
	@RequestMapping(value="/purchase-result")
	public String purchaseResult(Model model, int orderId) {
		List<OrderDetail> orderDetailList = orderDetailService.getOrderDetails(orderId);
		orderService.setPurchased(orderId);
		
		for(OrderDetail orderDetail : orderDetailList) {
			Item item = itemService.readItem(orderDetail.getItemId());
			item.setStock(item.getStock() - orderDetail.getQuantity());
			if(item.getStock() == 0) {
				item.setSoldOut(true);
			}
			itemService.editItem(item);
		}
		
		return "/purchase-result";
	}
}

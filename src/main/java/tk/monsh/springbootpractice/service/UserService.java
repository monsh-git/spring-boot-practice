package tk.monsh.springbootpractice.service;

import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetailsService;

import tk.monsh.springbootpractice.domain.User;

public interface UserService extends UserDetailsService {

	// Create authority
	public void createAuthorities(User user);
	
	// Get authorities
	Collection<GrantedAuthority> getAuthorities(String username);
	
	// Read users
	public List<User> readUsers();
	
	// Read user
	public User readUser(String username);
	
	// Create user
	public void createUser(User user);
	
}

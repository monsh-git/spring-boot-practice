package tk.monsh.springbootpractice.service;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetailsService;

import tk.monsh.springbootpractice.domain.User;

public interface UserService extends UserDetailsService {

	// Read user
	public User readUser(String username);
	
	// Create user
	public void createUser(User user);
	
	// Create authority
	public void createAuthorities(User user);
	
	// Get authorities
	Collection<GrantedAuthority> getAuthorities(String username);
}

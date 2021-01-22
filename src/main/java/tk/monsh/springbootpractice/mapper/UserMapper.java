package tk.monsh.springbootpractice.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.security.core.GrantedAuthority;

import tk.monsh.springbootpractice.domain.User;

@Mapper
public interface UserMapper {

	// Read authority
	public List<GrantedAuthority> readAuthorities(String username);
	
	// Create authority
	public void createAuthority(User user);
	
	// Read users
	public List<User> readUsers();

	// Read user
	public User readUser(String username);
	
	// Create user
	public void createUser(User user);
	
	// Eidt user
	public void editUser(User user);
}

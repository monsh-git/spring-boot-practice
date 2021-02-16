package tk.monsh.springbootpractice.config;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.util.StringUtils;
import org.springframework.web.filter.OncePerRequestFilter;

import lombok.RequiredArgsConstructor;
import tk.monsh.springbootpractice.service.UserService;

@RequiredArgsConstructor
public class AuthTokenFilter extends OncePerRequestFilter {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private JwtUtils jwtUtils;
	
	@Autowired
	private UserService userService;
	
	//filter -> servelet ���� �� ���� dofilter ����� ����������  dofilterInternal �� ���� doFilter�� ����ó��
	@Override
	protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain)
			throws ServletException, IOException {
		try {
			//parseJwt �޼ҵ� ���
			String jwt = parseJwt(request);
			
			//jwt ��ū�� null �� �ƴϰ� ��ȿ�� ��ū�϶�
			if (jwt != null && jwtUtils.validateJwtToken(jwt)) {
				//jwt�� ���� ȸ�� ���̵� ����
				String username = jwtUtils.getUserNameFromJwtToken(jwt);
				
				//security�� ���� ���� ����
				UserDetails userDetails = userService.loadUserByUsername(username);
				UsernamePasswordAuthenticationToken authentication = new UsernamePasswordAuthenticationToken(
						userDetails, null, userDetails.getAuthorities());
				authentication.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));

				SecurityContextHolder.getContext().setAuthentication(authentication);
			}
		} catch (Exception e) {
			logger.error("Cannot set user authentication: {}", e);
		}

		filterChain.doFilter(request, response);
		
	}


	private String parseJwt(HttpServletRequest request) {
		//header �߿��� Authorization key�� value ���� ������
		String headerAuth = request.getHeader("Authorization");
		
		//jwt ������
		if (StringUtils.hasText(headerAuth) && headerAuth.startsWith("Bearer ")) {
			return headerAuth.substring(7, headerAuth.length());
		}

		return null;
	}
}
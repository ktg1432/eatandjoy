/**
 * 
 */
package com.team.Project.config;

/**
 * @author javateam
 *
 */
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.AuthenticationException;
// import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;

import lombok.extern.log4j.Log4j2;
 
@Log4j2
public class CustomAuthenticationFailure extends SimpleUrlAuthenticationFailureHandler { // implements AuthenticationFailureHandler {
	
    // 로그인 실패시 username을 화면에 그대로 출력하도록 하기 위해 아래와 같은 핸들러를 작성
	@Override
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
            AuthenticationException exception) throws IOException, ServletException {

		log.info("로그인 실패");
		
		this.setDefaultFailureUrl("/loginError");
		super.onAuthenticationFailure(request, response, exception);

    }
	
}
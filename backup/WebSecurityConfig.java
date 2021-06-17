/**
 * 
 */
package com.team.Project.config;

import javax.sql.DataSource;

/**
 * @author javateam
 *
 */
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.session.SessionRegistry;
import org.springframework.security.core.session.SessionRegistryImpl;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.rememberme.JdbcTokenRepositoryImpl;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;

import com.team.Project.service.CustomProvider;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Configuration
@ComponentScan(basePackages= {"com.team.Project"})
@EnableWebSecurity
@EnableGlobalMethodSecurity(securedEnabled = true) // 추가
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
	private SessionRegistry sessionRegistry;

	@Autowired
	private UserDetailsService userDetailsService;

	@Autowired
	private CustomProvider customProvider;

	@Autowired
	private DataSource dataSource; // 추가
	
//	@Bean
//	public PasswordEncoder passwordEncoder2() {
//		return PasswordEncoderFactories.createDelegatingPasswordEncoder();
//	}
	
	@Bean
	public BCryptPasswordEncoder passwordEncoder() {
		// 주의) 여기서 strength가 높아지면 빌드 타임이 너무 많이 소모될 수 있으므로 적절히 조정하여 빌드 타임을 조정합니다. 4~31
		return new BCryptPasswordEncoder(10);
	}

	// since spring boot 2.0 over
	@Override
	@Bean
	public AuthenticationManager authenticationManagerBean() throws Exception {
		return super.authenticationManagerBean();
	}

	@Bean(name = "sessionRegistry")
	public SessionRegistry sessionRegistry() {
		return new SessionRegistryImpl();
	}

	/*
	 * @Override protected void configure(AuthenticationManagerBuilder
	 * authManagerBuilder) throws Exception { ...
	 * .userDetailsService(userDetailsService()); ... }
	 */

	// since sapring boot 2.0 over
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		
		auth.authenticationProvider(customProvider);

		// auth.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder());
		
		// 주의사항) 아래의 코드 부류들을 삽입/대체시 지속적 Stackoverflow error !!!
		// auth.parentAuthenticationManager(authenticationManagerBean());
		// auth.userDetailsService(userDetailsService()).passwordEncoder(bCryptPasswordEncoder());
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {

		log.info("configure !!!");

		// h2 console 사용을 위한 설정
		// http.csrf().ignoringAntMatchers("/h2console/**"); // h2
		http.headers().frameOptions().sameOrigin();

		http.authorizeRequests()
				// 해당 url을 허용 설정.
				// .antMatchers("/resources/**","/loginError","/registration","/h2console/**").permitAll()
		
				// 참고) antMatchers :
				// https://docs.spring.io/spring-framework/docs/current/javadoc-api/org/springframework/util/AntPathMatcher.html
					.antMatchers("/").permitAll()
					.antMatchers("/webjars/**").permitAll()
					.antMatchers("/join").permitAll()
					.antMatchers("/joinAction").permitAll()
			        .antMatchers("/resources/**","/loginError").permitAll()
			        .anyRequest().authenticated()
					// admin 폴더에 경우 admin 권한이 있는 사용자에게만 허용
					.antMatchers("/admin/**").hasAuthority("ROLE_ADMIN")
					// user 폴더에 경우 user 권한이 있는 사용자에게만 허용
					.antMatchers("/secured/**").hasAuthority("ROLE_USER")
					.anyRequest().authenticated()
					.and()
				//.csrf()
				//	.ignoringAntMatchers("/join")
				//	.ignoringAntMatchers("/login")
				//	.ignoringAntMatchers("/loginError")
				//	.and()
				.formLogin()
					.loginPage("/login")
					// .loginProcessingUrl("/login")
					// .defaultSuccessUrl("/welcome")
					// .failureUrl("/loginError")
					.successHandler(new CustomAuthenticationSuccess()) // 로그인 성공시 핸들러 메서드
					.failureHandler(new CustomAuthenticationFailure()) // 로그인 실패시 핸들러 메서드
					.permitAll()
					.and()
				.logout()
					.permitAll()
					.logoutUrl("/logout")
					.deleteCookies("JSESSIONID")
					.and()
				.exceptionHandling()
					.accessDeniedPage("/403") // 권한이 없을경우 해당 url로 이동
					.and()
				.sessionManagement() // 세션 제어
					.maximumSessions(1) // 최대 동시 세션 사용수(중복 로그인 가능 설정시 활용)
					.expiredUrl("/login")
					.sessionRegistry(sessionRegistry);

		// 추가된 부분 : remember-me 관련
		// remember-me cookie
		// => 사용자이름 + cookie expired time(만료 시간) + 패쓰워드 => Base64(Md5방식) 암호화
		/*
		 * base64(username + ":" + expirationTime + ":" + md5Hex(username + ":" +
		 * expirationTime + ":" password + ":" + key))
		 */
		http.rememberMe().key("javateam").userDetailsService(userDetailsService).tokenRepository(getJDBCRepository())
				.tokenValiditySeconds(60 * 60 * 24); // 24시간(1일)
	}

	// 추가된 remember-me 관련 메서드
	private PersistentTokenRepository getJDBCRepository() {

		JdbcTokenRepositoryImpl repo = new JdbcTokenRepositoryImpl();
		repo.setDataSource(dataSource);

		return repo;
	} //
	
    @Autowired
    public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
        // auth.userDetailsService(userDetailsService).passwordEncoder(bCryptPasswordEncoder());
        auth.userDetailsService(customProvider).passwordEncoder(passwordEncoder());
    }  
	 
}
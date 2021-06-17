package com.team.Project.service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.team.Project.domain.CustomUserVO;
import com.team.Project.domain.RoleVO;

import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class CustomProvider 
		implements AuthenticationProvider, UserDetailsService {
	
	// legacy project 에서 wiring 문제 발생 !
	// @Autowired
	// private BCryptPasswordEncoder passwordEncoder;
	
	private JdbcTemplate jdbcTemplate;
	
    @Autowired
	public void setDataSource(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
    @Override
	public CustomUserVO loadUserByUsername(String userName) {
    	
    	log.info("loadUserByUsername");
    	
    	try {
	    	return (CustomUserVO)jdbcTemplate.queryForObject(
	    			 "SELECT * FROM tbl_users WHERE username=?",
				     new Object[]{ userName },
				     new BeanPropertyRowMapper<CustomUserVO>(CustomUserVO.class));
	    } catch (EmptyResultDataAccessException e) {
	    	log.info("error1");
	    	return null;
	    }

    }
	
	private RoleVO loadUserRole(String userName) {
		
		log.info("loadUserRole");
    	
		try {
			return (RoleVO)jdbcTemplate.queryForObject(
	   			 	"SELECT username, role FROM tbl_user_roles WHERE username=?", 
				     new Object[]{ userName },
				     new BeanPropertyRowMapper<RoleVO>(RoleVO.class));
		} catch (EmptyResultDataAccessException e) {
			log.info("error2");
	    	return null;
	    }
		
	}
	
	@Override
	public Authentication authenticate(Authentication authentication) 
				throws AuthenticationException {
		
		log.info("#### authenticate");
		
		String username = authentication.getName();
        String password = (String) authentication.getCredentials();

        CustomUserVO user = null;
        Collection<? extends GrantedAuthority> authorities = null;
    
        try {
    			log.info("### authentication : {}", authentication);
    			
	        	user = this.loadUserByUsername(username);
	            RoleVO role = this.loadUserRole(username);
	            
	            if (user == null) {
	            	throw new UsernameNotFoundException("회원정보가 존재하지 않습니다.");
	            }
	            
	            List<RoleVO> roles = new ArrayList<RoleVO>();
	            roles.add(role);		
	            user.setAuthorities(roles);
	            
	            BCryptPasswordEncoder passwordEncoder 
					= new BCryptPasswordEncoder();
	           
	            log.info("비밀번호 :" + user.getPassword() );
	            log.info("비밀번호2 :" + password);
	            log.info("매치 : " + passwordEncoder.matches(password, user.getPassword()));
	            if (passwordEncoder.matches(password, user.getPassword())) 
	            	log.info("비밀번호 일치 !");	
	            else 
	            	throw new BadCredentialsException("비밀번호가 일치하지 않습니다.");
	            
	            authorities = user.getAuthorities();
            
        } catch(UsernameNotFoundException e) {
            log.info(e.toString());
            throw new UsernameNotFoundException(e.getMessage());
        } catch(BadCredentialsException e) {
            log.info(e.toString());
            throw new BadCredentialsException(e.getMessage());
        } catch(Exception e) {
            log.info(e.toString());
            e.printStackTrace();
        }

        return new UsernamePasswordAuthenticationToken(user, password, authorities);
	}

	@Override
	public boolean supports(Class<?> authentication) {
		return true;
	}

} //
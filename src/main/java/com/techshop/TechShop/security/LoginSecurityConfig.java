package com.techshop.TechShop.security;

import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;


@Configuration
@EnableWebSecurity
public class LoginSecurityConfig extends WebSecurityConfigurerAdapter {
	
	@Autowired
	private DataSource dataSource;

	@Autowired
	public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
		auth.jdbcAuthentication().dataSource(dataSource).passwordEncoder(passwordEncoder()).
				usersByUsernameQuery("SELECT email, password, enabled FROM customer_info WHERE email=?").
				authoritiesByUsernameQuery(
		                "SELECT u.email, a.authority " +
		                "FROM customer_authorities a, customer_info u " +
		                "WHERE u.email = ? " +
		                "AND u.id = a.customer_id"
		            );
	}
	
	 @Bean
	    public PasswordEncoder passwordEncoder() {
	        return new BCryptPasswordEncoder();
	    }
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.authorizeRequests()
			.antMatchers("/").permitAll()
			.antMatchers("/admin/product/**").access("hasRole('ADMIN')")
			.antMatchers("/order/{cartId}").authenticated()
			.and()
				.formLogin().loginPage("/login").loginProcessingUrl("/login")
				.defaultSuccessUrl("/?login")
				.failureUrl("/login?error")
				.usernameParameter("email").passwordParameter("password")				
			.and()
				.logout().clearAuthentication(true).invalidateHttpSession(true)
				.deleteCookies("JSESSIONID").permitAll()
			.and()
				.exceptionHandling().accessDeniedPage("/?addproductaccesserror");
	}
}


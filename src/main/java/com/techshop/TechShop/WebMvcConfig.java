package com.techshop.TechShop;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;
import org.springframework.webflow.mvc.servlet.FlowHandlerAdapter;
import org.springframework.webflow.mvc.servlet.FlowHandlerMapping;

import com.techshop.TechShop.webflow.WebFlowConfiguration;

@EnableWebMvc
@Configuration
public class WebMvcConfig implements WebMvcConfigurer{
	
	@Autowired
	private WebFlowConfiguration webFlowConfig;
	
	@	Override
	public void addViewControllers(ViewControllerRegistry registry) {
		registry.addViewController("/").setViewName("welcome");
	}
	
	 @Override
	    public void addResourceHandlers(ResourceHandlerRegistry registry) {
	        registry
	          .addResourceHandler("/resources/**")
	          .addResourceLocations("/resources/");
	        registry
	        	.addResourceHandler("/webjars/**")
	        	.addResourceLocations("/webjars/");
	    }
	
	@Bean
	public ViewResolver viewResolver() {
		InternalResourceViewResolver bean = new InternalResourceViewResolver();
		bean.setViewClass(JstlView.class);
		bean.setPrefix("/WEB-INF/views/");
		bean.setSuffix(".jsp");
		return bean;
	}
	
	   @Bean
	    public FlowHandlerMapping flowHandlerMapping() {
	        FlowHandlerMapping handlerMapping = new FlowHandlerMapping();
	        handlerMapping.setOrder(-1);
	        handlerMapping.setFlowRegistry(this.webFlowConfig.flowRegistry());
	        return handlerMapping;
	    }

	    @Bean
	    public FlowHandlerAdapter flowHandlerAdapter() {
	        FlowHandlerAdapter handlerAdapter = new FlowHandlerAdapter();
	        handlerAdapter.setFlowExecutor(this.webFlowConfig.flowExecutor());
	        handlerAdapter.setSaveOutputToFlashScopeOnRedirect(true);
	        return handlerAdapter;
	    }

}

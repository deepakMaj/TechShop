package com.techshop.TechShop.webflow;

import java.util.Collections;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.webflow.config.AbstractFlowConfiguration;
import org.springframework.webflow.definition.registry.FlowDefinitionRegistry;
import org.springframework.webflow.engine.builder.support.FlowBuilderServices;
import org.springframework.webflow.executor.FlowExecutor;
import org.springframework.webflow.mvc.builder.MvcViewFactoryCreator;
import com.techshop.TechShop.WebMvcConfig;

@Configuration
public class WebFlowConfiguration extends AbstractFlowConfiguration{
	
	@Autowired
	private WebMvcConfig webMvcConfig;
	
	@Bean
	public FlowDefinitionRegistry flowRegistry() {
		return getFlowDefinitionRegistryBuilder(flowBuilderServices())
				.setBasePath("/WEB-INF/flows")
				.addFlowLocation("/checkout/ckeckout.xml").build();
	}
	
	@Bean
	public FlowExecutor flowExecutor() {
		return getFlowExecutorBuilder(flowRegistry()).build();
	}
	
	@Bean
	public FlowBuilderServices flowBuilderServices() {
		return getFlowBuilderServicesBuilder().
				setViewFactoryCreator(mvcViewFactoryCreator()).setDevelopmentMode(true).build();
	}
	
	@Bean
	public MvcViewFactoryCreator mvcViewFactoryCreator() {
		MvcViewFactoryCreator factoryCreator = new MvcViewFactoryCreator();
		factoryCreator.setViewResolvers(
				Collections.singletonList(this.webMvcConfig.viewResolver()));
		factoryCreator.setUseSpringBeanBinding(true);
		return factoryCreator;
	}

}

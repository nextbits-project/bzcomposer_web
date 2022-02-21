package com;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.Ordered;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
@PropertySource("classpath:application.properties")
@ComponentScan("com.bzcomposer.*")
public class Configurations implements WebMvcConfigurer {

	/*@Override
	 public void addViewControllers( ViewControllerRegistry registry ) {
	        registry.addViewController( "/" ).setViewName( "forward:/welcomescreen" );
	        registry.setOrder( Ordered.HIGHEST_PRECEDENCE );
	       // super.addViewControllers( registry );
	        
	        
	    }*/
	
}

package com.anand.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurationSupport;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.thymeleaf.spring5.SpringTemplateEngine;
import org.thymeleaf.spring5.templateresolver.SpringResourceTemplateResolver;
import org.thymeleaf.spring5.view.ThymeleafViewResolver;


@Configuration
@EnableWebMvc
@ComponentScan("com.anand")
public class EmployeeConfig extends WebMvcConfigurationSupport {

    @Bean
    public InternalResourceViewResolver viewResolver()
    {
        InternalResourceViewResolver resource= new InternalResourceViewResolver();
        resource.setPrefix("/WEB-INF/views/");
        resource.setSuffix(".jsp");
        return resource;
    }


}
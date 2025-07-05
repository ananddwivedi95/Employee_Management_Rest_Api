package com.anand.config;

import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

public class EmployeeInitilizer extends AbstractAnnotationConfigDispatcherServletInitializer {
    @Override
    protected Class<?>[] getRootConfigClasses() {
        return new Class[0];
    }

    @Override
    protected Class<?>[] getServletConfigClasses() {
        Class<?>[] nclass={ EmployeeConfig.class };
        return nclass;
    }

    @Override
    protected String[] getServletMappings() {
        String[] mapping={"/"};
        return mapping;
    }
}

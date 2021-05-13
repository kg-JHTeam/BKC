package com.bkc.filter;


import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

import org.springframework.security.config.annotation.web.configurers.oauth2.client.OAuth2ClientConfigurer;

@WebFilter("/*")
public class TestFilter implements Filter {

    public TestFilter() {
    }

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		//System.out.println( ((HttpServletRequest) request).getRequestURL() );
		chain.doFilter(request, response);
	}

	public void init(FilterConfig fConfig) throws ServletException {
		
	}

	@Override
	public void destroy() {
		
	}

}

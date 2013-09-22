//package de.edunet.main.services;
//
//import java.util.List;
//
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.web.method.support.HandlerMethodArgumentResolver;
//import org.springframework.web.servlet.ViewResolver;
//import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
//import org.springframework.web.servlet.config.annotation.EnableWebMvc;
//import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
//import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
//import org.springframework.web.servlet.view.InternalResourceViewResolver;
//
//
//	/**
//	 * Java-based Spring MVC configuration.
//	 */
//	@Configuration
//	@EnableWebMvc
//	public class WebConfiguration extends WebMvcConfigurerAdapter {
//
//	    /**
//	     * Add a view resolver to enable 'logical' view names in client code.
//	     * @return
//	     */
//	    @Bean
//	    public ViewResolver viewResolver() {
//	        InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
//	        viewResolver.setPrefix("/WEB-INF/views/");
//	        viewResolver.setSuffix(".jsp");
//	        return viewResolver;
//	    }
//
//	    /**
//	     * Adds the MeteorArgumentResolver to Spring's list of argument resolvers.
//	     * @param argumentResolvers
//	     */
//	    @Override
//	    public void addArgumentResolvers(List<HandlerMethodArgumentResolver> argumentResolvers) {
//	        argumentResolvers.add(new MeteorAtmosphereResourceResolver());
//	    }
//
//	    /**
//	     * Adds a static resource handler to optimise the serving of javascript files.
//	     * @param registry
//	     */
//	    @Override
//	    public void addResourceHandlers(ResourceHandlerRegistry registry) {
//	        registry.addResourceHandler("/jquery/**").addResourceLocations("/jquery/");
//	    }
//
//	    /**
//	     * Forward unhandled requests to the containers default servlet.
//	     * @param configurer
//	     */
//	    @Override
//	    public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
//	        configurer.enable();
//	    }
//}

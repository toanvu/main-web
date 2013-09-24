package de.edunet.main.services;

import org.atmosphere.cpr.BroadcasterFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;

import de.edunet.main.models.message.MessageHandler;

/**
 * Java-based Spring configuration.
 */
@Configuration
//@Import(WebConfiguration.class)
@ComponentScan(basePackages = "de.edunet.main", excludeFilters = @ComponentScan.Filter(Configuration.class))
public class ContextConfiguration {

	/**
     * A BroadcasterFactory (injected as a singleton) that enables client code to look up broadcasters.
     * @return
     */
    @Bean
    public BroadcasterFactory broadcasterFactory() {    	
        return BroadcasterFactory.getDefault();
    }
	
}

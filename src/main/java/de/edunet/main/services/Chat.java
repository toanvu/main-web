package de.edunet.main.services;

import java.io.IOException;

import org.atmosphere.config.service.AtmosphereHandlerService;
import org.atmosphere.cpr.AtmosphereResponse;
import org.atmosphere.handler.OnMessage;
import org.atmosphere.interceptor.AtmosphereResourceLifecycleInterceptor;
import org.atmosphere.interceptor.BroadcastOnPostAtmosphereInterceptor;
import org.codehaus.jackson.map.ObjectMapper;

import de.edunet.main.models.Data;

@AtmosphereHandlerService(path="/chat",
interceptors = { AtmosphereResourceLifecycleInterceptor.class,
                 BroadcastOnPostAtmosphereInterceptor.class
               })

public class Chat extends OnMessage<String>{
	
	private final ObjectMapper mapper = new ObjectMapper();
	 
	@Override
    public void onMessage(AtmosphereResponse response, String message) throws IOException {
        response.write(mapper.writeValueAsString(mapper.readValue(message, Data.class)));
    }
}

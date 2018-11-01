package de.dplatz.sample.heroku;

import javax.ejb.Stateless;
import javax.json.Json;
import javax.json.JsonObject;
import javax.json.JsonObjectBuilder;
import javax.ws.rs.GET;
import javax.ws.rs.Path;

@Stateless
@Path("env")
public class EnvironmentResource {

	// Call with "curl -i http://localhost/resources/env"
	@GET
	public JsonObject getEnv() {
		System.out.println("+ getEnv @" + System.currentTimeMillis());

		JsonObjectBuilder envEntriesBuilder = Json.createObjectBuilder();
		System.getenv().entrySet().forEach(e -> envEntriesBuilder.add(e.getKey(), e.getValue()));

		return envEntriesBuilder.build();
	}
}

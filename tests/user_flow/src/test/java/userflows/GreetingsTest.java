package userflows;

import io.restassured.RestAssured;

import io.restassured.http.ContentType;
import io.restassured.response.Response;

import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.DisplayName;

import static io.restassured.RestAssured.*;
import static org.hamcrest.Matchers.*;

import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

import static org.junit.jupiter.api.Assertions.assertEquals;


public class GreetingsTest {
	
	@BeforeAll
	public static void setup() {
		String greetingScheme = System.getenv("GREETING_SCHEME");
		String greetingHost = System.getenv("GREETING_HOST");
		String greetingPort = System.getenv("GREETING_PORT");
		
		if(greetingHost == null || greetingPort == null) {
			throw new IllegalStateException("Environment variables GREETING_SCHEME["+greetingScheme+"], HOST["+greetingHost+"] and PORT["+greetingPort+"] must be set");
		}
		RestAssured.baseURI = greetingScheme + "://" + greetingHost + ":" + greetingPort;
	}
	
	@DisplayName("Get all greetings returns list of Greetings")
	@Test
	void testGetAllGreetingsReturnsListOfGreetings() {
		Response response = get("/greetings");
		response.prettyPrint();
		given()
			.contentType(ContentType.JSON)
		.when()
			.get("/greetings")
		.then()
			.statusCode(200)
			.contentType(ContentType.JSON)
			.body("$",  hasSize(greaterThanOrEqualTo(1)))
			.body("[0]", hasKey("id"))
			.body("[0].id", isA(Integer.class))
			.body("[0]", hasKey("message"))
			.body("[0].message", allOf(isA(String.class), not(emptyString())))
			.body("[0]", anyOf(
							allOf(hasKey("language"),
								hasEntry(is("language"), allOf(isA(String.class), not(emptyString())))),
							not(hasKey("language")
						)
			))
			.body("[0]", anyOf(
							allOf(hasKey("languageFamily"),
									hasEntry(is("languageFamily"), allOf(isA(String.class), not(emptyString())))),
					not(hasKey("languageFamily")
				)

			))
			.body("[0]", anyOf(
					allOf(hasKey("languageFamilySubgroup"),
							hasEntry(is("languageFamilySubgroup"), allOf(isA(String.class), not(emptyString())))),
					not(hasKey("languageFamilySubgroup")
				)

			))
			.body("[0]", anyOf(
					allOf(hasKey("formal"),
							hasEntry(is("formal"), allOf(isA(Boolean.class), not(emptyString())))),
					not(hasKey("formal")
				)

			))
			.body("[0]", anyOf(
					allOf(hasKey("timeOfDay"),
							hasEntry(is("timeOfDay"), allOf(isA(Boolean.class), not(emptyString())))),
					not(hasKey("timeOfDay")
				)

			))
			.body("[0]", anyOf(
					allOf(hasKey("createdAt"),
							hasEntry(is("createdAt"), allOf(isA(String.class), not(emptyString())))),
					not(hasKey("createdAt")
				)

			))
			.body("[0]", anyOf(
					allOf(hasKey("updatedAt"),
							hasEntry(is("updatedAt"), allOf(isA(String.class), not(emptyString())))),
					not(hasKey("updatedAt")
				)

			));
			
			
		
	}
	
	@DisplayName("Get all greetings returns list of Greetings with unique Ids")
	@Test
	void testGetAllGreetingsReturnsListOfGreetingsWithUniqueIDs() {
		List<Integer> ids = given()
			.contentType(ContentType.JSON)
		.when()
			.get("/greetings")
		.then()
			.extract().jsonPath().getList("id", Integer.class);
		Set<Object> uniqueIds = ids.stream().collect(Collectors.toSet());
        assertEquals(ids.size(), uniqueIds.size(), "All ids should be unique");
	}

}

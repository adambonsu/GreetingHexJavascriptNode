package userflows;

import io.restassured.RestAssured;
import io.restassured.http.ContentType;
import io.restassured.response.Response;

import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.DisplayName;

import static io.restassured.RestAssured.*;
import static org.hamcrest.Matchers.*;


public class GreetingsTest {
	
	@BeforeAll
	public static void setup() {
		RestAssured.baseURI = "http://localhost:3000";
	}
	
	@DisplayName("Get all greetings")
	@Test
	void testGetAllGreetings() {
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
							hasKey("language"),
							not(hasKey("language")
						)
			))
			.body("[0]", anyOf(
					hasKey("languageFamily"),
					not(hasKey("languageFamily")
				)

			))
			.body("[0]", anyOf(
					hasKey("languageFamilySubgroup"),
					not(hasKey("languageFamilySubgroup")
				)

			))
			.body("[0]", anyOf(
					hasKey("formal"),
					not(hasKey("formal")
				)

			))
			.body("[0]", anyOf(
					hasKey("createdAt"),
					not(hasKey("createdAt")
				)

			))
			.body("[0]", anyOf(
					hasKey("updatedAt"),
					not(hasKey("updatedAt")
				)

			));
			
			
		
	}

}

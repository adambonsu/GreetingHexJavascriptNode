const request = require("supertest");
const app = require("../../app");
const endpointUrl = "/greetings";

describe("Greeting endpoint", () => {
  test("GET /greetings returns 200 with list of greetings", async () => {
    const response = await request(app).get(endpointUrl);
    expect(response.statusCode).toBe(200);
    expect(typeof response.body).toBe("object");
    response.body.forEach((greeting) => {
      expect(greeting).toHaveProperty("message");
    });
    expect(response.body.length).toBeGreaterThan(0);
  });
});

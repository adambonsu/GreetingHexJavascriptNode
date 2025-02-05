const request = require("supertest");
const app = require("../../app");
const endpointUrl = "/greeting";

describe(endpointUrl, () => {
  test("GET" + endpointUrl, async () => {
    const response = await request(app).get(endpointUrl);
    expect(response.statusCode).toBe(200);
    expect(typeof response.body).toBe("object");
    response.body.forEach((greeting) => {
      expect(greeting).toHaveProperty("greeting");
    });
    expect(response.body.length).toBeGreaterThan(0);
  });
});

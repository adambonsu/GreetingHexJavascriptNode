const greetingController = require("../../controllers/greeting.controller");
const httpMocks = require("node-mocks-http");

let req, res, next;

beforeEach(() => {
  req = httpMocks.createRequest();
  res = httpMocks.createResponse();
  next = null;
});

describe("GreetingController.getGreeting", () => {
  it("should return a response code of 200", async () => {
    await greetingController.getGreeting(req, res, next);
    expect(res.statusCode).toBe(200);
  });
  it("should return list of Greetings", async () => {
    await greetingController.getGreeting(req, res, next);
    expect(res._getJSONData().length).toBeGreaterThan(0);
  });
});

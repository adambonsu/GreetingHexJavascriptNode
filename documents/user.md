# General information:

- Title: user
- Description: User greetings

# Servers:

- URL: http://localhost:8080/v1
- Description: Developer Server

# Security

===

- Type: http
- Name: BearerAuth
- Schema: bearer
- bearerFormat: JWT

## Path:

- Name: user/{id}/greetings
- HTTP operation: get
- Summary: get all user greetings
- Security: BearerAuth

### Response body definitions

- Status code: 200
- Status message: Ok
- Content Type: application/json
- Schema: array {id, greeting, created, modified, languageFamily, language, information}

---

- Status code: 401
- Status message: Unauthorised
- Content Type: application/json
- Schema: code_error, message

---

- Status code: 404
- Status message: Not found
- Content Type: application/json
- Schema: code_error, message

---

- Status code: 500
- Status message: Server error
- Content Type: application/json
- Schema: code_error, message

## Path:

- Name: user/{id}/greeting
- HTTP operation: get
- Summary: get a single user greeting
- Security: BearerAuth

### Response body definitions

- Status code: 200
- Status message: Ok
- Content Type: application/json
- Schema: id, greeting, created, modified, languageFamily, language, information

---

- Status code: 401
- Status message: Unauthorised
- Content Type: application/json
- Schema: code_error, message

---

- Status code: 404
- Status message: Not found
- Content Type: application/json
- Schema: code_error, message

---

- Status code: 500
- Status message: Server error
- Content Type: application/json
- Schema: code_error, message

# General information:

- Title: Authentication
- Description: User Authentication for login api

# Servers:

- URL: http://localhost:8080/v1
- Description: Developer Server

## Path: login

- Name: login
- HTTP operation: post
- Summary: Authenticate user
- Security: none

### Request body definitions:

- Content Type: application/json
- Required: all
- Schema: email, password

### Response body definitions

- Status code: 200
- Status message: Ok
- Content Type: application/json
- Schema: scope, expires_in, refresh_token, access_token, developer.email

---

- Status code: 400
- Status message: Bad request
- Content Type: application/json
- Schema: code_error, message

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

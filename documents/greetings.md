# General information:

- Title: Greetings
- Description: List of greetings

# Servers:

- URL: http://localhost:8080/v1
- Description: Developer Server

# Security:

- Type: http
- Name: BearerAuth
- Schema: bearer
- bearerFormat: JWT

## Path: Get all greetings

- Name: greetings
- HTTP operation: get
- Summary: Get all greetings
- Security: BearerAuth

### Parameters definitions

- Name: Locale
- Where: Query
- Required: yes
- Schema: string

- Name: Language
- Where: Query
- Required: yes
- Schema: string

- Name: Formality
- Where: Query
- Required: yes
- Schema: string

### Response body definitions

- Status code: 200
- Status message: Ok
- Content Type: application/json
- Schema: array {id, message, createdAt, updatedAt, formal, languageFamily, language, information}

---

- Status code: 401
- Status message: Unauthorised
- Content Type: application/json
- Schema: code_error, message

---

- Status code: 500
- Status message: Server error
- Content Type: application/json
- Schema: code_error, message

## Path: Get one greeting

- Name: greeting/{id}
- HTTP operation: get
- Summary: Get greeting by id
- Security: BearerAuth

### Parameters definitions

- Name: id
- Where: path
- Required: true
- Schema: integer

### Response body definitions

- Status code: 200
- Status message: Ok
- Content Type: application/json
- Schema: array {id, message, createdAt, updatedAt, formal, languageFamily, language, information}

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

## Path: Create a new greeting

- Name: greeting
- HTTP operation: post
- Summary: Create a greeting
- Security: BearerAuth

### Request body definitions:

- Content Type: application/json
- Required: all
- Schema: greeting, createdAt, updatedAt, formal, languageFamily, language, information

### Response body definitions

- Status code: 201
- Status message: Ok
- Content Type: application/json
- Schema: id, message, createdAt, updatedAt, formal, languageFamily, language, information

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

- Status code: 500
- Status message: Server error
- Content Type: application/json
- Schema: code_error, message

## Path: Update existing greeting

- Name: greeting/{id}
- HTTP operation: put
- Summary: Update greeting by id
- Security: BearerAuth

### Parameters definitions

- Name: id
- Where: path
- Required: true
- Schema: integer

### Request body definitions:

- Content Type: application/json
- Required: all
- Schema: greeting, createdAt, updatedAt, formal, languageFamily, language, information

### Response body definitions

- Status code: 202
- Status message: Accepted
- Content Type: application/json
- Schema: array {id, message, createdAt, updatedAt, formal, languageFamily, language, information}

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

## Path: Delete existing greeting

- Name: greeting/{id}
- HTTP operation: delete
- Summary: Delete greeting by id
- Security: BearerAuth

### Parameters definitions

- Name: id
- Where: path
- Required: true
- Schema: integer

### Response body definitions

- Status code: 204
- Status message: No content
- Content Type: none
- Schema: none

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

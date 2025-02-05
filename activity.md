```bash
cd ~/Documents/projects/node/
mkdir GreetingHexJavascriptNode
cd GreetingHexJavascriptNode/
npm init --yes

```

```
Wrote to /Users/bonsuadam/Documents/projects/node/GreetingHexJavascriptNode/package.json:

{
  "name": "todo-tdd",
  "version": "1.0.0",
  "main": "index.js",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  "keywords": [],
  "author": "",
  "license": "ISC",
  "description": ""
}
```

```bash
npm install express --save

```

Write out the first code in our project

```bash
touch app.js
```

app.js

```js
const express = require("express");
const app = express();

app.get("/", (req, res) => {
  res.send("Hello World!");
});

app.listen(3000, () => {
  console.log("Server is now running");
});
```

Serve the app

```bash
node app.js
```

Update app so it serves json

```js
const express = require("express");
const app = express();

app.get("/", (req, res) => {
  res.json("Greetings");
});

app.listen(3000, () => {
  console.log("Server is now running");
});
```

Install jest

```bash
npm install jest --save-dev
```

Run all tess

```bash
npm run test
```

## Writing the model

Install mongoose - create a model schema and connect to mongodb

```bash
npm install mongoose --save
```

Install node-mocks-http

```bash
npm install node-mocks-http --save
```

## Integration testing

Supertest

```bash
npm install supertest --save-dev
```

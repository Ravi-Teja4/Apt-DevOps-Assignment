#!/bin/bash
# Update OS
yum update -y

# Install Node.js
curl -sL https://rpm.nodesource.com/setup_18.x | bash -
yum install -y nodejs

# Create app directory
mkdir -p /var/www/api
cd /var/www/api

# Create app.js
cat <<EOF > app.js
const express = require("express");
const app = express();

app.get("/", (req, res) => {
  console.log("Root endpoint called");
  res.send("Server is running!");
});

app.get("/health", (req, res) => {
  console.log("Health check endpoint called");
  res.send("ok");
});

app.listen(8080, () => {
  console.log("Server running on port 8080");
});
EOF

# Create package.json
cat <<EOF > package.json
{
  "name": "simple-api",
  "version": "1.0.0",
  "main": "app.js",
  "dependencies": {
    "express": "^4.18.0"
  }
}
EOF

# Install dependencies
npm install

nohup node app.js > server.log 2>&1 &

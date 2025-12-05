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
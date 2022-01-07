const express = require("express");
const cors = require("cors");
const bodyParser = require('body-parser');
const app = express();

var corsOptions = {
  origin: "http://localhost:8585"
};
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({
    extended: true
}));
app.use(cors(corsOptions));



// simple route
app.get("/", (req, res) => {
  res.json({ message: "Welcome to application." });
});
require('./app/routes/route')(app);

// set port, listen for requests
const PORT = process.env.PORT || 8585;
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}.`);
});
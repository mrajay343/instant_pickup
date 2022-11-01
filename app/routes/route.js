const api = require("../controllers/api.js");
module.exports = function (app) {
    app.route('/api/getPrice').post(api.getPrice);
};
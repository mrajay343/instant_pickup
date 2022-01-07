const api = require("../controllers/api.js");
module.exports = function (app) {
    app.route('/api/add_Sale').post(api.add_Sale);
    app.route('/api/sells_stats').get(api.sells_stats);
};
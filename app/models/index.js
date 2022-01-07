const config = require("../config/db.js");

const Sequelize = require("sequelize");
const sequelize = new Sequelize(
  config.DB,
  config.USER,
  config.PASSWORD,
  {
    host: config.HOST,
    dialect: config.dialect,
    operatorsAliases: false,

    pool: {
      max: config.pool.max,
      min: config.pool.min,
      acquire: config.pool.acquire,
      idle: config.pool.idle
    }
  }
);

const db = {};

db.Sequelize = Sequelize;
db.sequelize = sequelize;

db.sales = require("../models/sales.js")(sequelize, Sequelize);
// db.sequelize.sync({force: true}).then(() => {
//     console.log('Drop and Resync Db');
//   });
module.exports = db;

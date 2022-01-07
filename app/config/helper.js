const jsonData = require('../config/jsonData');
const db = require("../models");
const { body, validationResult } = require('express-validator');
const users = db.users;
const Op = db.Sequelize.Op;
module.exports={
    isvaild: async function (required, non_required, res) {
        let message = '';
        let empty = [];
        for (let key in required) {
            if (required.hasOwnProperty(key)) {
                if (required[key] == undefined || required[key] == '') {
                    empty.push(key);
                }
            }
        }
        if (empty.length != 0) {
            message = empty.toString();
            if (empty.length > 1) {
                message += " fields are required"
            } else {
                message += " field is required"
            }
            throw message;
        }
        if (required.hasOwnProperty('security_key')) {
            if (required.security_key != "segwitz@123$") {
                throw "Invalid security key";
            }
        }
        const marge_object = Object.assign(required, non_required);
        return marge_object;
    },
}
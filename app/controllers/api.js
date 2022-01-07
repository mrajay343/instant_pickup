const db = require("../models");
const sales = db.sales;
const helper = require("../config/helper");
const jsonData = require('../config/jsonData');
const sequelize = require('sequelize');
const moment = require('moment');
const Op = db.Sequelize.Op;

module.exports = {
	add_Sale: async function (req, res) {
		try {
			const required = {
				security_key: req.headers.security_key,
				username: req.body.username,
				amount: req.body.amount,
				date: req.body.date,
			};
			const non_required = {
				
			};
			let requestdata = await helper.isvaild(required, non_required, res);
			
			if(requestdata) {   
				const add_Sale= await sales.create(requestdata);
				if (add_Sale) {
					let msg = 'Added successfully';
					jsonData.true_status(res, {}, msg)
				} else {
					let msg = 'Try again Sometime';
					jsonData.invalid_status(res, msg)
				}
			}
		}
		catch (error) {
			// console.log(error);
			jsonData.wrong_status(res, error)
		}
	},
	sells_stats: async function(req, res) {
        try {
            const required = {
                security_key: req.headers.security_key,
				type: req.query.type,
            };
            const non_required = {
            };
            let requestdata = await helper.isvaild(required, non_required, res);
			var startDate;
			var endDate;
			if(requestdata.type=='daily'){
				startDate=parseInt(moment().startOf('day')/1000);
				endDate= parseInt(moment().endOf('day')/1000) ;
			}else if (requestdata.type=='weekly'){
				startDate=parseInt(moment().subtract(7, 'days')/1000);
				endDate= parseInt(moment().valueOf()/1000) ;
			}else if (requestdata.type=='monthly'){
				startDate=parseInt(moment().subtract(1, 'month')/1000);
				endDate= parseInt(moment().valueOf()/1000) ;
			}else{
				startDate=0;
				endDate=0;
			}
			var all_sales = await sales.findAll({
					attributes:[ [sequelize.fn('sum', sequelize.col('amount')), 'total'] ], 
					where:{
						date:{
							[Op.between]:[startDate,endDate]
						} 
					} ,
				}
			);
			let msg = 'Sales Stats';
			jsonData.true_status(res, all_sales, msg)
        } catch (error) {
			// console.log(error);
            jsonData.wrong_status(res, error)
        }
    },
	
};
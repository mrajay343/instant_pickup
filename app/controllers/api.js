const db = require("../models");
const sales = db.sales;
const helper = require("../config/helper");
const jsonData = require('../config/jsonData');
const sequelize = require('sequelize');
const moment = require('moment');
const Op = db.Sequelize.Op;
const Joi = require('joi');
module.exports = {
	getPrice: async function (req, res) {
		try {
			const schema = Joi.object({
				mileage:Joi.number().required(),
				congestionCharge:Joi.boolean().required(),
				driveTime:Joi.number().required(),
				floors:Joi.number().required(),
				lateCharge:Joi.boolean().required(),
				carebonOffset:Joi.boolean().required(),
				vanType:Joi.string().required().valid('Small','Medium','Large','Lutton'),
			})
			const requestdata = await schema.validateAsync({
					mileage: req.body.mileage,
					congestionCharge: req.body.congestionCharge,
					driveTime: req.body.driveTime,
					floors: req.body.floors,
					lateCharge: req.body.lateCharge,
					carebonOffset: req.body.carebonOffset,
					vanType: req.body.vanType
				}
			)
				const data = {
					Small:{
						loadUnloadMin:60,
						hourlyRateValue:50,
						helperCharge:20,
						pmf:1.1,
						congestionChargeValue:15,
						floorPrice:15
					},
					Medium:{
						loadUnloadMin:60,
						hourlyRateValue:60,
						helperCharge:20,
						pmf:1.1,
						congestionChargeValue:15,
						floorPrice:15
					},
					Large:{
						loadUnloadMin:150,
						hourlyRateValue:70,
						helperCharge:20,
						pmf:1.1,
						congestionChargeValue:15,
						floorPrice:15
					},
					Lutton:{
						loadUnloadMin:180,
						hourlyRateValue:90,
						helperCharge:20,
						pmf:1.1,
						congestionChargeValue:15,
						floorPrice:15
					}
				}
				const carebonOffsetValue = 5
				const {mileage,congestionCharge, driveTime, floors, lateCharge, carebonOffset, vanType }= requestdata
				console.log(vanType)
				const vanPriceAttr = data[vanType]
				console.log(vanPriceAttr)
				const {loadUnloadMin, hourlyRateValue, helperCharge,pmf,congestionChargeValue, floorPrice  } = vanPriceAttr
				const time =  (driveTime < 60) ? loadUnloadMin + (loadUnloadMin- driveTime ) : loadUnloadMin + (loadUnloadMin - driveTime )
				const totalTIme = Math.round( (time/60 )*2)/2	// Conerted to hour and round the value
				const driverCharge = totalTIme * hourlyRateValue 
				const helpercharge  = totalTIme * helperCharge
				const price = parseInt(driverCharge) + parseInt(helpercharge) +  parseInt(floorPrice * floors ) + parseInt((congestionCharge) ? congestionChargeValue : 0 ) + parseInt( (lateCharge) ? hourlyRateValue /4 : 0) + parseInt((carebonOffset) ? carebonOffsetValue : 0) + parseInt(mileage * pmf)
				let msg = 'Final Price';
				jsonData.true_status(res, price, msg)	
			
		}
		catch (error) {
			console.log(error);
			jsonData.wrong_status(res, error)
		}
	},
	
};
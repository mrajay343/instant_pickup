module.exports = function(sequelize, DataTypes) {
	return sequelize.define('sales', {
		id: {
			type: DataTypes.BIGINT,
			allowNull: false,
			primaryKey: true,
			autoIncrement: true,
			field: 'id'
		},
		username: {
			type: DataTypes.STRING(255),
			allowNull: true,
			defaultValue: '',
			field: 'username'
		},
        amount: {
			type: DataTypes.INTEGER,
			allowNull: true,
			defaultValue: 0,
			field: 'amount'
		},
        date: {
			type: DataTypes.INTEGER,
			allowNull: true,
			defaultValue: 0,
			field: 'date'
		},
		
		status: {
			type: DataTypes.INTEGER(4),
			allowNull: false,
			defaultValue: '1',
			field: 'status'
		},
        createdAt: {
			type: DataTypes.DATE,
			allowNull: false,
			defaultValue: sequelize.literal('CURRENT_TIMESTAMP'),
			field: 'created_at'
		},
		updatedAt: {
			type: DataTypes.DATE,
			allowNull: false,
			defaultValue: sequelize.literal('CURRENT_TIMESTAMP'),
			field: 'updated_at'
		}
	}, {
		tableName: 'sales'
	});
};

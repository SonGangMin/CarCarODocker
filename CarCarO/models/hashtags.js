const Sequelize = require('sequelize');
module.exports = function(sequelize, DataTypes) {
  return sequelize.define('hashtags', {
    id: {
      autoIncrement: true,
      type: DataTypes.BIGINT,
      allowNull: false,
      primaryKey: true
    },
    cars_num: {
      type: DataTypes.BIGINT,
      allowNull: false,
      references: {
        model: 'cars',
        key: 'num'
      }
    },
    cars_hashtag: {
      type: DataTypes.STRING(100),
      allowNull: true
    }
  }, {
    sequelize,
    tableName: 'hashtags',
    timestamps: false,
    indexes: [
      {
        name: "PRIMARY",
        unique: true,
        using: "BTREE",
        fields: [
          { name: "id" },
        ]
      },
      {
        name: "hashtags_FK",
        using: "BTREE",
        fields: [
          { name: "cars_num" },
        ]
      },
    ]
  });
};

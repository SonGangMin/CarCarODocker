const Sequelize = require('sequelize');
module.exports = function(sequelize, DataTypes) {
  return sequelize.define('boards', {
    postId: {
      autoIncrement: true,
      type: DataTypes.BIGINT,
      allowNull: false,
      primaryKey: true
    },
    title: {
      type: DataTypes.STRING(100),
      allowNull: false
    },
    content: {
      type: DataTypes.STRING(1000),
      allowNull: false
    },
    user_id: {
      type: DataTypes.STRING(100),
      allowNull: false,
      references: {
        model: 'users',
        key: 'id'
      }
    },
    grade: {
      type: DataTypes.INTEGER,
      allowNull: false,
      defaultValue: 1
    },
    count: {
      type: DataTypes.INTEGER,
      allowNull: false,
      defaultValue: 0
    },
    views: {
      type: DataTypes.INTEGER,
      allowNull: false,
      defaultValue: 0
    },
    car_num: {
      type: DataTypes.BIGINT,
      allowNull: true,
      references: {
        model: 'cars',
        key: 'num'
      }
    }
  }, {
    sequelize,
    tableName: 'boards',
    timestamps: true,
    indexes: [
      {
        name: "PRIMARY",
        unique: true,
        using: "BTREE",
        fields: [
          { name: "postId" },
        ]
      },
      {
        name: "boards_FK",
        using: "BTREE",
        fields: [
          { name: "user_id" },
        ]
      },
      {
        name: "boards_FK_1",
        using: "BTREE",
        fields: [
          { name: "car_num" },
        ]
      },
    ]
  });
};

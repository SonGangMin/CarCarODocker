const Sequelize = require('sequelize');
module.exports = function(sequelize, DataTypes) {
  return sequelize.define('users', {
    id: {
      type: DataTypes.STRING(100),
      allowNull: false,
      primaryKey: true
    },
    no: {
      autoIncrement: true,
      type: DataTypes.BIGINT,
      allowNull: false,
      unique: "users_UN2"
    },
    email: {
      type: DataTypes.STRING(100),
      allowNull: false
    },
    name: {
      type: DataTypes.STRING(100),
      allowNull: false
    },
    password: {
      type: DataTypes.STRING(255),
      allowNull: false
    },
    tel: {
      type: DataTypes.STRING(13),
      allowNull: false
    },
    birth: {
      type: DataTypes.STRING(10),
      allowNull: true
    },
    provider: {
      type: DataTypes.ENUM('local','kakao'),
      allowNull: false,
      defaultValue: "local"
    },
    grade: {
      type: DataTypes.INTEGER,
      allowNull: false,
      defaultValue: 1
    }
  }, {
    sequelize,
    tableName: 'users',
    timestamps: true,
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
        name: "users_UN",
        unique: true,
        using: "BTREE",
        fields: [
          { name: "email" },
          { name: "tel" },
        ]
      },
      {
        name: "users_UN2",
        unique: true,
        using: "BTREE",
        fields: [
          { name: "no" },
        ]
      },
    ]
  });
};

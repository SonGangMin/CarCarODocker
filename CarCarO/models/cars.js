const Sequelize = require('sequelize');
module.exports = function(sequelize, DataTypes) {
  return sequelize.define('cars', {
    num: {
      autoIncrement: true,
      type: DataTypes.BIGINT,
      allowNull: false,
      primaryKey: true
    },
    carNum: {
      type: DataTypes.STRING(255),
      allowNull: false,
      unique: "cars_UN"
    },
    user_id: {
      type: DataTypes.STRING(100),
      allowNull: false,
      references: {
        model: 'users',
        key: 'id'
      }
    },
    from: {
      type: DataTypes.STRING(255),
      allowNull: false
    },
    brand: {
      type: DataTypes.STRING(255),
      allowNull: false
    },
    model: {
      type: DataTypes.STRING(255),
      allowNull: false
    },
    mile: {
      type: DataTypes.BIGINT,
      allowNull: false
    },
    year: {
      type: DataTypes.BIGINT,
      allowNull: false
    },
    fuel: {
      type: DataTypes.STRING(100),
      allowNull: false
    },
    trans: {
      type: DataTypes.STRING(100),
      allowNull: false
    },
    seater: {
      type: DataTypes.STRING(255),
      allowNull: false
    },
    disp: {
      type: DataTypes.STRING(255),
      allowNull: false
    },
    type: {
      type: DataTypes.STRING(100),
      allowNull: false
    },
    method: {
      type: DataTypes.STRING(100),
      allowNull: false
    },
    color: {
      type: DataTypes.STRING(100),
      allowNull: false
    },
    area: {
      type: DataTypes.STRING(100),
      allowNull: false
    },
    tel: {
      type: DataTypes.STRING(100),
      allowNull: false
    },
    picture: {
      type: DataTypes.JSON,
      allowNull: false
    },
    roof: {
      type: DataTypes.STRING(255),
      allowNull: false
    },
    nav: {
      type: DataTypes.STRING(255),
      allowNull: false
    },
    key: {
      type: DataTypes.STRING(255),
      allowNull: false
    },
    light: {
      type: DataTypes.STRING(255),
      allowNull: false
    },
    sensor: {
      type: DataTypes.STRING(255),
      allowNull: false
    },
    camera: {
      type: DataTypes.STRING(255),
      allowNull: false
    },
    box: {
      type: DataTypes.STRING(255),
      allowNull: false
    },
    leather: {
      type: DataTypes.STRING(255),
      allowNull: false
    },
    heated: {
      type: DataTypes.STRING(255),
      allowNull: false
    },
    airbag: {
      type: DataTypes.STRING(255),
      allowNull: false
    },
    etc: {
      type: DataTypes.STRING(255),
      allowNull: true
    },
    hashtag: {
      type: DataTypes.STRING(100),
      allowNull: true
    },
    likes_count: {
      type: DataTypes.INTEGER,
      allowNull: true,
      defaultValue: 0
    },
    price: {
      type: DataTypes.BIGINT,
      allowNull: false
    },
    status: {
      type: DataTypes.INTEGER,
      allowNull: false,
      defaultValue: 1
    },
    recommends: {
      type: DataTypes.INTEGER,
      allowNull: false,
      defaultValue: 0
    }
  }, {
    sequelize,
    tableName: 'cars',
    timestamps: true,
    indexes: [
      {
        name: "PRIMARY",
        unique: true,
        using: "BTREE",
        fields: [
          { name: "num" },
        ]
      },
      {
        name: "cars_UN",
        unique: true,
        using: "BTREE",
        fields: [
          { name: "carNum" },
        ]
      },
      {
        name: "cars_FK",
        using: "BTREE",
        fields: [
          { name: "user_id" },
        ]
      },
    ]
  });
};

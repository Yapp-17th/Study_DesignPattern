module.exports = {
  presets: [
    ["@babel/preset-env", {
      "targets": {
        "browsers" : ["last 5 versions", "ie >= 11"]
      },
      "useBuiltIns": "usage",
      "corejs": 3,
      "shippedProposals": true
    }],
    '@babel/preset-react', 
  ],
  plugins: [
    '@babel/plugin-transform-runtime', // async await, regeneratorRuntimenot defined 이슈
    '@babel/plugin-proposal-class-properties' // 바벨 ES6 class 프로퍼티
  ]
};
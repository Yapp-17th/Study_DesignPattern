const path = require("path");
const webpack = require("webpack");
const HtmlWebpackPlugin = require('html-webpack-plugin');
const { CleanWebpackPlugin } = require('clean-webpack-plugin');

module.exports = {
  entry: "./src/index.js",
  mode: "development",
  module: {
    rules: [
      { // 바벨로더
        test: /\.(js|jsx)$/,
        exclude: /(node_modules|bower_components)/,
        loader: "babel-loader",
        options: { presets: ["@babel/env"] }
      },
      { // "style-loader", "css-loader"
        test: /\.css$/,
        use: ["style-loader", "css-loader"]
      }
    ]
  },
  resolve: { // resolve: 웹팩이 해석할 확장자를 지정. 
    extensions: ["*", ".js", ".jsx", ".mjs"] 
  },
  output: { // output: 번들링 된 결과물을 어디다 둘 것인지에 대한 설정이 가능.
    path: path.resolve(__dirname, "dist"),
    filename: "bundle.js"
  },
  devServer: { // webpack-dev-server의 옵션을 설정
    contentBase: path.join(__dirname, "dist"), // 정적 파일 경로 설정
    port: 3000,
    open: true,
    hotOnly: true, // devserver에서만 핫로딩 가능하게,
    after: (app, server) => {
      app.listen(3000, () => {
        console.log(path.resolve(__dirname, "dist"))
        console.log("3000 포트 스타트");
      })
    }
  },
  plugins: [
	new webpack.HotModuleReplacementPlugin(),
	new HtmlWebpackPlugin({
    template: './src/public/index.html', // 번들링된 JS를 주입하고 결과물을 옮길 대상이 되는 파일을 지정
  }),
	new CleanWebpackPlugin(),
]
};
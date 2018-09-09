const path = require("path");
const webpack = require("webpack");


module.exports = {
    context: path.resolve('src'),
    entry: {
        app: ['./index']
    },

    output: {
        path: path.resolve('dist'),
        filename: 'js/[name].js'
    },

    module: {
        rules: [
            {
                test: /\.elm$/,
                exclude: [
                    /elm-stuff/, /node_modules/
                ],
                use: 'elm-webpack-loader'
            }
        ],

        noParse: /\.elm$/
    },

    plugins: [new webpack.NoEmitOnErrorsPlugin()],
};

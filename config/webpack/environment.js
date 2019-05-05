const { environment } = require('@rails/webpacker')
const webpack = require('webpack')
const path = require('path')

module.exports = environment

environment.loaders.get("sass").use[3] = {
   loader: "sass-loader",
   options: {
     sourceMap: true,
     includePaths: [
       path.join('node_modules')
     ]
   }
}

environment.plugins.prepend(
  'Provide',
  new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    jquery: 'jquery'
  })
)

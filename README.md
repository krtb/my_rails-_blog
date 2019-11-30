# My Rails Blog
> A blog to explore new rails features along with unit, functional, and integration testing
> [Link to Live Site]()

# Tech Stack
* __Front-End__
  * _Styling_
    * SCSS / sass css 
    * Bootstrap 4
* __Back-End__
  * _Framework_
    * Rails
  * _Package Management_
    * NPM
    * YARN
    * Webpack
      * faster compilation with Foreman gem 
        * to Start Foreman running process
          * `foreman start -f Procfile.dev`
  * _Database_
    * Postgress
  * _Deployed On_
    * Heroku
* __Testing__
  * _tbd_

# Issue & Solution Documentation
* __Issue 1__
  * _Missing app/assets/javascript/application.js folder/file in Rails 6_
  * _Slow render on compilation of SCSS_
  * __Solution 1__
    * [Medium Blog Post](https://medium.com/@guilhermepejon/how-to-install-bootstrap-4-3-in-a-rails-6-app-using-webpack-9eae7a6e2832)
    * use & configure Webpack
    * `yarn add bootstrap@4.3.1 jquery popper.js`
    * import only styles that are needed, not entire Node folder
    * Created
      * javascript/stylesheets fodler
        * application.scss
          * `@import './bootstrap_custom.scss';`
        * bootstrap_custom.scss
          * `@import specific components`
        * javascript/packs
          * application.js
            * `import '../stylesheets/application'`
            * `import './bootstrap_custom.js'`
          * bootstrap_custom.js
            * `@import specific components`
    * Layouts
      * application.html.erb file
        * `<%= stylesheet_pack_tag 'application', media: 'all', 'data-turbolinks-track': 'reload' %>`
        * `<%= javascript_pack_tag 'application', 'data-turbolinks-track': 'reload' %> `
    * webpack/environment.js
      ```js
        const webpack = require('webpack')
      environment.plugins.append(
          'Provide',
          new webpack.ProvidePlugin({
              $: 'jquery',
              jQuery: 'jquery',
              Popper: ['popper.js', 'default']
          })
      )
      ```

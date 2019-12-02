# My Rails Blog
> A blog to explore new rails features along with unit, functional, and integration testing
> [Link to Live Site](https://my-rails-blogg.herokuapp.com/)

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
    * Babel
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
* __Issue #1__
  * _Missing app/assets/javascript/application.js folder/file in Rails 6_
  * _Slow render on compilation of SCSS_
  * __Solution #1__
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
* __Issue #2__
  * _Deploying PostgreSQL DB to Heroku_
  * __Soution #2__
    * _Research_
      * [Stack Overflow, "how to setup postgres db in Heroku"](https://stackoverflow.com/questions/14166210/how-to-setup-postgres-db-in-heroku)
    * _Implementation_
      * in terminal, from app
      * `heroku run rake db:migrate --app APPNAME`
* __Issue #3__
  * _Connecting PostgreSQL DB with Rails application_
  * __Solution #3__
    * _Research_
      * [Digital Ocean, "How To Set Up Ruby on Rails with Postgres"](https://www.digitalocean.com/community/tutorials/how-to-set-up-ruby-on-rails-with-postgres)
    * _Implementation_
      * in terminal, from app
      * `rails db:setup`
      * _Explanation of Command_
        * will create development and test databases
        * set owner to the user specified
        * create “schema_migrations” tables in each
        * table is used to record migrations to schemas and data
* __Issue #4__
  * _centering horizontal bootstrap4 columns_
    * __Solution #4__
      * _Research_
        * [StackOverflow, "Rails Bootstrap how to format form_for (width grid collapses)"](https://stackoverflow.com/questions/21710486/rails-bootstrap-how-to-format-form-for-width-grid-collapses)
        * [Bootstrap 4, Docs on Horizontal Centering](https://getbootstrap.com/docs/4.4/utilities/spacing/#horizontal-centering)
        * [FreeCodeCamp, "Learn the Bootstrap 4 Grid System in 10 Minutes"](https://www.freecodecamp.org/news/learn-the-bootstrap-4-grid-system-in-10-minutes-e83bfae115da/)
      * _Implementation_
        * in partial form
        * `<%= form_for @user, :html => {:class => "form-horizontal center"} do |f| %>...`
        * in html of form
        * `class="col-auto offset-sm-2"`
        * _Explanation_
          * uses a flexbox utility to vertically center the contents and changes .col to .col-auto so that your columns only take up as much space as needed.
        * html structure
        * _Explanation_
           ```html
           <!-- FIRST -->
           <div class="container" >
            
          <!-- SECOND -->
           <%= form_for(@article, :html => {class: "form-horizontal center", role: "form" }) do |f| %>
          <!-- THIRD -->
            <div class="control-label form-group row" >
          ```
          > Bootstrap 4 Rows (from FreeCodeCamp article)
            > - They have to be placed in containers.
            > - They are only used for containing columns. 
            > - The columns have to be children of the row.


# Resources
* [Rubular](https://rubular.com/)
  * for REGEX, regular expressions
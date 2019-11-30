# used to be ActiveRecord::Base, sublcassing from base

# rails provides us with (getters) and (setters) for all of our columns
# (rails console) command gives direct access to DB
# (Articles) will provide us with all, initially empty array
# (Article) will provide us with the attributes we gave our table
# (article = Article.new) creates a new Article instance
# id initially (nil) because not stored yet, only after sent to DB
# use dot notation to access attributes that you want to add (article.description)
# (article.save) to save to table
# Setter Method: can use (mass assignment instead) = article = Article.new(title: this is my second article, description: this is my second description)
# Setter Method: (Article.create(title: 'this is my third', description: 'this is my third description' )) ALSO inserts into DB
class Article < ApplicationRecord
    #ADD VALIDATIONS
    validates :title, presence: true, length: { minimum: 3, maximum: 50 }
    validates :description, presence: true, length: { minimum: 10, maximum: 300 }
end

#ERRORS
# article.errors.any?
# article.errors.full_messages

#EDIT
#article = Article.find(2)
# article.title = new
# article.save = saved to DB
# Article.all = see changed article stored in DB array
#CREATE
#article = Article.find(2)
# article.destroy = deletes 
# article.save = saved to DB
# Article.all = see changed article stored in DB arra


 class Article < ApplicationRecord

   belongs_to :user # Many side of One-To=-Many, is singular as One USER(singular) has_many ARTICLES(plural)

   validates :title, presence: true, length: {minimum: 3, maximum: 50}
   validates :description, presence: true, length: {minimum: 10, maximum: 300}
   validates :user_id, presence: true
 end
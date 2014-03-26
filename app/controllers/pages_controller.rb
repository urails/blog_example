class PagesController < ApplicationController
  def home
    @name = "Parker"
    @blog_posts = BlogPost.all
  end
end

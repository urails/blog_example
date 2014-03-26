class BlogPostsController < ApplicationController
  def index
    @blog_posts = BlogPost.all
    render json: @blog_posts
  end
  
  def new
    # raise params[:title]
  end
  
  def create
    @blog_post = BlogPost.new blog_post_params
    
    if @blog_post.save
      redirect_to "/blog_posts"
    else
      redirect_to "/blog_posts/new"
    end
  end
  
  private
  
  def blog_post_params
    params.require(:blog_post).permit(:title, :content)
  end
end















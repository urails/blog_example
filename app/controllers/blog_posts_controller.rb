class BlogPostsController < ApplicationController
  def index
    @blog_posts = BlogPost.all
  end
  
  def show
    @blog_post = BlogPost.find(params[:id])
  end

  def edit
    @blog_post = BlogPost.find(params[:id])
  end
  
  def update
    @blog_post = BlogPost.find(params[:id])
    
    if @blog_post.update(blog_post_params)
      flash[:success] = "Successfully Updated!"
      redirect_to blog_post_path(@blog_post)
    else
      redirect_to edit_blog_post_path(@blog_post)
    end
  end
  
  def destroy
    @blog_post = BlogPost.find(params[:id])
    @blog_post.destroy
    
    redirect_to blog_posts_path
  end
  
  def new
    @blog_post = BlogPost.new
  end
  
  def create
    @blog_post = BlogPost.new blog_post_params
    
    if @blog_post.save
      redirect_to blog_posts_path
    else
      render :new
    end
  end
  
  private
  
  def blog_post_params
    params.require(:blog_post).permit(:title, :content)
  end
end















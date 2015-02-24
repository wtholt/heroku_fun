class BlogsController < ApplicationController
 
  def index
    @blogs = Blog.all
    @jsonarray = [@blogs.as_json]
    respond_to do |format|
      format.json { render json: JSON.pretty_generate(@jsonarray)}
    end
  end

  def create
    @blog = Blog.new blog_params
  end

  def destroy
    @blog = Blog.find params[:id]
    @blog.destroy
    respond_to do |format|
      format.json { render nothing: true }
    end
  end

  def update
    @blog = Blog.find params[:id]
    @jsonarray = [@blog.as_json]
    @blog.update_attributes blog_params
    respond_to do |format|
      format.json { render json: JSON.pretty_generate(@jsonarray) }
    end
  end

private
  def blog_params
    params.require(:blog).permit(
      :name,
      :content
    )
  end

end

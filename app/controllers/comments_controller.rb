class CommentsController < ApplicationController
  before_action :set_product
  before_action :set_comment, only: %i[destroy edit update]
  before_action :check_editable, only: %i[update edit destroy]

  def create
    @comment = Comment.create(comment_params)
    render 'comments/create' if @comment.errors.any?
  end

  def update
    @comment.update(comment_params)
    render 'comments/create'
  end

  def destroy
    @comment.destroy
    render 'comments/create'
  end

  private

  def comment_params
    params.permit(:body, :rating, :user_id, :product_id)
  end

  def set_product
    @product = Product.find(params[:product_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def check_editable
    return if @comment.user_id == current_user.id

    flash[:notice] = 'Access denied as you are not owner of this Comment'
    render 'comments/create'
  end
end

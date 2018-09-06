class FavoritesController < ApplicationController
  def create
    favorite = current_user.favorites.create(post_id: params[:post_id])
    respond_to do |format|
      format.js { render :template => "posts/favorite",locals: { favorite: favorite, post: favorite.post } }
    end
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    respond_to do |format|
      format.js { render :template => "posts/favorite", locals: { favorite: favorite, post: favorite.post } }
    end
  end
end

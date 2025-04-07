class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[show edit update destroy]

  def index
    @recipes = Recipe.all
  end

  def show
  end

  def new
    @recipe = Recipe.new()
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to @recipe, notice: "「#{@recipe.title}」を登録しました。"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to @recipe, notice: "「#{@recipe.title}」の更新が完了しました。"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @recipe.destroy
    redirect_to root_path, notice: "「#{@recipe.title}」の削除が完了しました。"
  end

  private
  def recipe_params
    params.require(:recipe).permit(:title, :description, :ingredients, :steps, :cooking_time).merge(user_id: current_user.id)
  end
  def set_recipe
    @recipe = Recipe.find(params[:id])
  end
end

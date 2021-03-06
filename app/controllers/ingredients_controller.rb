class IngredientsController < ApplicationController
  
  before_action :set_ingredient, only: [:edit, :update, :show]
  before_action :require_admin, except: [:show, :index]
  
  def new
    @ingredient = Ingredient.new
  end
  
 def create
    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.save
      flash[:success] = "Ingredient successfully created"
      redirect_to ingredient_path(@ingredient)
    else
      render 'new'
    end
  end
  
  
  def edit
  end

  def update
    if @ingredient.update(ingredient_params)
      flash[:success] = "Ingredient successfully updated"
      redirect_to ingredient_path(@ingredient)
    else
      render 'edit'
    end
  end

  def show
    @ingredient_recipes = @ingredient.recipes.paginate(page: params[:page], per_page: 5)
    
  end
  
  def index
    @ingredients = Ingredient.paginate(page: params[:page], per_page: 5)
  end
  
  def destroy
  
  end

  private

  def set_ingredient
    @ingredient = Ingredient.find(params[:id])  
  end
  
  def ingredient_params
    params.require(:ingredient).permit(:name)
  end
  def require_admin
    if !logged_in? || (logged_in? and !current_user.admin?)
      flash[:danger] = "You have to be an admin to do that"
      redirect_to root_path
    end
  end  
  
end
module Admin::V1
  class CategoriesController < ApiController
    def index
      @categories = Category.all
    end

    def create
      @category = Category.new
      @category.attributes = category_params

      save_category!
    rescue
      # render json: { errors: {fields: @category.errors.messages} }, status: :unprocessable_entity
      render_error(fields: @category.errors.messages)
    end

    private

    # método que vai processar os parametros
    def category_params
      # retorna vazio se os params não tiverem a key category
      # a ideia aqui é pra não quebrar após no require
      return {} unless params.has_key?(:category)
      # obriga a existir a categoria
      params.require(:category).permit(:id, :name)
    end

    def save_category!
      @category.save!
      render :show
    rescue
      render_error(fields: @category.errors.messages)
    end
  end
end

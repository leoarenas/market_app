class CategoriumController < ApplicationController
  before_action :set_categoria, only: [:edit, :update, :destroy]
  def index
    @categorias = Categorium.all
  end

  def new
    @categoria = Categorium.new
  end

  def edit
  end

  def create
    @categoria = Categorium.new[categoria_params]
    respond_to do |format|
      if @categoria.save
        format.json { head :no_content }
        format.js
      else
        format.json { render json: @categoria.errors.full_messages, status: :unprocessable_entity }
        format.js { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @categoria.update(categoria_params)
        format.json { head :no_content}
        format.js
      else
        format.json { render json: @categoria.errors.full_messages, status: :unprocessable_entity }
        format.js { render :edit }
      end
    end
  end

  def destroy
    @categoria.destroy
    respond_to do |format|
      format.json { head :no_content }
      format.js
    end
  end

  private
    def set_categoria
      @categoria = Categorium.find(params[:id])
    end

    def categoria_params
      params.require(:categorium).permit(:nombre, :descripcion)
    end
end

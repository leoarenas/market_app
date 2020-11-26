class SuppliersController < ApplicationController
  before_action :set_supplier, only: [:edit, :update, :destroy]
  def index
    @suppliers = Supplier.all
  end

  def new
    @supplier = Supplier.new
  end

  def edit
  end

  def create
    @supplier = Supplier.new(supplier_params)
    respond_to do |format|
      if @supplier.save
        format.html { redirect_to suppliers_path }
        format.json { head :no_content }
        #format.js
      else
        format.json { render json: @supplier.errors.full_messages, status: :unprocessable_entity }
        format.js { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @supplier.update(supplier_params)
        format.html { redirect_to suppliers_path }
        format.json { head :no_content}
        #format.js
      else
        format.json { render json: @supplier.errors.full_messages, status: :unprocessable_entity }
        format.js { render :edit }
      end
    end
  end

  def destroy
    @supplier.destroy
    respond_to do |format|
      format.html { redirect_to suppliers_path }
      format.json { head :no_content }
      #format.js
    end
  end

  private
    def set_supplier
      @supplier = Supplier.find(params[:id])
    end

    def supplier_params
      params.require(:supplier).permit(:nombre, :direccion, :telefono)
    end
end

class ClientsController < ApplicationController
  before_action :set_cliente, only: [:edit, :update, :destroy]
  def index
    @clientes = Client.all
  end

  def new
    @cliente = Client.new
  end

  def edit
  end

  def create
    @cliente = Client.new(cliente_params)
    respond_to do |format|
      if @cliente.save
        format.html { redirect_to clients_path }
        format.json { head :no_content }
        #format.js
      else
        format.json { render json: @cliente.errors.full_messages, status: :unprocessable_entity }
        format.js { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @cliente.update(cliente_params)
        format.html { redirect_to clients_path }
        format.json { head :no_content}
        #format.js
      else
        format.json { render json: @cliente.errors.full_messages, status: :unprocessable_entity }
        format.js { render :edit }
      end
    end
  end

  def destroy
    @cliente.destroy
    respond_to do |format|
      format.json { head :no_content }
      format.js
    end
  end

  private
    def set_cliente
      @cliente = Client.find(params[:id])
    end

    def cliente_params
      params.require(:client).permit(:nombre, :telefono, :email, :direccion)
    end
end

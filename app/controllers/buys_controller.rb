class BuysController < ApplicationController
  before_action :set_buy, only: %i[ show edit update destroy ]

  # GET /buys or /buys.json
  def index
    @buys = Buy.all
  end

  # GET /buys/1 or /buys/1.json
  def show
    @buy_article = BuyArticle.new
    @total = @buy.calculate_total

    @iva = @total * (@buy.iva / 100)
    @total = @total * (100  + @buy.iva) /100.0
    respond_to do |format|
      format.html
      format.xlsx do
        headers['Content-Disposition'] = "attachment; filename=\"Compra-#{Date.today}.xlsx\""
      end

    end
  end

  # GET /buys/new
  def new
    @buy = Buy.new
  end

  # GET /buys/1/edit
  def edit
  end

  # POST /buys or /buys.json
  def create
    @buy = Buy.new(buy_params)

    respond_to do |format|
      if @buy.save
        format.html { redirect_to buy_url(@buy), notice: "Creado correctamente." }
        format.json { render :show, status: :created, location: @buy }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @buy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /buys/1 or /buys/1.json
  def update
    respond_to do |format|
      if @buy.update(buy_params)
        format.html { redirect_to buy_url(@buy), notice: "Actualizado correctamente." }
        format.json { render :show, status: :ok, location: @buy }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @buy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /buys/1 or /buys/1.json
  def destroy
    @buy.destroy

    respond_to do |format|
      format.html { redirect_to buys_url, notice: "Eliminado correctamente." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_buy
      @buy = Buy.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def buy_params
      params.require(:buy).permit(:iva, :total, :project_id, :user_id)
    end
end

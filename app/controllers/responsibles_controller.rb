class ResponsiblesController < ApplicationController
  before_action :set_responsible, only: %i[ show edit update destroy ]

  # GET /responsibles or /responsibles.json
  def index
    @responsibles = Responsible.all
  end

  # GET /responsibles/1 or /responsibles/1.json
  def show
  end

  # GET /responsibles/new
  def new
    @responsible = Responsible.new
  end

  # GET /responsibles/1/edit
  def edit
  end

  # POST /responsibles or /responsibles.json
  def create
    @responsible = Responsible.new(responsible_params)

    respond_to do |format|
      if @responsible.save
        format.html { redirect_to responsible_url(@responsible), notice: "Responsable creado correctamente." }
        format.json { render :show, status: :created, location: @responsible }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @responsible.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /responsibles/1 or /responsibles/1.json
  def update
    respond_to do |format|
      if @responsible.update(responsible_params)
        format.html { redirect_to responsible_url(@responsible), notice: "Responsable modificado correctamente." }
        format.json { render :show, status: :ok, location: @responsible }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @responsible.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /responsibles/1 or /responsibles/1.json
  def destroy
    begin
      @responsible.destroy
      flash[:notice] = "Responsable eliminado correctamente."
    rescue ActiveRecord::InvalidForeignKey
      flash[:alert] = "No se puede eliminar el responsable porque está siendo referenciado en el apartado de Empresas."
    end

    redirect_to responsibles_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_responsible
      @responsible = Responsible.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def responsible_params
      params.require(:responsible).permit(:name)
    end
end

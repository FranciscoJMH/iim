class MachineriesController < ApplicationController
  before_action :set_machinery, only: %i[ show edit update destroy ]

  # GET /machineries or /machineries.json
  def index
      @machineries = Machinery.all

      @machineries.each do |machinery|
        if machinery.init_date && machinery.renovation_date
          machinery.days_difference = (machinery.renovation_date - machinery.init_date).to_i
        else
          machinery.days_difference = nil
        end
      end
    end

  # GET /machineries/1 or /machineries/1.json
  def show
  end

  def show_details
      @enterprise = Enterprise.find(params[:id])
      @machineries = @enterprise.machineries
  end

  # GET /machineries/new
  def new
    @machinery = Machinery.new
  end

  # GET /machineries/1/edit
  def edit
  end

  # POST /machineries or /machineries.json
  def create
    @machinery = Machinery.new(machinery_params)

    respond_to do |format|
      if @machinery.save
        format.html { redirect_to machinery_url(@machinery), notice: "Maquinaria creada correctamente." }
        format.json { render :show, status: :created, location: @machinery }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @machinery.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /machineries/1 or /machineries/1.json
  def update
    respond_to do |format|
      if @machinery.update(machinery_params)
        format.html { redirect_to machinery_url(@machinery), notice: "Maquinaria modificada correctamente." }
        format.json { render :show, status: :ok, location: @machinery }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @machinery.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /machineries/1 or /machineries/1.json
  def destroy
    @machinery.destroy

    respond_to do |format|
      format.html { redirect_to machineries_url, notice: "Maquinaria eliminada correctamente." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_machinery
      @machinery = Machinery.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def machinery_params
      params.require(:machinery).permit(:number, :code, :machine_type, :characteristics, :cost_iva, :freight, :init_date, :renovation_date, :note, :provider_id, :enterprise_id)
    end
end

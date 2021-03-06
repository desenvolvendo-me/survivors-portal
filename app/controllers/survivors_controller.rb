class SurvivorsController < ApplicationController
  before_action :set_survivor, only: %i[ show edit update destroy ]

  # GET /survivors or /survivors.json
  def index
    @survivors = current_user.survivors
  end

  # GET /survivors/1 or /survivors/1.json
  def show
  end

  # GET /survivors/new
  def new
    @survivor = Survivor.new
  end

  # GET /survivors/1/edit
  def edit
  end

  # POST /survivors or /survivors.json
  def create
    @survivor = Survivor.new(survivor_params)
    @survivor.user = current_user

    respond_to do |format|
      if @survivor.save
        format.html { redirect_to survivor_url(@survivor), notice: "Survivor was successfully created." }
        format.json { render :show, status: :created, location: @survivor }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @survivor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /survivors/1 or /survivors/1.json
  def update
    respond_to do |format|
      if @survivor.update(survivor_params)
        format.html { redirect_to survivor_url(@survivor), notice: "Survivor was successfully updated." }
        format.json { render :show, status: :ok, location: @survivor }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @survivor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /survivors/1 or /survivors/1.json
  def destroy
    @survivor.destroy

    respond_to do |format|
      format.html { redirect_to survivors_url, notice: "Survivor was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_survivor
      @survivor = current_user.survivors.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def survivor_params
      params.require(:survivor).permit(:name, :age, :city_id, :gender, :root)
    end
end

class MagnetsController < ApplicationController
  before_action :set_magnet, only: [:show, :edit, :update, :destroy]
  before_action :set_door

  # GET /magnets
  # GET /magnets.json
  def index
    @magnets = @door.magnets
  end

  # GET /magnets/1
  # GET /magnets/1.json
  def show
  end

  # GET /magnets/new
  def new
    @magnet = Magnet.new
  end

  # GET /magnets/1/edit
  def edit
  end

  # POST /magnets
  # POST /magnets.json
  def create
    @magnet = Magnet.new(magnet_params)

    respond_to do |format|
      if @magnet.save
        format.html { redirect_to @magnet, notice: 'Magnet was successfully created.' }
        format.json { render :show, status: :created, location: @magnet }
      else
        format.html { render :new }
        format.json { render json: @magnet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /magnets/1
  # PATCH/PUT /magnets/1.json
  def update
    respond_to do |format|
      if @magnet.update(magnet_params)
        format.html { redirect_to @magnet, notice: 'Magnet was successfully updated.' }
        format.json { render :show, status: :ok, location: @magnet }
      else
        format.html { render :edit }
        format.json { render json: @magnet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /magnets/1
  # DELETE /magnets/1.json
  def destroy
    @magnet.destroy
    respond_to do |format|
      format.html { redirect_to magnets_url, notice: 'Magnet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_magnet
      @magnet = Magnet.find(params[:id])
    end

    def set_door
      @door = Door.find(params[:door_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def magnet_params
      params.require(:magnet).permit(:x, :y, :word, :locked_until, :locked_by, :fridge_id)
    end
end

class DoorsController < ApplicationController
  before_action :set_door, only: [:show, :edit, :update, :destroy]

  # GET /doors
  # GET /doors.json
  def index
    @doors = Door.all
  end

  # GET /doors/1
  # GET /doors/1.json
  def show
  end

  # GET /doors/new
  def new
    @door = Door.new(wordlist: Door::DEFAULT_WORDS)
  end

  # GET /doors/1/edit
  def edit
  end

  # POST /doors
  # POST /doors.json
  def create
    # TODO: Clean up, possibly on Angular side by using magnets_attributes
    edited_params = door_params
    words = edited_params.delete(:words)
    magnets_attributes = words.map{|w| {word: w}}
    @door = Door.new(edited_params.merge(magnets_attributes: magnets_attributes))

    respond_to do |format|
      if @door.save
        format.html { redirect_to @door, notice: 'Door was successfully created.' }
        format.json { render :show, status: :created, location: @door }
      else
        format.json { render json: @door.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /doors/1
  # PATCH/PUT /doors/1.json
  def update
    respond_to do |format|
      if @door.update(door_params)
        format.html { redirect_to @door, notice: 'Door was successfully updated.' }
        format.json { render :show, status: :ok, location: @door }
      else
        format.html { render :edit }
        format.json { render json: @door.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /doors/1
  # DELETE /doors/1.json
  def destroy
    @door.destroy
    respond_to do |format|
      format.html { redirect_to doors_url, notice: 'Door was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_door
      @door = Door.find_by!(hex: params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def door_params
      params.require(:door).permit(:name, words: [])
    end
end

class BroadcastMediaController < ApplicationController
  before_action :set_broadcast_medium, only: [:show, :edit, :update, :destroy]

  # GET /broadcast_media
  # GET /broadcast_media.json
  def index
    @broadcast_media = BroadcastMedium.all
  end

  # GET /broadcast_media/1
  # GET /broadcast_media/1.json
  def show
  end

  # GET /broadcast_media/new
  def new
    @broadcast_medium = BroadcastMedium.new
  end

  # GET /broadcast_media/1/edit
  def edit
  end

  # POST /broadcast_media
  # POST /broadcast_media.json
  def create
    @broadcast_medium = BroadcastMedium.new(broadcast_medium_params)

    respond_to do |format|
      if @broadcast_medium.save
        format.html { redirect_to @broadcast_medium, notice: 'Broadcast medium was successfully created.' }
        format.json { render action: 'show', status: :created, location: @broadcast_medium }
      else
        format.html { render action: 'new' }
        format.json { render json: @broadcast_medium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /broadcast_media/1
  # PATCH/PUT /broadcast_media/1.json
  def update
    respond_to do |format|
      if @broadcast_medium.update(broadcast_medium_params)
        format.html { redirect_to @broadcast_medium, notice: 'Broadcast medium was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @broadcast_medium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /broadcast_media/1
  # DELETE /broadcast_media/1.json
  def destroy
    @broadcast_medium.destroy
    respond_to do |format|
      format.html { redirect_to broadcast_media_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_broadcast_medium
      @broadcast_medium = BroadcastMedium.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def broadcast_medium_params
      params.require(:broadcast_medium).permit(:name, :description)
    end
end

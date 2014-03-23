class AlkoholsController < ApplicationController
  before_action :set_alkohol, only: [:show, :edit, :update, :destroy]

  # GET /alkohols
  # GET /alkohols.json
  def index
    @alkohols = Alkohol.all
  end

  # GET /alkohols/1
  # GET /alkohols/1.json
  def show
  end

  # GET /alkohols/new
  def new
    @alkohol = Alkohol.new
  end

  # GET /alkohols/1/edit
  def edit
  end

  # POST /alkohols
  # POST /alkohols.json
  def create
    @alkohol = Alkohol.new(alkohol_params)
    @alkohol.image = Pathname.new("app/assets/images/#{@alkohol.bottle_type}.jpg")

    respond_to do |format|
      if @alkohol.save
        format.html { redirect_to @alkohol, notice: 'Alkohol was successfully created.' }
        format.json { render action: 'show', status: :created, location: @alkohol }
      else
        format.html { render action: 'new' }
        format.json { render json: @alkohol.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /alkohols/1
  # PATCH/PUT /alkohols/1.json
  def update
    @alkohol.image = Pathname.new("app/assets/images/#{@alkohol.bottle_type}.jpg")
    respond_to do |format|
      if @alkohol.update(alkohol_params)
        format.html { redirect_to @alkohol, notice: 'Alkohol was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @alkohol.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /alkohols/1
  # DELETE /alkohols/1.json
  def destroy
    @alkohol.destroy
    respond_to do |format|
      format.html { redirect_to alkohols_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_alkohol
      @alkohol = Alkohol.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def alkohol_params
      params.require(:alkohol).permit(:name, :image_uid, :image_name, :percentage, :volume, :bottle_type, :image)
    end
end

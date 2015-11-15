class ProfessionalsController < ApplicationController
  before_action :set_professional, only: [:show, :edit, :update, :destroy]

  # GET /professionals
  # GET /professionals.json
  def index
    @professionals = Professional.all
  end

  # GET /professionals/1
  # GET /professionals/1.json
  def show
     @rating = ProRating.find_or_create_by(professional_id: @professional.id)
     if current_customer && !current_customer.favorites.empty?
        @favorite = current_customer.favorites.find_by(professional_id: @professional.id)
     end
  end

  # GET /professionals/new
  def new
    @professional = Professional.new
  end

  def search
    @professionals = Professional.search(params[:zipCode], params[:profession])
    render :index
  end

  def user_name_search
    @professionals = Professional.search_by(params[:userName])
    render :index
  end

  # GET /professionals/1/edit
  def edit
  end

  # POST /professionals
  # POST /professionals.json
  def create
    @professional = Professional.new(professional_params)

    respond_to do |format|
      if @professional.save
        format.html {
        session[:professional_id] = @professional.id
        redirect_to professional_path(@professional), notice: "Account was successfully created"
        }
        format.json {
          session[:professional_id] = @professional.id
          render :show, status: :create, location: @professional
        }
      else
        format.html { render :new }
        format.json { render json: @professional.errors, status: :unproccessable_entity }
      end
    end
  end

  # PATCH/PUT /professionals/1
  # PATCH/PUT /professionals/1.json
  def update
    respond_to do |format|
      if @professional.update(professional_params)
        format.html { redirect_to @professional, notice: 'Professional was successfully updated.' }
        format.json { render :show, status: :ok, location: @professional }
      else
        format.html { render :edit }
        format.json { render json: @professional.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /professionals/1
  # DELETE /professionals/1.json
  def destroy
    @professional.destroy
    respond_to do |format|
      format.html { redirect_to professionals_url, notice: 'Professional was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def favorite
    type = params[:type]
      if type == "favorite"
        current_customer.favorites << @professional
        redirect_to :back, notice: 'You favorited #{@professional.name}'

      elsif type == "unfavorite"
        current_customer.favorites.delete(@professional)
        redirect_to :back, notice: 'Unfavorited #{@professional.name}'

      else
        redirect_to :back, notice: 'Nothing happened.'
      end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_professional
      @professional = Professional.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def professional_params
      params.require(:professional).permit(:picture, :name, :username, :email, :job_location, :job_title, :phone_number, :password, :password_confirmation)
    end




end

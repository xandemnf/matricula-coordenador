class Admins::CoordinatorsController < AdminsController
  before_action :set_coordinator, only: [:destroy]
  # GET /coordinators
  # GET /coordinators.json
  def index
    @coordinators = User.with_role(:coordinator) 
  end

  def new
    @coordinator = User.new
  end

  def create
    @coordinator = User.new(coordinator_params)

    respond_to do |format|
      if @coordinator.save
        @coordinator.add_role :coordinator
        format.html { redirect_to admin_coordinators_path, notice: 'coordinator was successfully created.' }
        format.json { render :show, status: :created, location: @coordinator }
      else
        format.html { render :new }
        format.json { render json: @coordinator.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coordinator
      @coordinator = coordinator.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def coordinator_params
      params.require(:coordinator).permit(:name, :email, :password)
    end
end
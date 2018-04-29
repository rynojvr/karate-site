class MembersController < ApplicationController
  before_action :set_member, only: [:affiliate, :show, :edit, :update, :destroy]
  before_action :set_members, only: [:index]

  before_action :set_nav_category

  # POST /members/1/affiliate
  def affiliate
    @member.is_affiliated = !@member.is_affiliated
    if @member.save
      render json: { result: 'success', is_affiliated: @member.is_affiliated }
    else
      render json: { result: 'failure', is_affiliated: @member.is_affiliated }
    end
  end

  # GET /members
  # GET /members.json
  def index
    # @members = @club.members.order(last_name: :asc, first_name: :asc)
  end

  # GET /members/1
  # GET /members/1.json
  def show
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "#{@club.name} - #{@member.first_name} #{@member.last_name}",
               show_as_html: Rails.env.development? && params.key?('debug'),
               layout: 'pdf.html'
      end
    end
  end

  # GET /members/new
  def new
    @member = @club.members.new
  end

  # GET /members/1/edit
  def edit
  end

  # POST /members
  # POST /members.json
  def create
    @member = @club.members.build(member_params)

    respond_to do |format|
      if @member.save
        format.html { redirect_to @member, notice: 'Member was successfully created.' }
        format.json { render :show, status: :created, location: @member }
      else
        format.html { render :new }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /members/1
  # PATCH/PUT /members/1.json
  def update
    respond_to do |format|
      if @member.update(member_params)
        format.html { redirect_to @member, notice: 'Member was successfully updated.' }
        format.json { render :show, status: :ok, location: @member }
      else
        format.html { render :edit }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /members/1
  # DELETE /members/1.json
  def destroy
    @member.destroy
    respond_to do |format|
      format.html { redirect_to members_url, notice: 'Member was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member
      load_club
      member_id = (params[:id] || params[:member_id])
      @member = Member.find(member_id)
    end

    def set_members
      load_club
      @members = @club.members
    end

      def load_club
        club_id = params[:club_id]
        @club = Club.find(club_id)
      end

    # Never trust parameters from the scary internet, only allow the white list through.
    def member_params
      params.require(:member).permit(:first_name, :last_name, :date_of_birth, :race, :residential_address, :code, :cell_number, :email, :current_weight, :current_height, :belt, :is_affiliated)
    end

    def set_nav_category
      @nav_category = 'clubs'
    end

end

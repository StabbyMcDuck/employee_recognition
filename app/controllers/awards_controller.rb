class AwardsController < ApplicationController
  before_action :set_award, only: [:show, :edit, :update, :destroy]

  def accessdenied
  end

  # GET /awards
  # GET /awards.json
  def index
    @awards = Award.all
  end

  # GET /awards/1
  # GET /awards/1.json
  def show
  end

  # GET /awards/new
  def new
    @award = Award.new
  end

  # GET /awards/1/edit
  def edit
  end

  # POST /awards
  # POST /awards.json
  def create
    @award = Award.new(award_params)

    @award.granter = current_user

    respond_to do |format|
      if @award.save

        # if it saves, then email the recipient

        award_signature = current_user.signature
        award_signature = award_signature['data:image/png;base64,'.length .. -1]

        signature_image = Tempfile.new(['signature', '.png'])

        signature_image.binmode
        signature_image.write(Base64.decode64(award_signature))
        signature_image.flush

        # attach message with different award types

        if @award.award_type == 'Employee of the Month'
          award_message = 'For your contributions this month'
          graphic = "#{Rails.root}/img/Employee_of_the_Month.jpg"
        elsif @award.award_type == 'Employee of the Year'
          award_message = 'For your contributions this year'
          graphic = "#{Rails.root}/img/Employee_of_the_Year.jpg"
        elsif @award.award_type == 'Kudos'
          award_message = 'Big Kudos for everything that you do'
          graphic = "#{Rails.root}/img/Kudos.jpg"
        end

        Prawn::Document.generate("test.pdf") do |pdf|
          pdf.text "#{@award.award_type}", align: :center, size: 45
          pdf.move_down 20
          pdf.text "#{award_message}", align: :center, size: 36
          pdf.move_down 20
          pdf.image graphic, :position => :center, :scale => 0.40 # 40% scale
          pdf.move_down 40
          pdf.text "presented to #{@award.employee_name}", align: :center, size: 24
          pdf.move_down 20
          pdf.text "on #{@award.grant_date }", align: :center, size: 18
          pdf.move_down 40
          pdf.text "Granted by #{current_user.name}", align: :center, size: 18
          pdf.image signature_image.path, :position => :center, :scale => 0.40
        end

        mail = AwardMailer.award_email(@award)

        pdf_results = mail.deliver_now

        #File.delete("#{Rails.root}/test.pdf")
        #File.delete("#{Rails.root}/TEST_FILE.png")

        format.html { redirect_to @award, notice: 'Award was successfully created.' }
        format.json { render :show, status: :created, location: @award }

      else
        format.html { render :new }
        format.json { render json: @award.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /awards/1
  # PATCH/PUT /awards/1.json
  def update
    respond_to do |format|
      if @award.update(award_params)
        format.html { redirect_to @award, notice: 'Award was successfully updated.' }
        format.json { render :show, status: :ok, location: @award }
      else
        format.html { render :edit }
        format.json { render json: @award.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /awards/1
  # DELETE /awards/1.json
  def destroy
    @award.destroy
    respond_to do |format|
      format.html { redirect_to awards_url, notice: 'Award was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_award
      @award = Award.find(params[:id])
    end

    def check_admin
      if current_user.role == 'admin'
        redirect_to root_path
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def award_params
      params.require(:award).permit(:award_type, :employee_name, :employee_email, :"grant_date(2i)", :"grant_date(3i)", :"grant_date(1i)" )
    end
end

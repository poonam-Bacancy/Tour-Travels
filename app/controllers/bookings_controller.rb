class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  # GET /bookings
  # GET /bookings.json
  def index
    if current_user.has_role?(:superadmin) 
      @bookings=Booking.all
      
    else
      @bookings=Booking.where(user_id: current_user.id)
    
    end

  end
  def change_status
    @booking=Booking.find(params[:id])
    @user = User.find(@booking.user_id)     
    if @booking.status=="pending"
      @booking.status ="confirmed"
      @booking.save
      BookMailer.booking_status(@user,@booking).deliver_now
      redirect_to bookings_path
    end
  end

  # GET /bookings/1
  # GET /bookings/1.json
  def show
  end

  # GET /bookings/new
  def new
    @booking = Booking.new
  end

  # GET /bookings/1/edit
  def edit
  end

  # POST /bookings
  # POST /bookings.json
  def create
    @booking = Booking.new(booking_params)
    @booking.user_id=current_user.id
    @booking.tax=((@booking.book_amount)*10)/100
    @booking.other=350
    @booking.total_amount=(@booking.tax)+ (@booking.other) + (@booking.book_amount)
    
    @booking.status=0
    respond_to do |format|
      if @booking.save
        format.html { redirect_to bookings_path(:booking=>{:book_uname=>params[:booking][:book_uname]}), notice: 'Booking was successfully created.' }
        format.json { render :show, status: :created, location: @booking }
      else
        format.html { render :new }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bookings/1
  # PATCH/PUT /bookings/1.json
  def update
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to @booking, notice: 'Booking was successfully updated.' }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookings/1
  # DELETE /bookings/1.json
  def destroy
    @booking.destroy
    respond_to do |format|
      format.html { redirect_to bookings_url, notice: 'Booking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def change_price
    # @package = Package.bookings(:pkg_title).key(params[:package])
    @package = Package.find(params[:package])
  end

  def change_amount
    @amount = Package.find(params[:amount]).pkg_price * params[:no_of_tickets].to_i
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def booking_params
      params.require(:booking).permit(:book_name, :book_date, :tour_name, :book_price, :book_ticket_num,:book_amount,:package_id,:user_id,:status,:tax,:total_amount,:other)
    end
end

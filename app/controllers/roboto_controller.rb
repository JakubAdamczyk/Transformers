class RobotoController < ApplicationController
  include ApplicationHelper

  before_action :set_roboto

  def index
    begin
      @odleglosc = @lego.proximity
    rescue Exception => e
      flash[:alert] = "Somebody broke KillaBot3000 ! World is Doooommed !"
    end
  end

  def lock

    if credit_count > 0
      if @lego.lock != "OK"
        flash[:alert] = "KillaBot3000 is busy killing humans, please try again later"
      else
        @credit = current_user.wallets.create(credit: false)
      end
      redirect_to roboto_index_path
    else
      flash[:alert] = "Nie masz wystarczajacej liczby srodkow"
      redirect_to roboto_index_path
    end
  end

  def forward
    @lego.forward
    redirect_to roboto_index_path
  end

  def backward
    @lego.backward
    redirect_to roboto_index_path
  end

  def slow_forward
    @lego.slow_forward
    redirect_to roboto_index_path
  end

  def slow_backward
    @lego.slow_backward
    redirect_to roboto_index_path
  end

  def left
   @lego.left
   redirect_to roboto_index_path
 end

 def right
  @lego.right
  redirect_to roboto_index_path
end

def run
  @lego.run
  redirect_to roboto_index_path
end

def attack
  @lego.attack
  redirect_to roboto_index_path
end

def something_wrong

end

end

private

def set_roboto
  @lego=Robot.new
end

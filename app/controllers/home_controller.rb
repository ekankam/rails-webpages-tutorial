class HomeController < ApplicationController
  before_action :common_content, :only => [:index, :team]

  def common_content
    @hero_name = Faker::Superhero.name
    @hero_power = Faker::Superhero.power
    @corp_title = Faker::Company.name
    @corp_power = Faker::Company.bs
    @corp_power = @corp_power.titleize

    @rand_num = rand(1..1000)
    @set_number = rand(1..4)
    @bg_number = rand(1..2)

    # Randomly pick our avatar set
    if @set_number == 1
      @set = "set1"
    elsif @set_number == 2
      @set = "set2"
    elsif @set_number == 3
      @set = "set3"
    else
      @set = "set4"
    end

    # Randomly pick our background set
    if @bg_number == 1
      @bgset = "bg1"
    else
      @bgset = "bg2"
    end

    @avatar = Faker::Avatar.image(slug: @rand_num, size: "300x300", format: "bmp", set: @set, bgset: @bgset)
  end

  def index
   
  end

  def team
  end
end

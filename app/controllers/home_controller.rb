class HomeController < ApplicationController
  before_action :set_single_hero, only: [:index, :team]

  DEFAULT_TEAM_SIZE = 3

  def index
  end

  def team
    @team_number = params[:team_number].to_i
    @team_number = DEFAULT_TEAM_SIZE if @team_number <= 0

    @team = Array.new(@team_number) { build_hero }
  end

  private

  def set_single_hero
    hero = build_hero
    @hero_name  = hero[:name]
    @hero_power = hero[:power]
    @corp_title = hero[:job]
    @corp_power = hero[:corp_power]
    @avatar     = hero[:avatar]
  end

  def build_hero
    rand_num = rand(1..1000)
    set      = "set#{rand(1..4)}"
    bgset    = %w[bg1 bg2].sample

    {
      avatar: Faker::Avatar.image(
        slug: rand_num,
        size: "300x300",
        format: "bmp",
        set: set,
        bgset: bgset
      ),
      name: Faker::Superhero.name,
      power: Faker::Superhero.power,
      job: Faker::Company.name,
      corp_power: Faker::Company.bs.titleize
    }
  end
end
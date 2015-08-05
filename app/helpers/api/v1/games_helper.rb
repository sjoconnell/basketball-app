module Api::V1::GamesHelper

  def to_date(date)
    date.strftime("%b %e %l:%M%p")
  end

end

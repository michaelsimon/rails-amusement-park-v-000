class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
        # binding.pry
    if !enough_tickets? && !meets_height?
      return "Sorry. You do not have enough tickets the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif !enough_tickets?
      return "Sorry. You do not have enough tickets the #{attraction.name}."
    elsif !meets_height?
      return "Sorry. You are not tall enough to ride the #{attraction.name}."
    end

    if enough_tickets? && meets_height?
      update_ticket_count
      update_nausea
      update_happiness
    end
  end

  def enough_tickets?
    user.tickets > attraction.tickets
  end

  def meets_height?
    user.height > attraction.min_height
  end

  def update_ticket_count
    user.tickets -= attraction.tickets
    user.save
  end

  def update_nausea
    user.nausea += attraction.nausea_rating
    user.save
  end

  def update_happiness
    user.happiness += attraction.happiness_rating
    user.save
  end

end

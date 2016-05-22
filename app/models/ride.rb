class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    if enough_tickets? && meets_height?
      update_ticket_count
      update_nausea
      update_happiness
      result = "Thanks for riding the #{attraction.name}!"
    elsif !enough_tickets? && !meets_height?
      result =  "Sorry. You do not have enough tickets the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif !enough_tickets?
      result = "Sorry. You do not have enough tickets the #{attraction.name}."
    elsif !meets_height?
      result = "Sorry. You are not tall enough to ride the #{attraction.name}."
    end
    result
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

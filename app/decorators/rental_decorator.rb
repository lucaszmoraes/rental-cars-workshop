class RentalDecorator < ApplicationDecorator
  delegate_all
  
  def started_at
    if object.scheduled?
      return '---'
    end
    return object.started_at if active?
  end
end
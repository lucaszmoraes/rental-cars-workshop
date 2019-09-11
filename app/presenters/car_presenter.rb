class CarPresenter < SimpleDelegator #delegado
  include Rails.application.routes.url_helpers

  attr_reader :user

  def initialize(car, user)
    super(car)
    @user = user
  end

  def maintenance_link()
    if user.admin?
      if available? #significa car.available por causa do super(car)
        h.link_to("Enviar para manutenção", new_car_maintenance_path(id))
      elsif rented?
        ""
      end
    end
    if on_maintenance?
      h.link_to("Dar baixa em manutenção", new_return_maintenance_path(id.current_maintenance))
    end  
  end

  private
  def h
    ApplicationController.helpers
  end

end
class UserPreferencesController < ApplicationController
  def update
    user = User.find_by(email: params[:email], token: params[:token])
    if user 
      preference = user.try(:preference)
      preference.update_attributes(preference_params)
      render json: user
    end
  end

  def preference_params
    params.require(:user_preference).permit(:color, :title, :font)
  end
end

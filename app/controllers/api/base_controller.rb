class Api::BaseController < ApplicationController
  skip_before_action :verify_authenticity_token, raise: false

  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity

  private
    def render_not_found(exception)
      puts "not found"
      render json: { error: exception.message }, status: :not_found
    end

    def render_unprocessable_entity(exception)
      puts "unprocessable"
      render json: { error: exception.message }, status: :unprocessable_content
    end
end


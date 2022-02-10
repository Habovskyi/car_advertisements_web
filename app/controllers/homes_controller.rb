# frozen_string_literal: true

class HomesController < ApplicationController
  def index; end

  def help
    render 'homes/help'
  end
end

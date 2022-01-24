# frozen_string_literal: true

class HomesController < ApplicationController
  def index; end

  def show
    render 'homes/help'
  end
end

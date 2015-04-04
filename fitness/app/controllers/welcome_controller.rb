class WelcomeController < ApplicationController
  before_filter :authenticate_user!
  def index
    third_source

    end
end

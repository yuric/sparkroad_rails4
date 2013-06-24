class HomeController < ApplicationController
  skip_before_filter :authenticate_account!, :only =>[:index]

  def index

  end
end
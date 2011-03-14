class HomeController < ApplicationController
  def index
    render :inline => "<%= link_to 'Translate from English to Polish', '/translator/en/pl' %>"
  end
end
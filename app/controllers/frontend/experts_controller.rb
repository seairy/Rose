# -*- encoding : utf-8 -*-
class Frontend::ExpertsController < Frontend::BaseController
  def index
    @experts = Expert.all
  end

  def about
  end

  def contact
  end
end
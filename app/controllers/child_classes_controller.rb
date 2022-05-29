class ChildClassesController < ApplicationController
  before_action :authenticate_user!
  before_action :nursery_user!

  def index
    @child_classes = ChildClass.all
  end

  private

  def nursery_user!
    if !current_user.authority_id == 3
      redirect_to root_path
    end
  end
end

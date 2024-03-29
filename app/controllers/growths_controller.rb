class GrowthsController < ApplicationController
  before_action :authenticate_user!
  before_action :nursery_user!
  def index
    @kids = Kid.all
    @growths = Growth.where(month: Date.today.strftime('%Y%m').to_s)
  end

  def new
    @kid = Kid.find(params[:kid_id])
    @growth = Growth.new(kid_id: params[:id], month: Date.today.strftime('%Y%m').to_s, inspection_date: Date.today)
  end

  def create
    @growth = Growth.new(growth_params)
    if @growth.save
      redirect_to kid_path(params[:kid_id])
    else
      render :new
    end
  end

  def export
    @kids = Kid.all

    respond_to do |format|
      format.html
      format.csv do |_csv|
        send_posts_csv(@kids)
      end
    end
  end

  def import
    Growth.import(params[:file]) if !params[:file].nil? && params[:file].content_type.include?('text/csv')
    redirect_to action: 'index'
  end

  def edit
    @kid = Kid.find(params[:kid_id])
    @growth = Growth.find(params[:id])
  end

  def update
    @kid = Kid.find(params[:kid_id])
    @growth = Growth.find(params[:id])
    if @growth.update(growth_params)
      redirect_to action: 'index'
    else
      render :edit
    end
  end

  private

  def nursery_user!
    redirect_to root_path if current_user.authority_id != 3
  end

  def growth_params
    params.require(:growth).permit(:month, :inspection_date, :weight, :height, :kid_id).merge(kid_id: params[:kid_id])
  end

  def send_posts_csv(kids)
    csv_data = CSV.generate do |csv|
      column_names = %w(kid_id 園児名 生年月日 計測月 計測日 身長(cm) 体重(kg))
      csv << column_names
      kids.each do |kid|
        column_values = [
          kid.id,
          kid.name,
          kid.birth_date,
          Date.today.strftime('%Y%m'),
          Date.today,
          '',
          ''
        ]
        csv << column_values
      end
    end
    send_data(csv_data, filename: "#{Date.today.strftime('%Y%m')}身体測定データ登録用ファイル.csv")
  end
end

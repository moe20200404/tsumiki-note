class GrowthsController < ApplicationController
  before_action :set_kid, only: [:new]
  def index
    @kids = Kid.all
    @growths = Growth.where(month: Date.today.strftime('%Y%m').to_s)
  end

  def new
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
    Growth.import(params[:file])
    redirect_to action: 'index'
  end

  private

  def set_kid
    @kid = Kid.find(params[:kid_id])
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

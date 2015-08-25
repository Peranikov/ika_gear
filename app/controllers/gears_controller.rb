class GearsController < ApplicationController
  # GET /gears
  # GET /gears.json
  def index
    @gears = Gear.where(part: Gear.parts[part_param])
    @part = part_param
  end

  def csv
    @gears = Gear.where(id: params[:gear][:id])
    send_data render_to_string, filename: csv_file_name, type: :csv
  end

  private
    def part_param
      return :head unless params[:part]
      params[:part]
    end

    def csv_file_name
      "#{Time.zone.now}_#{part_param}.csv"
    end
end

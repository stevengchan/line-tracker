class MlbmatchesController < ApplicationController

  def index
    @mlbmatches = []
    day = Mlbmatch.first.match_date
    day_mlbmatches = []

    Mlbmatch.all.each do |m|
      if m.match_date == day
        day_mlbmatches << m
      else
        day_mlbmatches.sort_by! { |d| d.match_time }
        @mlbmatches << day_mlbmatches
        day = day - 1 until day = m.match_date
        day_mlbmatches = []
        day_mlbmatches << m
      end
    end

    day_mlbmatches.sort_by! { |d| d.match_time }
    @mlbmatches << day_mlbmatches

    @active_index = 0
    @mlbmatches.each do |m|
      @active_index = @mlbmatches.index(m) if m[0].match_date == Time.now.to_date
    end
  end

  def show
    @mlbmatch = Mlbmatch.find(params[:id])
    @mlblines = @mlbmatch.mlblines
  end
end
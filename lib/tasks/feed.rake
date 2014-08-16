require 'nokogiri'
require 'open-uri'

namespace :feed do

  desc 'Task to set initial feedtime for lines feed - MLB'
  task set_feedtime_mlb: :environment do
    Feed.create(league: 'MLB', feedtime: '0')
  end

  desc 'Task to get lines from xml feed and save into database - MLB'
  task get_lines_mlb: :environment do

    feed = Feed.find_by league: 'MLB'
    url = 'http://xml.pinnaclesports.com/pinnaclefeed.aspx?sporttype=baseball&sportsubtype=mlb&contest=no&last=' << feed.feedtime
    doc = Nokogiri::XML(open(url))
    feed.update(feedtime: doc.css('PinnacleFeedTime').text)

    doc.css('event').each do |e|
      e.css('period').each do |p|
        if p.css('period_number').text == '0' && e.css('participant_name').text != 'Away RunsHome Runs'

          dt = e.css('event_datetimeGMT').text << '-0000'
          match_time = Time.zone.parse(dt).to_datetime
          match_date = match_time.to_date

          teams = e.css('participant_name')
          pitchers = e.css('pitcher')
          rotnums = e.css('rotnum')
          moneyline_away = p.css('moneyline_visiting').text.to_i
          moneyline_home = p.css('moneyline_home').text.to_i
          spread_away = p.css('spread_visiting').text.to_f
          spread_home = p.css('spread_home').text.to_f
          spread_adjust_away = p.css('spread_adjust_visiting').text.to_i
          spread_adjust_home = p.css('spread_adjust_home').text.to_i
          total = p.css('total_points').text.to_f
          over_adjust = p.css('over_adjust').text.to_i
          under_adjust = p.css('under_adjust').text.to_i

          mlbmatch = Mlbmatch.where(match_date: match_date, rotnum_away: rotnums[0].text.to_i, rotnum_home: rotnums[1].text.to_i, team_away: teams[0].text, team_home: teams[1].text).first_or_create
          mlbmatch.update_columns(match_time: match_time, pitcher_away: pitchers[0].text, pitcher_home: pitchers[1].text)
          mlbmatch.mlblines.where(moneyline_away: moneyline_away, moneyline_home: moneyline_home, spread_away: spread_away, spread_home: spread_home, spread_adjust_away: spread_adjust_away, spread_adjust_home: spread_adjust_home, total: total, over_adjust: over_adjust, under_adjust: under_adjust).first_or_create

        end
      end
    end

    puts "#{Time.now} - Success - MLB"
  end

end
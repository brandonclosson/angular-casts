require 'feedjira'

class ScreencastImporter
  def self.import_railscasts
    Feedjira::Feed.add_common_feed_entry_element(:enclosure, :value => :url, :as => :video_url)
    Feedjira::Feed.add_common_feed_entry_element('itunes:duration', :as => :duration)

    feed = Feedjira::Feed.fetch_and_parse("http://feeds.feedburner.com/railscasts")

    feed.entries.each do |entry|

      title = entry.title.gsub(/^#\d+\s/, '')

      # Find or create the screencast data into our database
      Screencast.where(video_url: entry.video_url).first_or_create(
        title:        title,
        summary:      entry.summary,
        duration:     entry.duration,
        link:         entry.url,
        published_at: entry.published,
        source:       'railscasts' # set this manually
      )
    end

    Screencast.where(source: 'railscasts').count
  end
end
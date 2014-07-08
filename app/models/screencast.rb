# == Schema Information
#
# Table name: screencasts
#
#  id           :integer          not null, primary key
#  title        :string(255)
#  summary      :text
#  duration     :string(255)
#  link         :string(255)
#  published_at :datetime
#  source       :string(255)
#  video_url    :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#

class Screencast < ActiveRecord::Base
  validates_presence_of :title, :summary, :duration, :link, :published_at, :source, :video_url
  validates_uniqueness_of :video_url
end

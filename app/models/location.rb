# == Schema Information
#
# Table name: locations
#
#  id                    :integer          not null, primary key
#  name                  :string(255)      not null
#  category              :string(255)      not null
#  address               :string(255)      not null
#  ambience              :string(255)
#  wifi                  :boolean
#  attire                :string(255)
#  noise_level           :string(255)
#  wheelchair_accessible :boolean
#  created_at            :datetime
#  updated_at            :datetime
#  average_stars         :float
#

class Location < ActiveRecord::Base
  validates :name, :category, :address, presence: true
  
  has_many(
    :days,
    class_name: "Day",
    foreign_key: :location_id,
    primary_key: :id
  )
end
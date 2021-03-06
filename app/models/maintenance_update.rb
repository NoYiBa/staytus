# == Schema Information
#
# Table name: maintenance_updates
#
#  id             :integer          not null, primary key
#  maintenance_id :integer
#  user_id        :integer
#  text           :text(65535)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  identifier     :string(255)
#

class MaintenanceUpdate < ActiveRecord::Base

  belongs_to :maintenance
  belongs_to :user

  validates :text, :presence => true

  random_string :identifier, :type => :hex, :length => 6, :unique => true

  scope :ordered, -> { order(:id => :desc) }

end

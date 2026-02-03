class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :monitor_fetches, dependent: :destroy, class_name: "Monitor::Fetch"
  has_many :monitor_heartbeats, dependent: :destroy, class_name: "Monitor::Heartbeat"
end

class Run < ActiveRecord::Base
    validates_presence_of :user_id, :time, :date
    belongs_to :user
end
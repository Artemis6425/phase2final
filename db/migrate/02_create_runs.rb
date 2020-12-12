class CreateRuns < ActiveRecord::Migration
    def change
        create_table :runs do |t|
            t.integer :user_id
            t.time :time
            t.date :date
            t.string :note
        end
    end
end
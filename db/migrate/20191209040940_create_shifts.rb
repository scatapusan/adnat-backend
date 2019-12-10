class CreateShifts < ActiveRecord::Migration[6.0]
  def change
    create_table :shifts do |t|
      t.datetime :start
      t.datetime :finish
      t.integer :break_length
      t.index :user_id
      t.timestamps

    end
  end
end
#Date.parse("1/1/2019") + Time.parse("7pm").seconds_since_midnight.seconds
#Shift.create({:user => User.find(1), :start => @start_dt, :finish => @finish_dt, :break_length => 30})

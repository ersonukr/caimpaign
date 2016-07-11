class CreateCalls < ActiveRecord::Migration
  def change
    create_table :calls, id: false do |t|
      t.string :call_sid, :null =>  false
      t.string :phone
      t.integer :status
      t.integer :response
      t.timestamps
    end
    execute "ALTER TABLE calls ADD PRIMARY KEY (call_sid);"
  end
end

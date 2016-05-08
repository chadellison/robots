class Addnametoabilities < ActiveRecord::Migration
  def change
    change_table :abilities do |t|
      t.string :name
    end
  end
end

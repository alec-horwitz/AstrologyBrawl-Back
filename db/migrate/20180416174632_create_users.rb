class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :password
      t.string :email
      t.string :avatar, default: "http://www.lovemarks.com/wp-content/uploads/profile-avatars/default-avatar-business-bear.png"
      t.string :main
      t.string :attack
      t.string :defence
      t.string :type1
      t.string :type2
      t.string :type3
      t.string :level
      t.string :experience
      t.string :points
      t.string :score
      t.string :mod0
      t.string :mod1
      t.string :mod2
      t.string :mod3
      t.string :mod4
      t.string :mod5
      t.string :mod6
      t.string :mod7
      t.string :mod8
      t.string :mod9
      t.timestamps
    end
  end
end

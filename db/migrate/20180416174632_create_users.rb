class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :password_digest
      t.string :email
      t.string :avatar, default: "http://www.lovemarks.com/wp-content/uploads/profile-avatars/default-avatar-business-bear.png"
      t.string :sub_avatar1, default: "http://downloadicons.net/sites/default/files/exclamation-warning-icon-91894.png"
      t.string :sub_avatar2, default: "http://downloadicons.net/sites/default/files/exclamation-warning-icon-91894.png"
      t.string :main
      t.string :attack
      t.string :defence
      t.string :sign1
      t.string :sign2
      t.string :sign3
      t.string :type1
      t.string :type2
      t.string :type3
      t.string :level
      t.string :health
      t.string :experience
      t.string :points
      t.string :score
      t.string :inventory
      t.string :slot0
      t.string :slot1
      t.string :slot2
      t.string :slot3
      t.string :slot4
      t.string :slot5
      t.string :slot6
      t.string :slot7
      t.string :slot8
      t.string :slot9
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
      t.string :status, default: "Your Turn"
      t.string :animation, default: "pulse"
      t.string :visible, default: "true"
      t.string :hp, default: "100"
      t.string :defending, default: "false"
      t.string :charged, default: "false"
      t.string :action
      t.string :active_slot, default: "0"
      t.timestamps
    end
  end
end

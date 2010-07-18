class CreateSettings < ActiveRecord::Migration
  def self.up
    create_table :settings do |t|
      t.string :timezone
      t.string :recaptcha_domain
      t.string :recaptcha_public_key
      t.string :recaptcha_private_key
    end
    
    Setting.create(:timezone => "HST", :recaptcha_domain => "domain.com", :recaptcha_public_key => "AAA", :recaptcha_private_key => "BBB")
  end

  def self.down
    drop_table :settings
  end
end

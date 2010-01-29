class AddUsToExistingMetroAreas < ActiveRecord::Migration
  class MetroArea < ActiveRecord::Base; end

  def self.up
    MetroArea.update_all(:country_id => Country.get(:us))
  end

  def self.down
    MetroArea.update_all(:country_id => nil)
  end
end

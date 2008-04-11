class CreateFaqs < ActiveRecord::Migration
  def self.up
    create_table :faqs do |t|
      t.column :question, :text
      t.column :answer, :text
      t.column :created_at, :datetime
      t.column :updated_at, :datetime
      t.column :position, :integer, :default => 0
    end
  end

  def self.down
    drop_table :faqs
  end
end

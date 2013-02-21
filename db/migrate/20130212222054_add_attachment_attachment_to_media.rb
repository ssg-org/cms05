class AddAttachmentAttachmentToMedia < ActiveRecord::Migration
  def self.up
    change_table :media do |t|
      t.attachment :attachment
    end
  end

  def self.down
    drop_attached_file :media, :attachment
  end
end

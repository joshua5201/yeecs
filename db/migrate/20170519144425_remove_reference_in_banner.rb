class RemoveReferenceInBanner < ActiveRecord::Migration[5.0]
  def change
    remove_reference(:banners, :article, foreign_key: true)
  end
end

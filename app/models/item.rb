class Item < ApplicationRecord
  with_options presence: true do
    validates :image
    validates :name
    validates :info

    validates :price, numericality: { with: /\A[0-9]+\z/, message: 'Half-width number' },
                      inclusion: { in: 300..9_999_999, message: 'Out of setting range' }

    with_options numericality: { other_than: 1, message: 'Select' } do
      validates :category_id
      validates :sales_status_id
      validates :shipping_fee_id
      validates :prefecture_id
      validates :scheduled_delivery_id
    end
  end

  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :sales_status
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :scheduled_delivery

  has_one_attached :image
end

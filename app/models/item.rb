class Item < ApplicationRecord
  belongs_to :user
  has_one :buyer
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :postage
  belongs_to :prefecture
  belongs_to :shopping_date

  validates :category_id, presence: true, numericality: { other_than: 1, message: '選択してください' }
  validates :status_id, presence: true, numericality: { other_than: 1, message: '選択してください' }
  validates :postage_id, presence: true, numericality: { other_than: 1, message: '選択してください' }
  validates :prefecture_id, presence: true, numericality: { other_than: 1, message: '選択してください' }
  validates :shopping_date_id, presence: true, numericality: { other_than: 1, message: '選択してください' }
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is valid' }
  validates :image, presence: true
end

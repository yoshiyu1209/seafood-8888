class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders

  with_options presence: true do
    validates :nickname

    with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'は全角文字で入力してください' } do
      validates :last_name
      validates :first_name
    end

    with_options format: { with: /\A[ァ-ヶ一-]+\z/, message: 'は全角カタカナで入力してください' } do
      validates :last_name_kana
      validates :first_name_kana
    end

    validates :birthday
  end

  validates :password,
            format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'は半角の英字と数字を使用してください' }
end

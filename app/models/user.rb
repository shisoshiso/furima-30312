class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :buy_logs

  with_options presence: true do
    validates :nickname
    validates :password, format: { with: /\A(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]+\z/, message: 'は半角英数字混合での入力が必要です' }
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/, message: 'は全角（漢字・平仮名・カタカナ）での入力が必要です' }
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/, message: 'は全角（漢字・平仮名・カタカナ）での入力が必要です' }
    validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'は全角（カタカナ）での入力が必要です' }
    validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'は全角（カタカナ）での入力が必要です' }
    validates :birthday
  end
end

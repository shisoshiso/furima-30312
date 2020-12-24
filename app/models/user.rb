class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  VALID_PASSWORD_REGEX = /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]/.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX, message: 'は半角英数字混合での入力が必要です' }
  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/.freeze
  validates :first_name, presence: true, format: { with: VALID_NAME_REGEX, message: 'は全角（漢字・平仮名・カタカナ）での入力が必要です' }
  validates :last_name, presence: true, format: { with: VALID_NAME_REGEX, message: 'は全角（漢字・平仮名・カタカナ）での入力が必要です' }
  VALID_KANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze
  validates :first_name_kana, presence: true, format: { with: VALID_KANA_REGEX, message: 'は全角（カタカナ）での入力が必要です' }
  validates :last_name_kana, presence: true, format: { with: VALID_KANA_REGEX, message: 'は全角（カタカナ）での入力が必要です' }
  validates :birthday, presence: true
end

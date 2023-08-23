class User < ApplicationRecord
  #enum account_type: {
    #public_account: 0,
    #private_account: 1
  #}
  
  #after_initialize :set_default_account_type, if: :new_record?
  #def set_default_account_type
    #self.account_type ||= :public_account
  #end
  
  #def self.account_types
    #{
      #public_account: '公開アカウント',
      #private_account: '非公開アカウント'
      # もしくは必要な他のアカウントタイプを追加
    #}
  #end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :places, dependent: :destroy
end

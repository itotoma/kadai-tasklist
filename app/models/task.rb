class Task < ApplicationRecord
    belongs_to :user
    validates :status, presence: true, length: { maximum: 10 }
    #この際自動的にstatus.errors変数にエラー内容が格納
end

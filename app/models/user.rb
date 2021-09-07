class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts
  has_one_attached :photo

  def admin?
    admin
  end

  # def uploaded_monkeys
  #   uploads = self.uploads
  #   posts = []
  #   uploads.each do |upload|
  #     posts << upload.post
  #   end

  #   return posts
  # end
end

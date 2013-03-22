class User < ActiveRecord::Base
  has_many :questions
  has_many :answers
  attr_accessible  :username, :password, :password_confirmation

  has_secure_password

  validates :username, presence: true, uniqueness: { case_sensitive: false },
  						length: { in: 4..12 },
  						format: { with: /^[a-z][a-z0-9]*$/, message: 'solo minusculas y numeros' }

  validates :password, length: { in: 4..8, message: 'debe tener entre 4 y 8 caracteres' }
  validates :password_confirmation, length: { in: 4..8, message: 'debe tener entre 4 y 8 caracteres' }

  def your_questions(params)
  	questions.paginate(page: params[:page], order: 'created_at DESC', per_page: 3)
  end
end

class Topic < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  scope :visible_to, -> (user) { user ? all : public }
  scope :publicly_viewable, -> { where(public: true) }
  scope :privately_viewable, -> { where(public: false) }


  scope :public, -> { where(public: true) }
  scope :private, -> { where(public: false) }
  scope :visible_to, -> (user) { user ? all : public }
end
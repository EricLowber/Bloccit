require 'rails_helper'

describe Vote do 
  describe "validations" do
    describe "value validation" do
      include TestFactories
        
      it "only allows -1 or 1 as values" do
      v = Vote.new(value: 1)
        expect(v.valid?).to eq(true)

      v2 = Vote.new(value: -1)
      expect(v.valid?).to eq(true)

      v3 =Vote.new(value: 2)
      expect(v3.valid?).to eq(false)
      end
    end
  end

  describe 'after_save' do
    it "calls 'Post#update_rank' after save" do
      post = associated_post
      vote = Vote.new(value: 1, post: post)
      expect(post).to receive(:update_rank)
      vote.save
    end
  end  
 end

 def associated_post
   user = authenticated_user
   topic = Topic.create(name: 'Topic name')
   Post.create(title: 'Post title', body: 'Post bodies must be pretty long', topic: topic, user: user)
 end

 def authenticated_user
     user = User.new(email: "email#{rand}@fake.com", password: 'password')
     user.skip_confirmation!
     user.save
     user
 end
   
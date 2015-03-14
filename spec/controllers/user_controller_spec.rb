require 'rails_helper'

describe UsersController do

  describe "create" do
    it "returns a new user's token from valid email and password" do
      user_params = { user: { email: 'user@example.com', password: 'testpass', password_confirmation: 'testpass' } }
      post :create, user_params
      expect(response.status).to eq 201
      expect(response.body).to include("#{User.last.auth_token}")
    end

    it "returns an error when not given a password" do
      user_params = { 'user' => { 'email' => 'user@example.com' } }
      post :create, user_params
      expect(response.status).to eq 400
      expect(response.body).to include("can't be blank")
    end

    it "returns an error when given an invalid email" do
      user_params = { 'user' => { 'email' => 'testuser', 'password' => 'testpass', password_confirmation: 'testpass' } }
      post :create, user_params
      expect(response.status).to eq 400
      expect(response.body).to include('is invalid')
    end

    it "returns an error when user email not unique" do
      User.create!(user_attributes)
      user_params = { 'user' => { 'email' => 'user@example.com', 'password' => 'testpass', password_confirmation: 'testpass' } }
      post :create, user_params
      expect(response.status).to eq 400
      expect(response.body).to include('has already been taken')
    end

    it "returns an error when not given an email" do
      user_params = { 'user' => { 'password' => 'testuser', password_confirmation: 'testpass' } }
      post :create, user_params
      expect(response.status).to eq 400
      expect(response.body).to include("can't be blank")
    end
  end

  describe "delete" do
    before do
      @user = User.create!(user_attributes)
      auth(@user)
    end
    it "deletes own user's accont" do
      delete :destroy, id: @user.id

      expect(response.status).to eq 200
    end

    it "can't delete other user's accont" do
      user_2 = User.create!(user_attributes(email: 'user_2@example.com'))

      delete :destroy, id: user_2.id
      expect(response.status).to eq 401
    end
  end

end
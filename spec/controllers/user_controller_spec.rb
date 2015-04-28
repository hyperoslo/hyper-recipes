require 'rails_helper'

describe UsersController do

  describe "create" do
    context 'when valid params' do
      before { post :create, user_params_valid }

      it 'is expected to respond with 201' do
        expect(response.status).to eq 201
      end

      it 'returns a new user' do
        expect(response.body).to include("#{User.last.auth_token}")
      end
    end

    context 'when params missing password' do
      before { post :create, user_params_email }

      it 'is expected to respond with 400' do
        expect(response.status).to eq 400
      end

      it 'return error message' do
        expect(response.body).to include("can't be blank")
      end
    end

    context 'when params has invalid email' do
      before { post :create, user_params_email_invalid }

      it 'is expected to respond with 400' do
        expect(response.status).to eq 400
      end

      it 'return error message' do
        expect(response.body).to include('is invalid')
      end
    end

    context 'when params has an already used email' do
      before do
        User.create!(user_attributes)
        post :create, user_params_valid
      end

      it 'is expected to respond with 400' do
        expect(response.status).to eq 400
      end

      it 'return error message' do
        expect(response.body).to include('has already been taken')
      end
    end

    context 'when params has no email' do
      before { post :create, user_params_password }

      it 'is expected to respond with 400' do
        expect(response.status).to eq 400
      end

      it 'return error message' do
        expect(response.body).to include("can't be blank")
      end
    end
  end

  describe "delete" do
    let(:user) { User.create!(user_attributes) }
    before { auth(user) }

    it "deletes own user's accont" do
      delete :destroy, id: user.id

      expect(response.status).to eq 200
    end

    it "can't delete other user's accont" do
      user_2 = User.create!(user_attributes(email: 'user_2@example.com'))

      delete :destroy, id: user_2.id
      expect(response.status).to eq 401
    end
  end

end

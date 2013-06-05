require 'spec_helper'

describe UsersController do
  context "when user signed in" do
    signin_user

    describe "GET edit" do
      it "shows own user" do
        get :edit, {:id => controller.current_user.id}
        expect(assigns(:user)).to eq controller.current_user
      end

      it "DOES NOT show other user" do
        user = FactoryGirl.create(:user)
        get :edit, {:id => user.id}
        expect(response).to redirect_to users_path
      end
    end

    describe "DELETE destroy" do
      it "delete own user" do
        expect {
          delete :destroy, {:id => controller.current_user.id}
        }.to change(User, :count).by(-1)
      end

      it "DOES NOT delete other user" do
        user = FactoryGirl.create(:user)
        expect {
          delete :destroy, {:id => user.id}
        }.to change(User, :count).by(0)
      end
    end
  end

  context "user DOES NOT signed in" do
    describe "GET index" do
      it "redirects to sign in" do
        get :index
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end

require 'rails_helper'

describe SpotsController, type: :controller do

  let(:user) { create(:user) }

  describe 'GET #index' do
    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #new' do
    context 'log in' do
      before do
        login user
      end
      it "renders the :new template" do
        get :new
        expect(response).to render_template :new
      end
    end

    context 'not log in' do
      it 'redirects to root_path' do
        get :new
        expect(response).to redirect_to(root_path)
      end
    end

  end

end
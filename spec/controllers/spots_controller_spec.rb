require 'rails_helper'

describe SpotsController, type: :controller do

  let(:user) { create(:user) }

  describe 'GET #index' do
    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    it "renders the :show template" do
      get :show, params: { id: 1 }
      expect(response).to render_template :show
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

  describe 'GET #edit' do
    context 'log in' do
      before do
        login user
      end
      it "renders the :edit template" do
        get :edit, params: { id: 1 }
        expect(response).to render_template :edit
      end
    end

    context 'not log in' do
      it 'redirects to root_path' do
        get :edit, params: { id: 1 }
        expect(response).to redirect_to(root_path)
      end
    end
  end
  
  describe 'POST #create' do

    let(:params) { { user_id: user.id } }

    context 'log in' do
      before do
        login user
      end
      # context 'can save' do
      #   subject {
      #     post :create,
      #     params: params
      #   }
      #   it 'count up spot' do
      #     expect{ subject }.to change(Spot, :count).by(1)
      #   end
      #   it 'redirects to spot_path' do
      #     subject
      #     expect(response).to redirect_to(spot_path(@spot.id))
      #   end
      # end
    end

    context 'not log in' do
      it 'redirects to root_path' do
        post :create, params: params
        expect(response).to redirect_to(root_path)
      end
    end
  end

end
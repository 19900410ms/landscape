require 'rails_helper'

describe ReviewsController, type: :controller do

  let(:user) { create(:user) }
  let(:spot) { create(:spot) }
  let(:params) { { user_id: user.id, spot_id: spot.id, review: attributes_for(:review) } }

  describe 'POST #create' do
    context 'log in' do
      before do
        login user
      end
      context 'can save' do
        subject {
          post :create,
          params: params
        }
        it 'count up review' do
          expect{ subject }.to change(Review, :count).by(1)
        end
      end
      context 'can not save' do
        let(:invalid_params) { { user_id: user.id, spot_id: spot.id, review: attributes_for(:review, text: nil) } }
        subject {
          post :create,
          params: invalid_params
        }
        it 'does not count up review' do
          expect{ subject }.not_to change(Review, :count)
        end
      end
    end

    context 'not log in' do
      it 'redirects to root_path' do
        post :create, params: params
        expect(response).to redirect_to(root_path)
      end
    end
  end

end
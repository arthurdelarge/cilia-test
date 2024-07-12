require 'rails_helper'
require 'factories/product_factories'

describe ProductsController do

  describe 'admin not authenticated' do

    describe 'GET index' do
      it 'renders template' do
        get :index
        expect(response).to be_success
        expect(response).to render_template("products/index")
      end
    end

    describe 'GET show' do
      it 'renders template' do
        get :show, params: { id: Product.first.id }
        expect(response).to be_success
        expect(response).to render_template("products/show")
      end
    end

    describe 'CREATE' do
      it 'redirects to authentication' do
        get :new
        expect(response).not_to be_success
        expect(response).to redirect_to("/admins/sign_in")
      end
    end

    describe 'UPDATE' do
      it 'redirects to authentication' do
        get :update, params: { id: Product.first.id }
        expect(response).not_to be_success
        expect(response).to redirect_to("/admins/sign_in")
      end
    end

    describe 'DELETE' do
      it 'redirects to authentication' do
        get :destroy, params: { id: Product.first.id }
        expect(response).not_to be_success
        expect(response).to redirect_to("/admins/sign_in")
      end
    end
  end

  describe 'admin authenticated' do

    before(:each) { sign_in :admin }

    describe 'GET new' do
      it 'renders template' do
        get :new
        expect(response).to be_success
        expect(response).to render_template("products/new")
      end
    end

    describe 'GET edit' do
      it 'renders_template' do
        get :edit
        expect(response).to be_success
        expect(response).to render_template("products/edit")
      end
    end
  end
end
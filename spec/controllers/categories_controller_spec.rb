require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  include Devise::Test::ControllerHelpers
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  describe 'GET #index' do
    it 'assigns all categories to @categories' do
      category1 = create(:category, user:)
      category2 = create(:category, user:)

      get :index
      expect(assigns(:categories)).to match_array([category1, category2])
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end
  end

  describe 'GET #show' do
    let(:category) { create(:category, user:) }

    it 'assigns the requested category to @category' do
      get :show, params: { id: category.id }

      expect(assigns(:category)).to eq(category)
    end

    it 'assigns all expenses associated with the category to @expenses' do
      expense1 = create(:expense, user:, category:)
      expense2 = create(:expense, user:, category:)

      get :show, params: { id: category.id }

      expect(assigns(:expenses)).to match_array([expense1, expense2])
    end

    it 'renders the show template' do
      get :show, params: { id: category.id }

      expect(response).to render_template('show')
    end
  end

  describe 'GET #new' do
    it 'assigns a new category to @category' do
      get :new
      expect(assigns(:category)).to be_a_new(Category)
    end

    it 'renders the new template' do
      get :new
      expect(response).to render_template('new')
    end
  end

  describe 'POST #create' do
    let(:valid_attributes) { attributes_for(:category) }
    let(:invalid_attributes) { attributes_for(:category, name: nil) }

    it 'creates a new category with valid attributes' do
      expect do
        post :create, params: { category: valid_attributes }
      end.to change(Category, :count).by(1)

      expect(response).to redirect_to(categories_path)
      expect(flash[:notice]).to eq('Category was successfully created.')
    end

    it 'does not create a new category with invalid attributes' do
      expect do
        post :create, params: { category: invalid_attributes }
      end.not_to change(Category, :count)

      expect(response).to render_template('new')
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes the category' do
      category = create(:category, user:)

      expect do
        delete :destroy, params: { id: category.id }
      end.to change(Category, :count).by(-1)

      expect(response).to redirect_to(categories_path)
    end

    it 'redirects to the categories index page' do
      category = create(:category, user:)

      delete :destroy, params: { id: category.id }

      expect(response).to redirect_to(categories_path)
    end

    it 'sets a flash notice message' do
      category = create(:category, user:)

      delete :destroy, params: { id: category.id }

      expect(flash[:notice]).to eq('Category was successfully deleted.')
    end
  end
end

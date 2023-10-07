require 'rails_helper'

RSpec.describe ExpensesController, type: :controller do
  include Devise::Test::ControllerHelpers
  let(:user) { create(:user) }
  let(:category) { create(:category, user:) }

  before do
    sign_in user
  end

  describe 'GET #new' do
    it 'assigns a new expense to @expense' do
      get :new, params: { category_id: category.id }
      expect(assigns(:expense)).to be_a_new(Expense)
    end
  end

  describe 'POST #create' do
    it 'creates a new expense' do
      expense_params = { name: 'Test Expense', amount: 100.0 }

      expect do
        post :create, params: { category_id: category.id, expense: expense_params }
      end.to change(Expense, :count).by(1)

      expect(response).to redirect_to(category_path(category))
      expect(flash[:notice]).to eq('Expense was successfully created.')
    end

    it 'does not create an invalid expense' do
      expense_params = { name: '', amount: -10.0 }

      expect do
        post :create, params: { category_id: category.id, expense: expense_params }
      end.not_to change(Expense, :count)

      expect(response).to render_template('new')
    end
  end
end

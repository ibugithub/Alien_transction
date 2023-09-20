require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }

  it 'is valid with valid attributes' do
    expect(user).to be_valid
  end

  it 'is not valid without a name' do
    user.name = nil
    expect(user).not_to be_valid
  end

  it 'is not valid without an email' do
    user.email = nil
    expect(user).not_to be_valid
  end

  it 'has many categories' do
    category1 = create(:category, user:)
    category2 = create(:category, user:)

    expect(user.categories.count).to eq(2)
    expect(user.categories).to include(category1, category2)
  end

  it 'has many expenses' do
    category = create(:category, user:)
    expense1 = create(:expense, category:, user:)
    expense2 = create(:expense, category:, user:)

    expect(user.expenses.count).to eq(2)
    expect(user.expenses).to include(expense1, expense2)
  end
end

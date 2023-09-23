class ExpensesController < ApplicationController
  before_action :authenticate_user!

  def new
    @category = current_user.categories.find(params[:category_id])
    @expense = @category.expenses.build
  end

  def create
    @category = current_user.categories.find(params[:category_id])
    @expense = @category.expenses.build(expense_params)
    @expense.user_id = current_user.id
    if @expense.save
      redirect_to category_path(@category), notice: 'Expense was successfully created.'
    else
      p 'the @expense was ', @expense
      render :new
    end
  end

  private

  def expense_params
    params.require(:expense).permit(:name, :amount)
  end
end

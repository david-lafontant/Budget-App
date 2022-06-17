class ExpensesController < ApplicationController
  def index
    @group_id = Group.find(params[:group_id])
    @expenses = Expense.where(group_id: @group_id.id).order(created_at: :desc)
  end

  def show; end

  def new
    @group_id = Group.find(params[:group_id]).id
    @expense = Expense.new
  end

  def edit; end

  def create
    @expense = Expense.new(expense_params)
    @expense.user_id = current_user.id
    @group = Group.find(params[:group_id])

    @expense.group_id = @group.id

    if @expense.save
      redirect_to user_group_expenses_url(user_id: current_user.id, group_id: @group.id)
    else
      render :new
    end
  end

  def update
    respond_to do |format|
      if @expense.update(expense_params)
        format.html { redirect_to expense_url(@expense), notice: 'expense was successfully updated.' }
        format.json { render :show, status: :ok, location: @expense }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @expense.destroy

    respond_to do |format|
      format.html { redirect_to expenses_url, notice: 'expense successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_expense
    @expense = Expense.find(params[:id])
  end

  def expense_params
    params.require(:expense).permit(:name, :amount)
  end
end

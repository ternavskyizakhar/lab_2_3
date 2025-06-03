# frozen_string_literal: true

ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    columns do
      column do
        panel "Recent Accounts" do
          ul do
            Account.order(created_at: :desc).limit(5).map do |account|
              li link_to("Account ##{account.id} - Balance: #{account.balance}", admin_account_path(account))
            end
          end
        end
      end

      column do
        panel "Recent Transactions" do
          ul do
            Transaction.order(created_at: :desc).limit(5).map do |transaction|
              li link_to("Transaction ##{transaction.id} - Amount: #{transaction.amount}", admin_transaction_path(transaction))
            end
          end
        end
      end
    end
  end
end

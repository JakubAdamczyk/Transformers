module ApplicationHelper

def credit_count
    current_user.wallets.where(:credit => true).count -
    current_user.wallets.where(:credit => false).count
end
end

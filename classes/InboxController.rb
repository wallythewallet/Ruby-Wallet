require "classes/Inbox.rb"

class InboxController
  attr_accessor :inbox, :server_id, :user_id, :account_id
  
  def initialize server_id, user_id, account_id
    @server_id = server_id
    @user_id = user_id
    @account_id = account_id
    get_inbox server_id, user_id, account_id
    @inbox = load_inbox server_id, user_id, account_id
  end
  
  def get_inbox server_id, user_id, account_id
    Otapi.OT_API_getRequest(server_id, user_id)
    Otapi.OT_API_getInbox(server_id, user_id, account_id)
  end
  
  def load_inbox server_id, user_id, account_id
    inbox = Otapi.OT_API_LoadInbox(server_id, user_id, account_id)
  end
  
end
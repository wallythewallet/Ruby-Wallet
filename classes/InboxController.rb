require "classes/Inbox.rb"

class InboxController
  attr_accessor :inbox
  
  def initialize server_id, user_id, account_id
    get_inbox server_id, user_id, account_id
    @inbox = load_inbox server_id, user_id, account_id
  end
  
  def get_inbox server_id, user_id, account_id
    Otapi.OT_API_getInbox(server_id, user_id, account_id)
  end
  
  def load_inbox server_id, user_id, account_id
    inbox = Otapi.OT_API_LoadInbox(server_id, user_id, account_id)
  end
  
end
class Transfer
  attr_accessor :amount, :sender, :receiver
  attr_accessor :status 
  
  def initialize(sender, receiver, amount)
    @sender = sender 
    @receiver = receiver
    @status = "pending"
    @amount = amount 
  end 
  
  def valid?
    sender.valid? == receiver.valid?
  end 
  
  def execute_transaction
    if valid? && sender.balance > @amount && @status == "pending"
      sender.balance -= @amount
      receiver.balance =+ @amount
      @status = "complete"
    else
      reject_transfer
    end
  end
  
  def reverse_transaction
end

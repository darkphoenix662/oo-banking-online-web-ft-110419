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
    if sender.balance > @amount && @status == "pending"
      sender.balance -= @amount
      receiver.balance += @amount
      @status = "complete"
    else
      reject_transfer
    end
    # if valid? && sender.balance > @amount && @status == "pending"
    #   sender.balance -= @amount
    #   receiver.balance =+ @amount
    #   @status = "complete"
    # else
    #   reject_transfer
    # end
  end
  
  def reverse_transfer
    if @status == "complete"
      sender.balance =+ @amount
      receiver.balance -= @amount
      @status = "reversed"
    end
  end 
end

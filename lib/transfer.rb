class Transfer
    attr_accessor :amount, :sender, :receiver, :status
  
    def initialize(sender,receiver,amount)
      @sender = sender
      @receiver = receiver
      @amount = amount
      @status = "pending"
    end

    def valid?
      (self.sender.valid? && self.receiver.valid?)
    end

    def execute_transaction
      if (self.valid? && self.sender.balance > self.amount && self.status != "complete")
        self.sender.balance -= self.amount
        self.receiver.balance += self.amount
        self.status = "complete"
      else
        self.status = "rejected"
        "Transaction rejected. Please check your account balance."
      end
        

    end

    def reverse_transfer
      if self.status == "complete"
        self.sender.balance += self.amount
        self.receiver.balance -= self.amount
        self.status = "reversed"
      end
    end

end

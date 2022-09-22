$cash_box = {
  '1' => 10, 
  '2' => 10, 
  '5c' => 10, 
  '5' => 10, 
  '10c' => 10,
  '10' => 10,
  '20' => 10,
  '50' => 10, 
  '100' => 10, 
  '200' => 10, 
  '500' => 10,  
  '2000' => 10}
$denomination = [1,2,5,5,10,10,20,50,100,200,500,2000]
$order_count = 0
$initial_amount
def initial_cashbox_total(boolean)  
  cash_box_index = 0
  $initial_amount = 0
  for i in ($cash_box.values)
     $initial_amount += $denomination[cash_box_index] * i
     cash_box_index += 1
  end
  if(boolean == false )
   return $initial_amount
  else 
    return order_count_display()
  end
end    

def order_count_display()
  
  while 1
    puts $cash_box
    puts ("Hello, Welcome  to the shop")
    puts(" Press N if you have not purchased")
    order_status = gets().chomp
    duplicate_cash_box=$cash_box.clone
    if (order_status.eql?("N"))
        exit
    end
    $order_count += 1 
    puts "order number is #{$order_count}"
    customer_given_amount(duplicate_cash_box)
  end 
end 

def customer_given_amount(duplicate_cash_box)
   puts "Enter the bill amount"
   bill_amount=gets().chomp.to_i
   puts "Enter the total amount given"
   toatal_cash_by_customer=gets().chomp.to_i
   puts "The balance amount is"
   balance_amount_to_customer=toatal_cash_by_customer-bill_amount
   puts balance_amount_to_customer
   if($initial_amount==0 && balance_amount_to_customer!=0)
    puts("Insufficient balance")
    exit
   end 
  credit_transcation(bill_amount,balance_amount_to_customer,toatal_cash_by_customer,duplicate_cash_box)
end   

def credit_transcation(bill_amount,balance_amount_to_customer,toatal_cash_by_customer,duplicate_cash_box)
  $initial_amount = initial_cashbox_total(false)
  total_money = 0
  while total_money < toatal_cash_by_customer 
    puts "Enter the type of amount give"
    cash_type=gets().chomp
    if cash_type.eql?("coin")
      puts("Enter the Value of amount") 
      coin=gets.chomp.to_i 
      puts("Enter the count of #{coin} Rupee coin")
      case coin 
        when 1
          count=gets().chomp.to_i
          total_money += (coin*count)
          $cash_box['1']+=count
        when 2
          count=gets().chomp.to_i
          total_money += (coin*count)
          $cash_box['2']+=count
        when 5
          count=gets().chomp.to_i
          total_money += (coin*count)
          $cash_box['5c']+=count
        when 10
          count=gets().chomp.to_i
          total_money += (coin*count)
          $cash_box['10c'] +=count
      end  

    elsif cash_type.eql?("note")
      puts("Enter the Value of amount") 
      note=gets.chomp.to_i
      puts(("Enter the count of #{note} Rupee note"))
      case note
        when 5
          count = gets().chomp.to_i
          total_money += (note*count)
          $cash_box['5']+= count
        when 10
          count = gets().chomp.to_i
          total_money += (note*count)
          $cash_box['10']+= count
        when 20
            count = gets().chomp.to_i
            total_money += (note*count)
            $cash_box['20'] += count    
        when 50
            count = gets().chomp.to_i
            total_money += (note*count)
            $cash_box['50'] += count
        when 100
            count = gets().chomp.to_i
            total_money += (note*count)
            $cash_box['100'] += count 
        when 200
            count = gets().chomp.to_i
            total_money += (note*count)
            $cash_box['200'] += count
        when 500
            count = gets().chomp.to_i
            total_money += (note*count)
            $cash_box['500'] += count
        when 2000
            count = gets().chomp.to_i
            total_money += (note*count)
            $cash_box['2000'] += count  
        else
          puts("Enter correct amount")                         
      end
    end
  end
  debit_denomination(balance_amount_to_customer,bill_amount,duplicate_cash_box)
end


def debit_denomination(balance_amount_to_customer,bill_amount,duplicate_cash_box)
    
  cashes = [2000,500,200,100,50,20,10,5,2,1]
  balance_cost = balance_amount_to_customer
  while balance_cost > 0
      note_index = 0
      while((note_index < cashes.length) && ((balance_cost/cashes[note_index]).abs <= 0))
          note_index +=1
      end
      index = (cashes[note_index]).to_s
      while((note_index < cashes.length) && ($cash_box[index]<=0))
        if ((index.eql?("10"))  || (index.eql?("5")))
          index += "c"
          if $cash_box[index] ==0
           index=index.delete('c')
          else
           break
          end
        end
        note_index += 1
        index = (cashes[note_index]).to_s
      end
      if note_index == cashes.length
          if(balance_cost <= 5)
            puts "Sorry No change...Would you like to take a chocolate? Press Y for YES N for NO"
            chocolate_decision = gets.chomp().to_s
            if chocolate_decision.casecmp?("N")
              puts "No balance..Sorry"
              break
            end
            bill_amount += balance_cost
            balance_amount_to_customer= balance_cost
            break
          else
            puts "No balance..Sorry"
            break
          end
      else
          index = (cashes[note_index]).to_s
          if ((index.eql?("10"))  || (index.eql?("5")))
             index += "c"
             if $cash_box[index] ==0
              index=index.delete('c')
             end 
          end
          if($cash_box[index] != 0)
             balance_cost -= cashes[note_index]
             $cash_box[index] -= 1
          end
      end
   end
  puts $cash_box
  
  cash_box_index=0
  final_amount = 0 
  for i in ($cash_box.values)
    final_amount += $denomination[cash_box_index] * i
    cash_box_index += 1
  end
  puts(final_amount)
  balance_validation(final_amount,bill_amount,balance_amount_to_customer)
end

def balance_validation(final_amount,bill_amount,balance_amount_to_customer)
    previous_initial = $initial_amount
    if initial_cashbox_total(false) - previous_initial  == bill_amount
        puts "balance is correct"
    elsif (balance_amount_to_customer==0)  
        puts "balance is correct"   
    else 
        puts "balance is incorrect"
    end    
end 

initial_cashbox_total(true)

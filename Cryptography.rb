#!/usr/bin/ruby -w

$num1 = 0
$num2 = 0
$e = 0
$phi = 0
$n = 0
$d = 1
class Euclidean
  def GCD(num1, num2)
    _r = 0
    
    begin
      _r = num1 % num2
      
      if _r == 0
        break
      end
      
      num1 = num2
      num2 = _r
    end while true
    
    return num2
  end
  
 
  
  def extended_GCD(a,b)
    return[0,1] if a% b ==0
    x,y = extended_GCD(b, a % b)
    [y,x-y*(a/b)]
  end
end #Euclidean Class end

#RSA Class
class RSA
  $Euc = Euclidean.new
  def generateE(phi)
    
    begin
      exp = Random.rand(2..60)
    end while $Euc.GCD(phi,exp) != 1
    
    return exp
  end
  
  def generatePhi(num1,num2)
    phi = ((num1-1) * (num2-1))
    return phi
  end
  
  def primality(a)
    _s = 0
    _m = 0
    _n = a-1
    for i in 1.._n
      #puts "2 to the #{i}th power is #{2**i}"
      
      if _n % 2**i !=0
        break
      else
        _s = i
      end
      
    end
    _m = _n / 2**_s
    return [_s,_m]
  end
  
  def isPrime(a, num)
      if a % num  ==1 || a % num == -1
        #puts a
        return true
      else 
        a = a**2 % num
      end
      for i in 0..3
          if a % num  == 1
            return true
          
          
          elsif a ** num == -1
            return false
            
          else
            a = a**2 % num
           # puts a
          end
         
      end
      
      
      return false
  end
  
  
   
  def generate_primes(num)
    
    a = Random.rand(2**num..2**num) #if $Euc.is_prime?(a)
    
    return a
  end 
  
end #RSA Class end

$RSA = RSA.new

num1 = $RSA.generate_primes(512)

num2 = $RSA.generate_primes(512)
n = num1* num2
puts "P: #{num1} and \nQ: #{num2} and \nN: #{n}"



#phi = $RSA.generatePhi(num1,num2)





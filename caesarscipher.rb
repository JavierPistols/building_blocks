=begin
    caesar_cipher from The Odin Project
    I wraped the a to z and the z to a. Examples are shown at the end
=end


def caesar_cipher(string,key)
    high_bound_m = 90
    low_bound_m = 65
    high_bound_min = 122
    low_bound_min = 97
    alphabet_size = 26
    ciphered = ""
    
    (return string if string == "") 
    
    ciphering = lambda { |letter|

        move = (Math.sqrt(key**2) % alphabet_size).to_i    

        if key > 0
            if ("A".."Z").include?(letter)
                letter =  (letter.ord + move if (high_bound_m - letter.ord) >= move ) || ((low_bound_m - 1) + (move - (high_bound_m - letter.ord)) if (high_bound_m - letter.ord) < move)
                ciphered << letter
            elsif ("a".."z").include?(letter)
                letter =  (letter.ord + move if (high_bound_min - letter.ord) >= move ) || ((low_bound_min - 1)+ (move - (high_bound_min - letter.ord)) if (high_bound_min - letter.ord) < move)
                ciphered << letter
            else
                ciphered << letter
            end
        else
            if ("A".."Z").include?(letter)
                letter =  (letter.ord - move if ( letter.ord - low_bound_m) >= move ) || ((high_bound_m + 1) - (move - (letter.ord - low_bound_m)) if (letter.ord - low_bound_m) < move)
                ciphered << letter
            elsif ("a".."z").include?(letter)
                letter =  (letter.ord - move if ( letter.ord - low_bound_min) >= move ) || ((high_bound_min + 1)- (move - (letter.ord - low_bound_min)) if (letter.ord - low_bound_min) < move)
                ciphered << letter
            else
                ciphered << letter
            end
        end
    } 

    string.each_char(&ciphering) 
    ciphered
end



puts caesar_cipher("What a string!",5)
puts caesar_cipher("What a string!",-5)
puts caesar_cipher("Great guide odin project is", 114)
puts caesar_cipher("Great guide odin project is", -300)

#Bmfy f xywnsl!
#Rcvo v nomdib!
#Qbokd qesno ynsx zbytomd sc
#Sdqmf sgupq apuz bdavqof ue
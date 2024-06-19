.data
   mesaj: .asciiz "please enter two integers: \n"
   sonuc: .asciiz "raised to power is: "
.text
main:	        
                la $a0, mesaj         
                li $v0, 4               #mesajý yazdýr
                syscall
                
                li $v0, 5               
                syscall                 #birinci integer taban
                move $t0, $v0     
               
                li $v0, 5               
                syscall                #ikinci integer power
                move $t1, $v0 
                       		                
                la $a0, sonuc         
                li $v0, 4               #mesajý yazdýr
                syscall	       		
                       		
                move $a0,$t0            #temp registerlarý taþý
                move $a1,$t1       		
		
		jal	power	  	#fonksiyon		
		move	$a0, $v0    			      	               
		li	$v0, 1          #sonuç
		syscall						
											
		li	$v0, 10          #exit
		syscall

power:	        bne	$a1, $zero, recursion			
		li	$v0, 1					
		jr	$ra             #mul'a gidicek
recursion:
		addi	$sp, $sp, -4				
		sw	$ra, 0 ($sp)				
		addi	$a1, $a1, -1				
		jal	power					
		mul	$v0, $a0, $v0				
		lw	$ra, 0($sp)				
		addi	$sp, $sp, 4				
		jr	$ra				

      
      
      
    .data

msg_fsu: .asciiz  "Florida State University retained its place in the Top 20 among national public universities in the latest U.S. News & World Report rankings, while improving in several key measures considered in the publication’s methodology.

 

FSU is No. 19 on the list, marking the second consecutive year that the university placed in the Top 20. The rankings appear in U.S. News & World Report’s “Best Colleges 2021” guidebook.

 

“Our continued recognition as one of the nation’s Top 20 public universities is a reflection of Florida State’s commitment to academic excellence and student success,” said President John Thrasher. “This is the result of hard work by our students, faculty and staff and support from the Florida Legislature and the Florida Board of Governors, who have been staunch champions of our goals and aspirations.” 

 

The university improved on 11 of 15 key factors used to compile the ranking score. Once again, the metrics shined a spotlight on Florida State’s continued emphasis on student success. \n\n"

 

msg_char: .asciiz "a"

msg_print0: .asciiz "Char "

msg_print1: .asciiz " appeared "

msg_print2: .asciiz " times\n"

 

      .text

      .globl main

main:

      li $v0,4

      la $a0,msg_fsu

      syscall

     

      li $s1, 'a'

      li $s7, 'z'

      addi $s7, $s7, 1  #set s7 to {


     

main_L1:  

      la $a0, msg_char  #loads address of msg_char into a0

      sb $s1, 0($a0)    #store the value of $a0 into $s1

      la $a0, msg_fsu   #load address of msg_fsu into $a0

      ori $a1, $s1, 0   #

      jal charfreq

      ori $s0, $v0, 0
      #jal charfreq

 

      li $v0,4

      la $a0,msg_print0

      syscall

      li $v0,4

      la $a0,msg_char

      syscall

          

      li $v0,4

      la $a0,msg_print1

      syscall

     

      li  $v0, 1        #preparing to print   

    ori $a0, $s0, 0     #oring $s0 with 0 and storing it in a0

    syscall    

     

      li $v0,4

      la $a0,msg_print2

      syscall

 

      addi $s1, $s1, 1

      slt $t0, $s1, $s7

      bne $t0, $0, main_L1

 

      li $v0,10 #exit

      syscall

 

charfreq: 
    #a1 is the current ASCII value 
    #a0 is the current address
  
      addi $v0, $zero, 0      #counter = 0 

      Loop:
      lb $t4, 0($a0)          #current address character in t4
      addi $a0, $a0, 1

      beq $t4, $zero, EndLoop #stopholder STRONG

      bne $a1, $t4, Loop      #Looper (Equality Checker)
      
      #Adder:
      addi $v0, $v0, 1        #adds 1 to the counter
                              #bne $t4, $zero, Loop  #problem line
      j Loop                  #work on eliminating this

      EndLoop:
      jr $ra 
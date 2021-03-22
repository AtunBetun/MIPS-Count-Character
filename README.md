# MIPS-Count-Character
 Write a function that counts the number of times a character appears in an ASCIIZ string, where the starting address of the string is in $s0 and the ASCII code of the character is in $a1.


Please note that if more than 7 instructions are used, 5 points will be deducted for each additional instruction until no more points are left. Keep in mind that some pseudo instructions may result in more than one real instruction and the number of real instructions is counted.


The following is the template code, and you will need just to implement the charfreq function.

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

      addi $s7, $s7, 1

     

    main_L1:  

      la $a0, msg_char

      sb $s1, 0($a0)

      la $a0, msg_fsu

      ori $a1, $s1, 0

      jal charfreq

      ori $s0, $v0, 0

 

      li $v0,4

      la $a0,msg_print0

      syscall

      li $v0,4

      la $a0,msg_char

      syscall

          

      li $v0,4

      la $a0,msg_print1

      syscall

     

      li  $v0, 1         

    ori $a0, $s0, 0

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

      jr $ra    

 

    Sample output:

 

    Char a appeared 54 times

    Char b appeared 6 times

    Char c appeared 30 times

    Char d appeared 32 times

    Char e appeared 88 times

    Char f appeared 12 times

    Char g appeared 14 times

    Char h appeared 30 times

    Char i appeared 66 times

    Char j appeared 0 times

    Char k appeared 8 times

    Char l appeared 29 times

    Char m appeared 15 times

    Char n appeared 61 times

    Char o appeared 64 times

    Char p appeared 21 times

    Char q appeared 0 times
 
    Char r appeared 47 times

    Char s appeared 63 times

    Char t appeared 65 times

    Char u appeared 26 times

    Char v appeared 11 times

    Char w appeared 5 times

    Char x appeared 1 times

    Char y appeared 9 times

    Char z appeared 0 times

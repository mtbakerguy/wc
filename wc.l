%{ 
#include<stdio.h> 
#include<string.h> 
unsigned int numchars = 0; 
unsigned int numwords = 0; 
unsigned int numlines = 0; 
unsigned int inword = 0;
%} 
  
/* Rules Section*/
%% 
[\t\r\n \v\f] {numchars++;inword=0; if(*yytext == '\n')numlines++; }
. {numchars++; if(inword == 0)numwords++; inword=1;} 
%% 
  
int yywrap(void){ return 1;} 
  
int main(int argc,char* argv[]) 
{    
    if(argc == 2)yyin = fopen(argv[1],"r");
    yylex(); 
     
    printf("\t%d\t%d\t%d\t%s\n",numlines,numwords,numchars,
           (argc == 2 ? argv[1] : "")); 
    return 0; 
} 

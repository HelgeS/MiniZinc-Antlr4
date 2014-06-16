lexer grammar MiniZincLexer;

SINGLE_LINE_COMMENT : '%' ~[\r\n]* -> skip ;
ID : [a-zA-Z]+ ;
INT : NAT | '-' NAT;
NAT : [0-9]+ ; 
WS : [ \t\r\n]+ -> skip;
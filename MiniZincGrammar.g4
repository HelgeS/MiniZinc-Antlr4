grammar MiniZincGrammar;
import MiniZincLexer;
prog: (stat ';')+;
stat: data
    | constraint
    | var
    | solve
    | output
    ;  

data: 'enum' ID '=' '{' constr(','constr)* '}';
constraint : 'constraint'  expr;
var : 'var' typename ':'  ID ;
output :'output' '(' list ')';
solve : 'solve' 'satisfy';

constr: scons | tcons;
scons: ID ;
tcons: ID '('arg (','arg)*')' ;
arg : argint 
    | argfloat
    | argbool
    | argunion
    | argrange
    ;
argint   : rint;
argfloat : rfloat;
argbool  : rbool;
argunion : ID;
argrange : range;

typename : rint
         | rbool
         | rfloat 
         | ID 
         | typedata
         | range
         ;

typedata : ID'('INT')';

expr:   minusExpr
    |   expr ('*'|'/') expr   
    |   expr ('+'|'-') expr   
    |   expr ('<'|'>' |'>=' | '<=') expr     
    |   expr ('/\\'|'\\/') expr     
    |   expr '->' expr   
    |   expr '<-' expr   
    |  expr ('=' | '==' | '!=') expr
    |   INT    
    |   notExpr  
    |   boolExpr
    |   stringExpr
    |   showExpr
    |   predOrUnionExpr    
    |   idexpr                 
    |   rbracketExpr
    ;
notExpr        : 'not' '(' expr ')';
minusExpr      :  '-' '(' expr ')';
predOrUnionExpr: ID '('expr (','expr)*')';
rbracketExpr    :  '(' expr ')';
idexpr : ID;
boolExpr :'true' | 'false' ;
showExpr : 'show' '(' ID ')';
stringExpr : '"' string  '"';
string : ((~('"') | '\\n'))*;
list: '['expr (','expr)* ']';

range : fromR '..' toR;
fromR : INT;
toR  : INT;
rint   : 'int';
rfloat : 'float';
rbool  : 'bool';
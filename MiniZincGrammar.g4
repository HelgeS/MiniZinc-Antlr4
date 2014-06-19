grammar MiniZincGrammar;
import MiniZincLexer;
model: (stat ';')+;
stat: data
    | constraint
    | decl
    | solve
    | output
    | predicate
    | function
    | include
    | init
    ;  

decl : vardecl | pardecl;
vardecl : var | vararray;
pardecl : parameter | pararray;

data: 'enum' ID '=' '{' constr(','constr)* '}';
constraint : 'constraint'  expr;
var : 'var' typename ':'  ID ;
output :'output' '(' listExpr ')' | 'output'  listExpr ;
solve : 'solve' (satisfy | optimize);
parameter : 'par'? typename ':'  ID ('=' expr)?;
include : 'include' stringExpr;
init : ID '=' expr;

predicate : 'predicate' ID'(' (decl(','decl)*)? ')' '=' expr;
function : 'function';

satisfy : 'satisfy';
optimize : maximize | minimize;
maximize : 'maximize' expr;
minimize : 'minimize' expr;

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
         | typeset
          ;
typeset : 'set' 'of' typename;
vararray : 'array' dimensions 'of' var;
pararray : 'array' dimensions 'of'  parameter;
dimensions : '[' range  (','range)*']';

typedata : ID'('integer')';

expr:  boolComplexExpr
    |   arithComplexExpr
    |   stringExpr 
    |   rbracketExpr
    | setExpr
    | listExpr
    | expr infixOp expr
    | arrayaccess 
    | ifExpr 
    | letExpr 
    | predOrUnionExpr 
    | BOOL
    | integer
    | ID
    | '_'
        ;


boolVal : ID 
      | BOOL 
      | arrayaccess 
      | ifExpr 
      | letExpr 
      | predOrUnionExpr 
      | '(' boolExpr ')'
      ;

boolComplexExpr:
       arithExpr ('<'|'>' |'>=' | '<=') arithExpr   
    |   boolExpr ('/\\'|'\\/') boolExpr     
    |   boolExpr '->' boolExpr   
    |   boolExpr '<-' boolExpr   
    |   boolExpr '<->' boolExpr   
    |   arithExpr ('=' | '==' | '!=') arithExpr
    |   boolExpr ('=' | '==' | '!=') boolExpr
    |   notExpr  
    |   forallExpr
    |   existsExpr
;

boolExpr : 
       arithExpr ('<'|'>' |'>=' | '<=') arithExpr   
    |   boolExpr ('/\\'|'\\/') boolExpr     
    |   boolExpr '->' boolExpr   
    |   boolExpr '<-' boolExpr   
    |   boolExpr '<->' boolExpr   
    |   arithExpr ('=' | '==' | '!=') arithExpr
    |   boolExpr ('=' | '==' | '!=') boolExpr
    |   notExpr  
    |   forallExpr
    |   existsExpr
    |   boolVal
    ;

operand : ID | integer | arrayaccess | ifExpr | letExpr |  '('arithExpr ')';
arithComplexExpr :
         minusExpr
    |   arithExpr ('*'|'/') expr   
    |   arithExpr ('+'|'-') expr   
    |   sumExpr
    |   prodExpr
   ;
  
arithExpr : 
         minusExpr
    |   arithExpr ('*'|'/') expr   
    |   arithExpr ('+'|'-') expr   
    |   sumExpr
    |   prodExpr
    |   operand
   ;


notExpr        : 'not'  expr ;
minusExpr      :  '-' '(' expr ')';
predOrUnionExpr: ID '('expr (','expr)*')';
rbracketExpr    :  '(' expr ')';
idexpr : ID;
stringExpr : '"' string  '"';
infixOp : '`' ID  '`';
arrayaccess : ID '[' expr(','expr)* ']';



// lists
listExpr: listValue 
          | listExpr '++' expr
          | oneDimList 
          | multiDimList ;
oneDimList :  simpleList | guardedList  ;
simpleList : '[' (expr (','expr)*)? ']';
guardedList : '[' (expr (','expr)*)? '|'  inDecl (',' inDecl)* ']' ;
multiDimList : '[|' (expr (','expr)*)? ('|' expr (','expr)*  )*  '|]' ;

listValue : ID | ifExpr | arrayaccess | showExpr;
showExpr : 'show' '(' expr ')';

// forall, exists, sum, prod
forallExpr : 'forall' guard_expr;
existsExpr : 'exists' guard_expr;
sumExpr : 'sum' guard_expr;
prodExpr : 'prod' guard_expr;

guard_expr : twoSections | oneSection;

oneSection  : '(' listExpr ')';
twoSections : '(' inDecl (',' inDecl)*')' '(' expr ')';

inDecl : ID (','ID)* 'in' range whereCond?;
whereCond : 'where' expr;

// let
letExpr : 'let' '{' decl   (',' decl)* '}' 'in' expr;

// if
ifExpr : 'if' expr 'then' expr 'else' expr 'endif';

// sets
setExpr : bracketExpr | range;
bracketExpr : '{'(expr (','expr)*)? '}';

range : fromR '..' toR
      | ID
      ;

fromR : arithExpr;
toR  : arithExpr;
rint   : 'int';
rfloat : 'float';
rbool  : 'bool';
integer : NAT | '-' NAT;


string : ((~('"') | ESC | '.'))*;
//string : (ESC|.)*?;
ESC:'\\"' | '\\\\' | '\\n' | '\\t';


grammar MiniZincGrammar;
import MiniZincLexer;
prog: (stat ';')+;
stat: data
    | constraint
    | decl
    | solve
    | output
    | predicate
    | function
    | include
    ;  

decl : vardecl | pardecl;
vardecl : var | vararray;
pardecl : parameter | pararray;

data: 'enum' ID '=' '{' constr(','constr)* '}';
constraint : 'constraint'  expr;
var : 'var' typename ':'  ID ;
output :'output' '(' list ')' | 'output'  list ;
solve : 'solve' 'satisfy';
parameter : 'par'? typename ':'  ID ('=' expr)?;
include : 'include' stringExpr;
predicate : 'predicate' ID'(' (decl(','decl)*)? ')' '=' expr;
function : 'function';

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

expr:  arithExpr
    |   expr ('/\\'|'\\/') expr     
    |   expr '->' expr   
    |   expr '<-' expr   
    |   expr '<->' expr   
    |  expr ('=' | '==' | '!=') expr
    |  expr  '`'ID'`' expr
//    |   integer 
    |   notExpr  
    |   boolExpr
    |   stringExpr
//    |   showExpr
    |   predOrUnionExpr    
//    |   idexpr  
    |   arrayaccess               
    |   rbracketExpr
    |   setExpr
    |   forallExpr
    |   existsExpr
    ;

arithExpr : operand
    |   minusExpr
    |   arithExpr infixOp expr
    |   arithExpr ('*'|'/') expr   
    |   arithExpr ('+'|'-') expr   
    |   arithExpr ('<'|'>' |'>=' | '<=') expr     
    |   '('arithExpr ')'
   ;

operand : ID | integer;

notExpr        : 'not'  expr ;
minusExpr      :  '-' '(' expr ')';
predOrUnionExpr: ID '('expr (','expr)*')';
rbracketExpr    :  '(' expr ')';
idexpr : ID;
boolExpr :'true' | 'false' ;
//showExpr : 'show' '(' ID ')';
stringExpr : '"' string  '"';
infixOp : '`' ID  '`';
arrayaccess : ID '[' expr(','expr)* ']';

list: '['(expr (','expr)*)? ']';

// forall, exists
forallExpr : 'forall' remainderQuantifier;
existsExpr : 'exists' remainderQuantifier;
remainderQuantifier : '(' inDecl (',' inDecl)*')' '(' expr ')';
inDecl : ID 'in' range whereCond?;
whereCond : 'where' expr;

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


string : ((~('"') | '\\n' | '.'))*;
//string : (ESC|.)*?;
//ESC:'\\"' | '\\\\' | '\\n';


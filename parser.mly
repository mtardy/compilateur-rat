/* Imports. */

%{

open Type
open Ast.AstSyntax
%}


%token <int> ENTIER
%token <string> ID
%token <string> CHAINE
%token RETURN
%token PV
%token AO
%token AF
%token PF
%token PO
%token EQUAL
%token CONST
%token PRINT
%token IF
%token ELSE
%token WHILE
%token BOOL
%token INT
%token RAT
%token STRING
%token CALL 
%token CO
%token CF
%token SLASH
%token NUM
%token DENOM
%token TRUE
%token FALSE
%token PLUS
%token MULT
%token INF
%token CONCAT
%token LENGTH
%token V
%token AMP
%token NEW
%token NULL
%token EOF

(* Type de l'attribut synthétisé des non-terminaux *)
%type <programme> prog
%type <instruction list> bloc
%type <fonction> fonc
%type <instruction list> is
%type <instruction> i
%type <typ> typ
%type <(typ*string) list> dp
%type <expression> e 
%type <expression list> cp

(* Type et définition de l'axiome *)
%start <Ast.AstSyntax.programme> main

%%

main : lfi = prog EOF     {lfi}

(* On analyse un programme en séparant la partie avant le bloc main et la partie après*)
prog :
| lf1 = dfs ID li = bloc lf2 = dfs   {Programme (lf1,li,lf2)}

(* Une suite de fonctions et de prototypes *)
dfs :
|                       {[]}
| d = decl df = dfs     {d::df}
| f = fonc df = dfs     {f::df}

fonc : t=typ n=ID PO p=dp PF AO li=is RETURN exp=e PV AF {Fonction(t,n,p,li,exp)}

decl : t=typ n=ID PO p=dp PF PV {Prototype(t,n,p)}

bloc : AO li = is AF      {li}

is :
|                         {[]}
| i1=i li=is              {i1::li}

i :
| t=typ n=ID EQUAL e1=e PV          {Declaration (t,n,e1)}
| CONST n=ID EQUAL e=ENTIER PV      {Constante (n,e)}
| PRINT e1=e PV                     {Affichage (e1)}
| IF exp=e li1=bloc ELSE li2=bloc   {Conditionnelle (exp,li1,li2)}
| WHILE exp=e li=bloc               {TantQue (exp,li)}
| aff=a EQUAL exp=e PV              {Affectation (aff, exp)}

(* Affectables *)
a :
| n=ID                    {Ident n}
| PO MULT aff=a PF        {Valeur aff}

dp :
|                         {[]}
| t=typ n=ID lp=dp        {(t,n)::lp}

typ :
| BOOL      {Bool}
| INT       {Int}
| RAT       {Rat}
| STRING    {Str}
| t=typ MULT{Pointeur t}

e :
| PO n=e AO e1=e V e2=e AF PF {SousChaine(n,e1,e2)}
| CALL n=ID PO lp=cp PF   {AppelFonction (n,lp)}
| CO e1=e SLASH e2=e CF   {Rationnel(e1,e2)}
| NUM e1=e                {Numerateur e1}
| DENOM e1=e              {Denominateur e1}
| LENGTH n=e              {Taille n}
| TRUE                    {True}
| FALSE                   {False}
| e=ENTIER                {Entier e}
| e=CHAINE                {Chaine e}
| aff=a                   {Acces aff}
| NULL                    {Null}
| PO NEW t=typ PF         {New t}
| AMP n=ID                {Adresse n}
| PO e1=e CONCAT e2=e PF  {Binaire (Concat,e1,e2)}
| PO e1=e PLUS e2=e PF    {Binaire (Plus,e1,e2)}
| PO e1=e MULT e2=e PF    {Binaire (Mult,e1,e2)}
| PO e1=e EQUAL e2=e PF   {Binaire (Equ,e1,e2)}
| PO e1=e INF e2=e PF     {Binaire (Inf,e1,e2)}

cp :
|               {[]}
| e1=e le=cp    {e1::le}


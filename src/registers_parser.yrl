Nonterminals program instruction register operation boolean_expr operator value.
Terminals ident 'if' inc dec integer '==' '!=' '<' '>' '<=' '>='.
Rootsymbol program.

program ->
    instruction program : ['$1'|'$2'].

program ->
    '$empty' : [].

instruction ->
    register operation 'if' boolean_expr : {'$1', '$2', '$4'}.

register ->
    ident : '$1'.

operation ->
    inc integer : '$2'.

operation ->
    dec integer : negate('$2').

boolean_expr ->
    value operator value : {'$2', '$1', '$3'}.

operator -> '==' : '=='.
operator -> '!=' : '!='.
operator -> '<'  : '<'.
operator -> '>'  : '>'.
operator -> '<=' : '<='.
operator -> '>=' : '>='.


value ->
    ident : '$1'.

value ->
    integer : '$1'.

Erlang code.

negate({integer, X}) ->
    {integer, 0-X}.

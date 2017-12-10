Definitions.

IDENT      = [a-zA-Z]+
WHITESPACE = [\s\t\n\r]+
INTEGER    = -?[0-9]+

Rules.

if           : {token, {'if'}}.
inc          : {token, {inc}}.
dec          : {token, {dec}}.
==           : {token, {'=='}}.
<            : {token, {'<'}}.
>            : {token, {'>'}}.
<=           : {token, {'<='}}.
>=           : {token, {'>='}}.
!=           : {token, {'!='}}.
{WHITESPACE} : skip_token.
{INTEGER}    : {token, {integer, list_to_integer(TokenChars)}}.
{IDENT}      : {token, {ident, TokenChars}}.

Erlang code.

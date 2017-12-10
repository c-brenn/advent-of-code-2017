Definitions.

CANCEL = \!.
RUBBISH = [^{},<>!]
WHITESPACE = [\n\r]+

Rules.

{CANCEL} : skip_token.
{WHITESPACE} : skip_token.
{RUBBISH} : {token, {rubbish, TokenLine}}.
\{ : {token, {'{', TokenLine}}.
\} : {token, {'}', TokenLine}}.
\, : {token, {',', TokenLine}}.
<  : {token, {'<', TokenLine}}.
>  : {token, {'>', TokenLine}}.

Erlang code.

Nonterminals group group_members group_member member_list garbage anything.
Terminals ',' '{' '}' '>' '<' rubbish.
Rootsymbol group.

Nonassoc 200 '<' '>' ',' '{' '}'.

group ->
    '{' group_members '}' : {group, '$2'}.

group_members ->
    '$empty' : [].

group_members ->
    group_member member_list : ['$1'|'$2'].

group_member ->
    group : '$1'.

group_member ->
    garbage : '$1'.

member_list ->
    '$empty' : [].

member_list ->
    ',' group_member member_list : ['$2'|'$3'].

garbage ->
    '<' anything '>' : {garbage, '$2'}.

anything -> '$empty' : 0.
anything -> rubbish anything : 1 + '$2'.
anything -> ',' anything : 1 + '$2'.
anything -> '<' anything : 1 + '$2'.
anything -> '{' anything : 1 + '$2'.
anything -> '}' anything : 1 + '$2'.

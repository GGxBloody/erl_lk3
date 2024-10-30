-module(lesson3_task1).
-export([first_word/1]).

first_word(BinText) when is_binary(BinText) ->
    first_word_helper(BinText, []).

first_word_helper(<<>>, Acc) ->
    list_to_binary(lists:reverse(Acc));
first_word_helper(<<32, _/binary>> = Rest, Acc) ->
    % 32 - код пробілу в UTF-8
    list_to_binary(lists:reverse(Acc));
first_word_helper(<<Char, Rest/binary>>, Acc) ->
    first_word_helper(Rest, [Char | Acc]).

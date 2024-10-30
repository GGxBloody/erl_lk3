-module(lesson3_task2).
-export([words/1]).

words(BinText) when is_binary(BinText) ->
    words_helper(BinText, [], []).

words_helper(<<>>, WordAcc, Words) ->
    lists:reverse([list_to_binary(lists:reverse(WordAcc)) | Words]);
words_helper(<<32, Rest/binary>>, WordAcc, Words) ->
    words_helper(Rest, [], [list_to_binary(lists:reverse(WordAcc)) | Words]);
words_helper(<<Char, Rest/binary>>, WordAcc, Words) ->
    words_helper(Rest, [Char | WordAcc], Words).

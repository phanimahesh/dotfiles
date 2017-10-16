-module(user_default).
-compile(export_all).

%% If this header can't be found clone gh:erszcz/docsh
%% and add it to ERL_LIBS. See its README.
-include_lib("docsh/include/docsh_user_default.hrl").

%% @doc Save history to a file.
saveh(File) ->
    {ok, Io} = file:open(File, [write, read, delayed_write]),
    GetHist = fun() ->
        {links, [Shell|_]} = hd(process_info(self(), [links])),
        Shell ! {shell_req, self(), get_cmd},
        receive {shell_rep, Shell, R} -> R end
    end,
    Commands = lists:sort([{N,C} || {{command, N}, C} <- GetHist()]),
    try
        [case Trees of 
         []     -> ok;
         [T]    -> io:format(Io, "~s.\n", [erl_prettypr:format(T)]);
         [T|Ts] -> io:format(Io, "~s~s.\n", [
                    erl_prettypr:format(T), [", "++erl_prettypr:format(Tree) || Tree <- Ts]
                   ])
         end || {_, Trees} <- Commands],
        ok
    after 
        file:close(Io)
end.

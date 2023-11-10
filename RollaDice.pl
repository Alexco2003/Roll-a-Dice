% Roll the dice
roll_dice(D1, D2) :-
    D1 is random(6) + 1,
    D2 is random(6) + 1.

% Calculate the sum of two dice
dice_sum(D1, D2, Sum) :-
    Sum is D1 + D2.

% Rule for winning with 1+1
winner(2, 2, _, _) :- write('It\'s a tie!'), nl.
winner(2, _, Player1Name, _) :- write(Player1Name), write(' won!'), nl.
winner(_, 2, _, Player2Name) :- write(Player2Name), write(' won!'), nl.

% Rule for general winning
winner(Player1Sum, Player2Sum, Player1Name, _) :- Player1Sum > Player2Sum, write(Player1Name), write(' won!'), nl.
winner(Player1Sum, Player2Sum, _, Player2Name) :- Player2Sum > Player1Sum, write(Player2Name), write(' won!'), nl.
winner(Player1Sum, Player2Sum, _, _) :- Player1Sum =:= Player2Sum, write('It\'s a tie!'), nl.

play :-
    write('Welcome to "Roll a Dice"!'), nl, nl,
    write('Enter name for Player 1: '), read_line_to_string(user_input, Player1NameString),
    atom_string(Player1Name, Player1NameString),
    write('Enter name for Player 2: '), read_line_to_string(user_input, Player2NameString),
    atom_string(Player2Name, Player2NameString), nl, 
    write('Rolling the dice for '), write(Player1Name), write('...'), nl,
    roll_dice(Player1Dice1, Player1Dice2),
    write(Player1Name), write(': '), write(Player1Dice1), write(' + '), write(Player1Dice2),
    dice_sum(Player1Dice1, Player1Dice2, Player1Sum),
    write(' = '), write(Player1Sum), nl, nl,
    write('Rolling the dice for '), write(Player2Name), write('...'), nl,
    roll_dice(Player2Dice1, Player2Dice2),
    write(Player2Name), write(': '), write(Player2Dice1), write(' + '), write(Player2Dice2),
    dice_sum(Player2Dice1, Player2Dice2, Player2Sum),
    write(' = '), write(Player2Sum), nl, nl,
    winner(Player1Sum, Player2Sum, Player1Name, Player2Name), !.



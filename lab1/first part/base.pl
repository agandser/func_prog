% 1. Реализация предиката my_length/2 (вычисление длины списка)
my_length([], 0).
my_length([_|Y], N) :- my_length(Y, N1), N is N1 + 1.

% 2. Реализация предиката my_member/2 (проверка, является ли элемент членом списка)
my_member(A, [A|_]).
my_member(A, [_|Z]) :- my_member(A, Z).

% 3. Реализация предиката my_append/3 (объединение двух списков)
my_append([], X, X).
my_append([A|X], Y, [A|Z]) :- my_append(X, Y, Z).

% 4. Реализация предиката my_remove/3 (удаление элемента из списка)
my_remove(X, [X|T], T).
my_remove(X, [Y|T], [Y|T1]) :- my_remove(X, T, T1).

% 5. Реализация предиката my_permute/2 (перестановки списка)
my_permute([], []).
my_permute(L, [X|T]) :- my_remove(X, L, R), my_permute(R, T).

% 6. Реализация предиката my_sublist/2 (подсписки списка)
my_sublist([], []).
my_sublist([H|T], [H|S]) :- my_sublist(T, S).
my_sublist([_|T], S) :- my_sublist(T, S).

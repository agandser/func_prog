:- [base].

% Предикат удаления трех последних элементов списка на основе стандартных предикатов
remove_last_three_std(L, R) :-
    my_length(L, Len),              % Вычисляем длину списка
    Len >= 3,                       % Проверяем, что длина списка хотя бы 3
    N is Len - 3,                   % Рассчитываем количество элементов до последних трех
    my_append(R, _, L),             % Разделяем список на две части: первые N элементов и последние 3
    my_length(R, N).                % Проверяем, что первая часть содержит N элементов
remove_last_three_std(L, R) :-
    my_length(L, Len),              % Вычисляем длину списка
    Len < 3,                       % Проверяем, что длина списка хотя бы 3
    N = 0,                   % Рассчитываем количество элементов до последних трех
    my_append(R, _, L),             % Разделяем список на две части: первые N элементов и последние 3
    my_length(R, N). 
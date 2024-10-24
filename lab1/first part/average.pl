% Предикат, который одновременно вычисляет сумму и количество элементов списка
sum_and_length([], 0, 0).
sum_and_length([H|T], Sum, Len) :-
    sum_and_length(T, Sum1, Len1),
    Sum is Sum1 + H,          % Вычисляем сумму элементов
    Len is Len1 + 1.          % Считаем количество элементов

% Предикат вычисления среднего арифметического без использования стандартных предикатов
average(L, Avg) :-
    sum_and_length(L, Sum, Len),
    Len > 0,                  % Убеждаемся, что список непустой
    Avg is Sum / Len.         % Вычисляем среднее арифметическое

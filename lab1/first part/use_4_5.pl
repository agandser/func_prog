:- [remove_last_three].
:- [average].

% Предикат, который сначала удаляет три последних элемента, а затем вычисляет среднее арифметическое оставшегося списка
process_list(L, Avg) :-
    remove_last_three(L, L1),  % Удаляем последние три элемента
    average(L1, Avg).          % Вычисляем среднее арифметическое оставшегося списка

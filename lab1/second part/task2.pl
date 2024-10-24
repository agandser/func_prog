:- [trans_three].

% Средний балл студента
average_grade(Student, Average) :-
    student(_, Student, Grades),
    findall(Grade, member(grade(_, Grade), Grades), GradeList),
    sum_list(GradeList, Sum),
    length(GradeList, Count),
    Average is Sum / Count.

% Проверка, сдал ли студент все экзамены
passed(Student) :-
    student(_, Student, Grades),
    \+ (member(grade(_, Grade), Grades), Grade < 3).

% Информация о студенте: средний балл и сдал/не сдал
student_info(Student, Average, Passed) :-
    average_grade(Student, Average),
    (passed(Student) -> Passed = 'yes'; Passed = 'no').

% Количество не сдавших студентов по предмету
failed_subject(Subject, Count) :-
    subject(Code, Subject),
    findall(Student, 
        (student(_, Student, Grades), member(grade(Code, Grade), Grades), Grade < 3), 
        FailedStudents),
    length(FailedStudents, Count).

% Средний балл студентов в группе
group_students_average(Group, StudentsAverages) :-
    findall((Student, Average),
        (student(Group, Student, _), average_grade(Student, Average)),
        StudentsAverages).

% Студенты с максимальным средним баллом в группе
max_average_in_group(Group, MaxStudent) :-
    group_students_average(Group, StudentsAverages),
    findall(Average, member((_, Average), StudentsAverages), Averages),
    max_list(Averages, MaxAvg),
    findall(Student, member((Student, MaxAvg), StudentsAverages), MaxStudent).


% Задание 1: Для каждого студента, найти средний балл и сдал ли он экзамены
task1 :-
    student(_, Student, _),
    student_info(Student, Average, Passed),
    write(Student), write(': Average = '), write(Average), write(', Passed = '), writeln(Passed),
    fail.
task1.

% Задание 2: Для каждого предмета, найти количество не сдавших студентов
task2 :-
    subject(_, Subject),
    failed_subject(Subject, Count),
    write(Subject), write(': Failed students = '), writeln(Count),
    fail.
task2.

% Задание 3: Для каждой группы, найти студента (студентов) с максимальным средним баллом
task3 :-
    findall(Group, student(Group, _, _), Groups),
    list_to_set(Groups, UniqueGroups),
    member(Group, UniqueGroups),
    max_average_in_group(Group, MaxStudents),
    write('Group '), write(Group), write(': Max students = '), writeln(MaxStudents),
    fail.
task3.

% Директива для автоматического выполнения всех заданий при запуске программы
:- initialization(main).

main :-
    writeln('Task 1: Average grade and exam result for each student:'),
    task1,
    writeln('Task 2: Number of failed students for each subject:'),
    task2,
    writeln('Task 3: Students with the highest average in each group:'),
    task3.
:- use_module(library(csv)).
:- use_module(library(date)).

read_csv_and_store(Filename) :-
	csv_read_file(Filename, Rows, []),
	process_rows(Rows),
	retract(employee('EEID', _, _, _, _, _, _, _, _, _, _, _, _, _)).

process_rows([]).
process_rows([Row|Rows]) :-
    process_row(Row),
    process_rows(Rows).

process_row(row(EEID, Name, Job, Department, Unit, Gender, Ethnicity, Age, Hired, Salary, Bonus, Country, City, Exit)) :-
	assert(employee(EEID, Name, Job, Department, Unit, Gender, Ethnicity, Age, Hired, Salary, Bonus, Country, City, Exit)).
%Task 1
is_seattle_employee(Name) :-
    employee(_, Name, _, _, _, _, _, _, _, _, _, _, 'Seattle', _).
%Task 2	
is_senior_manager_in_IT(Name) :-
    employee(_, Name, 'Sr. Manger', 'IT', _, _, _, _, _, _, _, _, _, _).
%Task 3
is_director_finance_miami(Name) :-
	Job = 'Director',
	Department = 'Finance',
	City = 'Miami',
	employee(_, Name, Job, Department, _, _, _, _, _, _, _, _, City, _).
%Task 4
is_asian_US_manufacturing_40M(Name, Unit, Gender, Ethinicity, Age) :-
	employee(_, Name, _, _,  Unit, Gender, Ethinicity, Age, _, _, _, 'United States', _, _),
	Unit = 'Manufacturing',
	Gender = 'Male',
	Ethinicity = 'Asian',
 	Age > 40.
	
%Task 5
greet(EEID) :-
    employee(EEID, Name, Job, Department, Unit, _, _, _, _, _, _, _, _, _),
    write('Hello, '), write(Name), write(', '), write(Job), write(' of '), write(Department), write(', '), write(Unit), write('!').
%Task 6
years_until_retirement(Name,Age,Years_to_retire) :-
	employee(_, Name,_,_,_,_,_,Age,_,_,_,_,_,_),
	RetirementAge = 65,
	Years_to_retire is RetirementAge - Age.
%Task 7
is_rd_black_midAge(Name,Unit,Ethnicity,Age) :-
	employee(_, Name, _,_, Unit,_,Ethnicity,Age,_,_,_,_,_,_),
	Unit= 'Research & Development',
	Ethnicity = 'Black',
	Age >= 25,
	Age =< 50.
%Task 8
is_ITorFin_PHXorMIAorAUS(Name, Department,City) :-
	employee(_, Name, _,Department, _,_,_,_,_,_,_,_,City,_),
	(Department = 'IT' ; Department = 'Finance'),
	(City = 'Phoenix'; City = 'Miami' ; City = 'Austin').
%Task 9
is_female_senior_role(Name, Job) :-
	employee(_, Name, Job,_, _, 'Female', _, _, _, _, _, _, _,_),
	split_string(Job, '.','',[Title|_]),
	Title = "Sr".

%Helper code to convert any atom to number
convert_to_number(AtomString, Number) :-
    split_string(AtomString, '$%, ','', NewString),
    atomic_list_concat(NewString, NoSymbols),
    atom_number(NoSymbols, Number).
%Task 10
is_highly_paid_senior_manager(Name, Salary) :-
    employee(_, Name, 'Sr. Manger', _, _, _, _, _, _, Salary, _, _, _, _),
    convert_to_number(Salary, ConvertedSalary),
    ConvertedSalary > 120000.
    
% Using stackOverFlow answer
divisible(X,Y) :- 0 is X mod Y, !.
divisible(X,Y) :- X > Y+1, divisible(X, Y+1).
isPrime(2) :- true,!.
isPrime(X) :- X < 2,!,false.
isPrime(X) :- not(divisible(X, 2)).
%Task 11
is_prime_age(Name, Age) :-
	employee(_, Name,_,_,_,_,_,Age,_,_,_,_,_,_),
	isPrime(Age).
%Task 13
total_salary(Name,Total_Salary):-
	employee(_, Name, _, _, _, _, _, _, _, Salary, Bonus, _, _, _),
	convert_to_number(Salary, ConvertedSalary),
	convert_to_number(Bonus, ConvertedBonus),
	Total_Salary is ConvertedSalary + (ConvertedSalary * (ConvertedBonus / 100)).
%Task 14
takehome_salary(Name, Job, Take_home_salary) :-
	employee(_, Name, Job, _, _, _, _, _, _, Salary, Bonus, _, _, _),
        convert_to_number(Salary, ConvertedSalary),
        convert_to_number(Bonus, ConvertedBonus),
        Total_Salary is ConvertedSalary + (ConvertedSalary * (ConvertedBonus / 100)),	
        (Total_Salary =< 50000 -> Take_home_salary is Total_Salary - (Total_Salary*0.2)
	; (Total_Salary > 50000 , Total_Salary =< 100000) -> Take_home_salary is Total_Salary - (Total_Salary*0.25)
	; (Total_Salary > 100000 , Total_Salary =< 200000) -> Take_home_salary is Total_Salary - (Total_Salary*0.3)
	; Take_home_salary is Total_Salary - (Total_Salary*0.35)).


%Task 15 Helper Code to convert yearstring to 2 digit number or the current year
get_year(Original,After) :-
    get_time(Stamp),
    stamp_date_time(Stamp, DateTime, local),
	%if the input is empty then split the string to 2 digit number
	(Original \= '' -> split_string(Original, '/', '', [DateString, MonthString, YearString]), atom_number(YearString, After)
            ; date_time_value(year, DateTime, YearValue), After is YearValue).
%Task 15 total years of working  
total_years(Name,Years) :-
	employee(_, Name, _, _, _, _, _, _, Hired, _, _, _, _, Exit),
	get_year(Hired,StartDate),
	get_year(Exit,ExitDate),
	YearOutput is ExitDate - StartDate,
	(YearOutput < 0 -> Years is YearOutput + 100
	; YearOutput > 100 -> Years is mod(YearOutput,100)
	; Years is YearOutput). 
%Task 12 Helper Code to find unique Job_Titles
distinct(JobTitles) :-
	findall(JobTitles,employee(_, _, JobTitles, _, _, _, _, _, _, _, _, _, _, _), List),
        list_to_ord_set(List, Set),
	member(JobTitles, Set).    	
%Task 12 find average salary based on JobTitle	
average_salary(JobTitle, Avg_Salary):-
	distinct(JobTitle),
    	findall(ConvertedSalary, (employee(_, _, JobTitle, _, _, _, _, _, _, Salary, Bonus, _, _, _),convert_to_number(Salary,ConvertedSalary)), SalaryList),
        length(SalaryList, NumberOfEmployee),
        sum_list(SalaryList, TotalSalary),
        Avg_Salary is TotalSalary / NumberOfEmployee.
     

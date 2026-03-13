-- https://en.wikibooks.org/wiki/SQL_Exercises/Scientists
-- 6.1 List all the scientists' names, their projects' names, 
    -- and the hours worked by that scientist on each project, 
    -- in alphabetical order of project name, then scientist name.
    select s.Name, p.Name, p.Hours from AssignedTo a
        join Scientists s on a.Scientist = s.SSN
        join Projects p on a.Project = p.Code
    order by p.Name, s.Name;

-- 6.2 Select the project names which are not assigned yet
    select p.Name from Projects p left join AssignedTo a
        on p.Code = a.Project where a.Scientist is null;
    select Name from Projects where Code not in (select Project from AssignedTo);

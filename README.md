## Pascal Program: tp2

This Is my Pascal solution for the TP given at ESI SBA designed to manage a university's organizational structure, including faculties, departments, specializations, and students using linked lists to represent the hierarchical relationships between these entities.
-NB: i share this program with the first year student so i can help them getting an idea on the overall logic of the solution, i don't encourage to copy paste this code and present it to the professor, you will be the only loser here.
## Program Structure

Main Program: The main program begins by prompting the user to input the name of the university. It then provides a menu-driven interface for various operations such as creating faculties, departments, specializations, adding students, searching for entities, displaying lists, and deleting entities.

Data Structures: The program defines several record types to represent different entities within the university, such as faculties (uni), departments (dep), specializations (spc), and students (etu). These record types are linked together using pointers to form linked lists.

Procedures: Several procedures are defined to perform specific tasks such as creating new nodes for linked lists, adding nodes to lists, displaying lists, searching for entities, and sorting students by year.

## Operations Supported

    *Create Faculty: Allows users to create a new faculty within the university.
    *Create Department: Enables the creation of a new department under a specified faculty.
    *Display Faculty Names: Displays the names of all faculties within the university.
    *Search Faculty: Searches for a specific faculty within the university.
    *Display Department Names: Displays the names of all departments within a specified faculty.
    *Add Specialization: Adds a new specialization within a specified department.
    *Display Specializations: Displays the names of all specializations within a specified department.
    *Search Department: Searches for a specific department within a faculty.
    *Add Student: Adds a new student to a specified specialization.
    *Display Students: Displays the names of all students within a specified specialization.
    *Search Student: Searches for a specific student within the university.
    *Delete Faculty: Deletes a specified faculty along with its associated departments and specializations.
    *Delete Specialization: Deletes a specified specialization within a department.
    *Delete Department: Deletes a specified department along with its associated specializations.
    *Sort Students by Year: Sorts the list of students within a specialization by their academic year.
    *Delete Student: Deletes a specified student from the university.

## Usage

* To use the program:

    Run the Pascal program (tp2.pas).
    Follow the on-screen prompts to perform various operations.
    Input relevant information as requested for each operation.
    Use the menu to navigate through different functionalities.
    Terminate the program by entering 99.

* Note

    This README provides an overview of the program and its functionalities. Refer to the source code for detailed implementation.

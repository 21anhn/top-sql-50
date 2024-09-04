/* Write your T-SQL query statement below */
SELECT
    stu.student_id,
    stu.student_name,
    sub.subject_name,
    COUNT(exam.subject_name) 'attended_exams'
FROM 
    students stu 
CROSS JOIN
    subjects sub
LEFT JOIN
    examinations exam
    ON stu.student_id = exam.student_id
    AND sub.subject_name = exam.subject_name
GROUP BY 
    stu.student_id, 
    stu.student_name,
    sub.subject_name;

/* https://leetcode.com/problems/students-and-examinations/ */

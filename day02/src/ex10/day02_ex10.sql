SELECT DISTINCT person1.name AS person_name1, person2.name AS person_name2,  person1.address AS common_address FROM person AS person1
JOIN person AS person2 on person1.address = person2.address AND person1.name != person2.name AND person1.name < person2.name
ORDER BY person_name1,person_name2,common_address;
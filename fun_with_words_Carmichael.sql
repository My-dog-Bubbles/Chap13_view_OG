CREATE OR REPLACE VIEW WORD_REL (word, syn_col, ant_col) AS
SELECT s.word_term, s.syn_word, a.ant_word
FROM WORD_SYNONYMS s, WORD_ANTONYMS a
WHERE a.word_id = s.word_id;
SELECT * FROM WORD_REL;

CREATE OR REPLACE VIEW WORD_ANALYSIS (word, syn_col, ant_col, word_length) AS
SELECT word, syn_col, ant_col, LENGTH(word)
FROM WORD_REL;
SELECT * FROM WORD_ANALYSIS;

CREATE OR REPLACE VIEW WORD_SUMMARY (word, syn_col, ant_col) AS
SELECT word, syn_col, ant_col
FROM WORD_REL;
SELECT * FROM WORD_SUMMARY;

SELECT view_name FROM user_views;

-- Q1
select * from WORD_REL;

-- Q2
update Word_rel 
set syn_col = 'blithe'
where word = 'insouciant';

select * from WORD_REL;

-- Q3

create OR REPLACE view WORD_REL (word, syn_col, ant_col) AS
SELECT s.word_term, s.syn_word, a.ant_word
FROM WORD_SYNONYMS s, WORD_ANTONYMS a
WHERE a.word_id = s.word_id
with read only; 

update Word_rel 
set syn_col = 'blithe'
where word = 'insouciant'; -- cannot preform a DML operation on a read-only veiw

-- Q4
select word, word_length from WORD_ANALYSIS;

-- Q5
select word, syn_col 
from (select word, syn_col 
        from WORD_ANALYSIS 
        order by word_length desc)
where rownum <=2;

-- Q6
drop view WORD_REL;

create or replace view WORD_REL (word, syn_col, ant_col) AS
SELECT s.word_term, s.syn_word, a.ant_word
FROM WORD_SYNONYMS s, WORD_ANTONYMS a
WHERE a.word_id = s.word_id;

-- Q7
select * from word_summary;

-- Q8
select * from homonyms;

create view homo_meaning (word_term, meaning) as
select word_term, meaning as Meanings
from homonyms;

select * from homo_meaning;
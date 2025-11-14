# Chap13_view_OG
 The error that occurred was cannot preform a DML operation on a read-only view.
 This error occurred because we are trying to edit a view the is in read only. This means that you are not allowed to edit the view.

 error quote:
 Error at line 2/5: ORA-42399: cannot perform a DML operation on a read-only view

1. update Word_rel 
2. set syn_col = 'blithe'
3. where word = 'insouciant';

We put these DML restrictions in some views to control how much the data is changing. They is to ensure the integrity of the created view.

Compared to regular view the Materialized view stores the query in memory and saves the result. The store a replicated version in the memory while, a regular view does not store the results so you cannot reference it. 
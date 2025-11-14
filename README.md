# Chap13_view_OG
 The error that acured was cannot preform a DML operation on a read-only veiw.
 This error occured because 

 error quote:
 Error at line 2/5: ORA-42399: cannot perform a DML operation on a read-only view

1. update Word_rel 
2. set syn_col = 'blithe'
3. where word = 'insouciant';
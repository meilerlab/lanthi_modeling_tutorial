
Bring in my scripts on transforming from nmr format to rosetta constraints
show example(s)

Explain rosetta nmr constraints
I implemented ambiguous constraints for NCAA as well

example of how to get the individual constraints

for name in 6VLJ 6VHJ; do python get_seq_file.py -i ${name}_1_rename.pdb; done
for name in 6VLJ 6VHJ; do python make_nmr_cst.py -i ${name}_noe.tbl -s ${name}_1_rename_pep.txt -c ${name}_conn.txt; done
for name in 6VLJ 6VHJ; do bash cst_info.sh $name ${name}_1_rename.pdb; done


#take in a pdb.gz file and output the peptide pdb structure and sequence file
import gzip
#import sys
import argparse
#with gzip.open(filename, 'rb') as file:

#out_pdb = ''
resi_index = {}
three_convert = {'CYS': 'CYS', 'ASP': 'ASP', 'SER': 'SER', 'GLN': 'GLN', 'LYS': 'LYS',
                 'ILE': 'ILE', 'PRO': 'PRO', 'THR': 'THR', 'PHE': 'PHE', 'ASN': 'ASN', 
                 'GLY': 'GLY', 'HIS': 'HIS', 'LEU': 'LEU', 'ARG': 'ARG', 'TRP': 'TRP', 
                 'ALA': 'ALA', 'VAL':'VAL', 'GLU': 'GLU', 'TYR': 'TYR', 'MET': 'MET',
                 'DCYS': 'DCYS', 'DAS': 'DASP', 'DSE': 'DSER', 'DGN': 'DGLN', 'DLY': 'DLYS',
                 'DIL': 'DILE', 'DPR': 'DPRO', 'DTH': 'DTHR', 'DPH': 'DPHE', 'DAN': 'DASN', 
                 'DHIS': 'DHIS', 'DLE': 'DLEU', 'DAR': 'DARG', 'DTRP': 'DTRP', 
                 'DAL': 'DALA', 'DVA': 'DVAL', 'DGU': 'DGLU', 'DTY': 'DTYR', 'DME': 'DMET',
                 'DBS': 'DBS', 'DBR': 'DBR', 'DBU': 'DBU', 'DHA': 'DHA'}
out_seq = ''

parser = argparse.ArgumentParser(description = 'take in a pdb file and output the peptide sequence file')
parser.add_argument('-i', '--input', help = 'input pdb', required = True)
parser.add_argument('-p', '--prefix', help = 'prefix for output', default='')
parser.add_argument('-c', '--chain', help = 'chain of interest', default='A')
argument=parser.parse_args()

#filename = sys.argv[1]
#print(sys.argv[2])
name_base=argument.input.split('/')[-1]
name_base=name_base.split('.')[0]

with open(argument.input, 'r') as infile:
    for raw_line in infile:
        line = str(raw_line.strip())
        split = line.split()
        #print(line)
        #print(split)
        #if len(split) > 5:
        #    print(split[0], split[3], split[4])
        #    print(split[0] == 'ATOM' or split[0] == 'HETATM')
        #    print(split[4] == chain)
        if len(split) > 5 and (split[0] == 'ATOM' or split[0] == 'HETATM') and split[4] == argument.chain:
            #out_pdb += line + '\n'
            if split[5] not in resi_index.keys():
                resi_index[split[5]] = split[3]
                if out_seq == '':
                    out_seq = three_convert[split[3]]
                else:
                    out_seq += ' '+three_convert[split[3]]
                    #print(out_seq)

#out_pdb += 'TER'

#with open(argument.prefix+name_base+'_pep.pdb', 'w') as out_file:
#    out_file.write(out_pdb)

with open(argument.prefix+name_base+'_pep.txt', 'w') as out_file:
    out_file.write(out_seq)

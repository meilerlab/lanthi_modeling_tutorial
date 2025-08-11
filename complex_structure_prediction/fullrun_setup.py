import os
import argparse

parser = argparse.ArgumentParser(description = 'take in a pdb code and find prepare the options files for generating 200,000 structures')
parser.add_argument('-i', '--input', help = 'input pdb code', required = True)
argument=parser.parse_args()

nstruct = len(os.listdir(argument.input)) #6VLJ
print(f'{argument.input} has {nstruct} structs')

multi_factor = int((200000-nstruct)/nstruct) #+ 1
num_struct = multi_factor * 100 #100 is the initial nstruct for the xml

if not os.path.exists('options_refined'):
    print(f"Directory 'options_refined' does not exist. Creating it...")
    try:
        os.makedirs('options_refined')  # Create the directory (and parent directories if needed)
        print("Directory 'options_refined' created successfully.")
    except Exception as e:
        print(f"Error creating directory 'options_refined': {e}")
        exit(1)

if multi_factor > 1:
    options = [x for x in os.listdir('options/') if argument.input in x]
    for opt in options:
        temp_str = ''
        with open(f'options/{opt}', 'r') as in_option:
            for raw_line in in_option:
                temp_str += raw_line
        temp_str = temp_str.replace('100', str(num_struct)).replace('init', 'run1') #init and run1 are prefexes for the different prediction rounds
        with open(f'options_refined/{opt}', 'w') as out_option:
            out_option.write(temp_str)


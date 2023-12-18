#Author: Dat Truong & Nga Le ft: Krishna Ramamoorthy & Google Search Engine & ChatGPT to fix the error
#CS 420 

import subprocess
#the executable part
matlab_executable = r'C:\Program Files\MATLAB\R2023b\bin\matlab'
# Load the matlab code
matlab_process = subprocess.run([matlab_executable, '-batch', "run('matlab.m');pause(10);"],capture_output=True)

#Read the input file
with open('input.txt', 'r') as file:
    # using the given code as base and AI to fix the problem where it only display 1 number in the output    
    input_array = [int(value) for line in file for value in line.split()]

#process the code in C program using professor code
subprocess.run(["gcc", "finalC.c", "-o", "finalC"])
process = subprocess.run(["./finalC"] +  [str(x) for x in input_array], capture_output=True, text=True)
output_variable = process.stdout.strip()
#output C program code
with open('c_output.txt', 'w') as f:
    f.write(output_variable)

#process the code in C program using professor code
subprocess.run(['ghc', 'finalH.hs'])
process = subprocess.run(['./finalH'] + [str(x) for x in input_array], text=True, capture_output=True)
result = process.stdout.strip()

#output Haskell program code
with open('haskell_output.txt', 'w') as f:
    f.write(result)

#process the code in C program using professor code
prolog_input = "[" + ",".join(map(str, input_array)) + "]."
result = subprocess.run(['swipl', '-q', '-g', 'main', '-t', 'halt', 'finalP.pl'], input=prolog_input,capture_output=True, text=True)
#Using google research
output_result = result.stdout.strip().replace(']','').replace('[','')
#output Prolog program code
with open('prolog_output.txt', 'w') as f:
    f.write(output_result)

#open Matlab2.m
matlab_process = subprocess.run([matlab_executable, "-batch", "run('matlab2.m'); pause(inf);"], capture_output=True)
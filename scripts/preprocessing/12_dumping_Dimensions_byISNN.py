#!/usr/bin/env python3

import dimcli
import pandas as pd
import json

# you can pass explicitly your login details as arguments
dimcli.login(key="327B256FE7C7435994F18BCC209C8BD4", endpoint="https://app.dimensions.ai")

dsl = dimcli.Dsl()

def generate_sentences(file_path):
    sentences = []
    # Open the file and read each line
    with open(file_path, 'r') as file:
        # Read each line in the file
        for line in file:
            # Split the line into columns based on tab separation
            columns = line.strip().split('\t')
            # Extract the relevant data
            year = columns[2]
            name = columns[1]
            issn = columns[4]
            # Create the sentence based on the extracted data
            sentence = f'search publications where issn="{issn}" and year in [{year}] and authors="{name}" return publications[id+title+doi+year+authors+type+pages+journal+issue+volume+issn]'
            sentences.append(sentence)
    return sentences

# Specify the path to your file
file_path = 'para_buscar_96_99_isnn.tsv'

# Generate the sentences
generated_sentences = generate_sentences(file_path)

# Print each generated sentence
for sentence in generated_sentences:
    res=dsl.query(sentence)
    with open('outoIn99_1.txt', 'a') as file:
        file.write(json.dumps(res.data)+"\n")

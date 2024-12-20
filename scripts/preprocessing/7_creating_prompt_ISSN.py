#!/usr/bin/env python3
#Script to prepare search prompts.  It search in OpenAlex by ISSN.

import pandas as pd

def generate_sentences(file_path):
    sentences = []
    # Open the file and read each line
    with open(file_path, 'r') as file:
        # Read each line in the file
        for line in file:
            # Split the line into columns based on tab separation
            columns = line.strip().split('\t')
            # Extract the relevant data
            year = columns[0]
            id_ = columns[1]
            pages = columns[2]
            issn = columns[3]
            # Create the sentence based on the extracted data
            sentence = f'https://api.openalex.org/works?filter=best_oa_location.source.issn:{issn},publication_year:{year},biblio.first_page:{pages}'
            sentences.append(sentence)
    return sentences

# Specify the path to your file
file_path = 'first_page.tsv'

# Generate the sentences
generated_sentences = generate_sentences(file_path)

# Print each generated sentence
for sentence in generated_sentences:
    with open('file.txt', 'a') as file:
        file.write(sentence+"\n")


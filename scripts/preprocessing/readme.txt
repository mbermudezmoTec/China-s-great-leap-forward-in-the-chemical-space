Preprocessing data:

 1. 1_SUB_processing_data.awk: from the raw data dumped on 27th July 2023, extracting  the Molecular formula, years of publications in journals and citation ID for each substance reported in the substances Reaxys context 
 2. 2_dates_subs_SUB.awk: getting the earlier year and its corresponding citation ID for the substances
 3. 3_CIT_processing_raw_data.awk: from the raw data dumped on 27th July 2023, extracting the bibliographic data of each article reported in the citation Reaxys context
 4. 4_merging_data_CIT_SUB.py : merging the bibliographic information to the substances throught the CNR.CRN file.
 5. 5_dumping_OpenAlex_byDoi.awk: dumping blibliographic data from OpenAlex database of the substances throught the doi of the document
 6. 6_dumping_OpenAlex_byTitle.awk: dumping blibliographic data from OpenAlex database of the substances throught the title of the document
 7. 7_creating_prompt_ISNN.py: creating the input file to dump data using the ISSN, volume, authors, pages and year of the document
 8. 8_dumping_OpenAlex_byISNN.awk: dumping blibliographic data of the substances throught the ISSN, volume, authors, pages and year of the document
 9. 9_processing_OpenAlex_data.py: extracting the information from the raw data
10. 10_dumping_Dimensions_byDoi.awk: dumping blibliographic data from Dimensions database of	the substances throught the doi	of the document
11. 11_dumping_Dimensions_byTitle.awk: dumping blibliographic data from Dimensions database of the substances throught the title of the document
12. 12_dumping_Dimensions_byISNN.awk: dumping blibliographic data from Dimensions database of the substances throught the ISSN, volume, authors, pages and year of the document
13. 13_processing_Dimensions_Data.py: extracting information from the raw data
14. 14_merging_data_Reaxys_Bibliographic.py: adding the bibliographic data (authors and affiliations) to the substances

Preprocessing data:

 1. 4_SUB_processing_data.awk: from the raw data dumped on 27th July 2023, extracting  the Molecular formula, years of publications in journals and citation ID for each substance reported in the substances Reaxys context 
 2. 5_dates_subs_SUB.awk: getting the earlier year and its corresponding cite ID for the substances
 3. 7_CIT_processing_raw_data.awk: from the raw data dumped on 27th July 2023, extracting the bibliographic data of each article reported in the citation Reaxys context
 4. 8_merging_data_CIT_SUB.py : merging the bibliographic information to the substances throught the CNR.CRN file.
 5. 9_dumping_OpenAlex_byDoi.awk: dumping blibliographic data on OpenAlex database of the substances throught the dio of the document
 6. 10_dumping_OpenAlex_byTitle.awk: dumping blibliographic data on OpenAlex database of the substances throught the title of the document
 7. 11_creating_prompt_ISNN.py: creating the input file to dump using the ISNN, volume, authors, pages and year of the document
 8. 12_dumping_OpenAlex_byISNN.awk: dumping blibliographic data of the substances throught the ISNN, volume, authors, pages and year of the document
 9. 13_processing_OpenAlex_data.py: extracting the information from the raw data
10. 14_dumping_Dimensions_byDoi.awk: dumping blibliographic data on Dimensions database of	the substances throught the dio	of the document
11. 15_dumping_Dimensions_byTitle.awk: dumping blibliographic data on Dimensions database of the substances throught the title of the document
12. 16_dumping_Dimensions_byISNN.awk: dumping blibliographic data on Dimensions database of the substances throught the ISNN, volume, authors, pages and year of the document
13. 17_processing_Dimensions_Data.py: extracting information from the raw data
14. 18_merging_data_Reaxys_Bibliographic.py: adding the bibliographic data (authors and affiliations) to the substances

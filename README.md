# Investigating the gender pronoun gap in student newspapers from the University of California San Diego


### Overview

As previous reports have shown, there is a significant gap between the use of two gendered pronouns (although some recent studies suggest that this gap is narrowing [4]). We compute the number of occurrences for “he” and “she” in each each of the newspapers in our corpora to investigate this gap. We compute two measures: 1) the gender pronoun gap ratio for each issue and 2) the aggregated gender pronoun gap ratio per decade.

Furthermore, to investigate how contents in student newspapers changes over time, we compute bag-of-words features with TF-IDF weighting [5] for each issue and compute the Principal Components Analysis (PCA) of the corpora to perform Exploratory Data Analysis (EDA). Using EDA, allows us to investigate how the text features relate to auxiliary metadata such as the issues publication date and our defined gender gap ratio. 

### Data: Text Corpora
The two collections used in this study are taken from the UC San Diego History Collection at the UC San Diego Library. Details regarding the collection are as follows (obtained from http://library.ucsd.edu/dc/collection/bb9318959d): 
- UCSD Guardian (1967-): Primary student newspaper of UCSD campus, dating from 1967. Images include earlier versions of the UCSD Guardian, such as the Triton Times and special issues titled Hiatus. Scanned from originals in the UCSD Archives. Includes 2915 digital objects in text format. 
- UCSD Student newspapers (1960-): Images of various student newspapers, other than the UCSD Guardian. Includes titles such as Black Voices, New Indicator, Revelations, and Ujima. Scans were made from originals in the UCSD Archives. 646 digital objects in text format.




### Results

<div>
    <a href="https://plot.ly/~crude2refined/1983/" target="_blank" title="Gendered pronoun gap between two &lt;br&gt; different UCSD newspaper sources" style="display: block; text-align: center;"><img src="https://plot.ly/~crude2refined/1983.png" alt="Gendered pronoun gap between two &lt;br&gt; different UCSD newspaper sources" style="max-width: 100%;width: 600px;"  width="600" onerror="this.onerror=null;this.src='https://plot.ly/404.png';" /></a>
    <script data-plotly="crude2refined:1983"  src="https://plot.ly/embed.js" async></script>
</div>

The above figure shows the aggregated median of “he” to “she” count ratios per decade for two different corpora. All text was turned to lowercase for counts. PCA plots below show the top two PC’s for bag-of-words TF-IDF features extracted for each issue. Coloring the top 2 PC’s by decade suggests that distributions of bag-of-words features is captures temporal shifts of content in newspaper issues. 


<div>
    <a href="https://plot.ly/~crude2refined/1987/" target="_blank" title="PCA of Bag of Words Features from Independent &lt;br&gt;Student Newspapers and the UCSD Guardian" style="display: block; text-align: center;"><img src="https://plot.ly/~crude2refined/1987.png" alt="PCA of Bag of Words Features from Independent &lt;br&gt;Student Newspapers and the UCSD Guardian" style="max-width: 100%;width: 700px;"  width="700" onerror="this.onerror=null;this.src='https://plot.ly/404.png';" /></a>
    <script data-plotly="crude2refined:1987"  src="https://plot.ly/embed.js" async></script>
</div>

The above figure shows the PCA of the TF-IDF features extracted for ecah issue in our dataset. We color code each issue with the decade it was published. The figure is interactive and exploring the figure reveals that the TF-IDF features are capturing shifts of the newspapers over time. Below, we show the PCA again just for the UCSD Guardian, but color code by the quartile corresponding to the gender pronoun gap. 

<div>
    <a href="https://plot.ly/~crude2refined/1985/" target="_blank" title="PCA of Bag of Words Features from UCSD Guardian Corpus &lt;br&gt; Highlighting He-to-She Ratio Quartiles&lt;br&gt; First quartile: 2.25; Median: 4; Third quartile: 7.25" style="display: block; text-align: center;"><img src="https://plot.ly/~crude2refined/1985.png" alt="PCA of Bag of Words Features from UCSD Guardian Corpus &lt;br&gt; Highlighting He-to-She Ratio Quartiles&lt;br&gt; First quartile: 2.25; Median: 4; Third quartile: 7.25" style="max-width: 100%;width: 700px;"  width="700" onerror="this.onerror=null;this.src='https://plot.ly/404.png';" /></a>
    <script data-plotly="crude2refined:1985"  src="https://plot.ly/embed.js" async></script>
</div>

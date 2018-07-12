# ZeiselSingleCellToSCEObject

Conversion of original Zeisel's single-cell experiment dataset to SingleCellExperiment object

This repository contains the script ([`ConversionScript.R`](ConversionScript.R)) that converts the 
original dataset of the following paper to a `SingleCellExperiment` object:

Amit Zeisel, Ana B. Muñoz Manchado, Peter Lönnerberg, Gioele La Manno, Simone Codeluppi, Anna Juréus, Sueli Marques, Hermany Munguba, Liqun He, Christer Betsholtz, Charlotte Rolny, Gonçalo Castelo-Branco, Jens Hjerling-Leffler and Sten Linnarsson,
"Cell types in the mouse cortex and hippocampus revealed by single-cell RNA-seq," *Science* (19 Feb, 2015). [DOI: 10.1126/science.aaa1934](http://science.sciencemag.org/content/early/2015/02/18/science.aaa1934)

More information about this dataset can be found in their [website](http://linnarssonlab.org/cortex/).

The script can be run in terminal simply by:

```
Rscript ConversionScript.R
```

under the same directory. The resulted `SingleCellExperiment` object is found inside the directory `Target`, can be downloaded [here](Target/zeisel_dataset_sce.rds).

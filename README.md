# gruneco_rsfMRI_connectivity
Here we describe the pipeline for extracting graphs metrics from  dynamic functional connectivity.  
It consists of several steps that are built in FSL/Bash, Python and Matlab.

Here it is assumed that the rs-fMRI are preprocessed (with or without denoising), in addition to the already rs-networks extracted by cGICA.

**STEPS**:

1. cGICA rs-networs Denoising
2. Non-Parametric Statistical Test with SnPM/SPM12
3. Identification of statistically significant areas
4. Signal extraction (sFC and dynFC matrix)
5. Graph metrics extraction
6. Mixed ANOVA for dynFC

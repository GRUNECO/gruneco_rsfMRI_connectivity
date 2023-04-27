# GRUNECO rsfMRI connectivity based on cGICA Maps
Here we describe the pipeline for extracting graphs metrics from  dynamic functional connectivity.  
It consists of several steps that are built in FSL/Bash, Python and Matlab.

Here it is assumed that the rs-fMRI are preprocessed (with or without denoising), in addition to the already rs-networks extracted by cGICA.
> Several scripts herein are required to run under UNIX/Linux or MacOS environment.
> If you use Windows, then it is recommended to run it through [WSL](https://ubuntu.com/tutorials/install-ubuntu-on-wsl2-on-windows-11-with-gui-support#1-overview) or virtual machine.

## **STEPS**:

1. cGICA rs-networs Denoising
2. Non-Parametric Statistical Test with SnPM/SPM12
3. Identification of statistically significant areas
4. Signal extraction (sFC and dynFC matrix)
5. Graph metrics extraction
6. Mixed ANOVA for dynFC


## Pre-Installation:

* [FSL](https://fsl.fmrib.ox.ac.uk/fsl/fslwiki)
> Please avoid NeuroDebian installation
* MATLAB
     - [SPM12](https://www.fil.ion.ucl.ac.uk/spm/software/spm12/)
     - [SnPM13](http://www.nisox.org/Software/SnPM13/)
* Python 3.x
> It is recommended to run in a [virtual environment](https://docs.python.org/es/3/library/venv.html)

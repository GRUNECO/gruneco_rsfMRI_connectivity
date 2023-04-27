% List of open inputs
% nrun = X; % enter the number of runs here
% jobfile = {'C:\Users\majoh\Desktop\NEUROINGENIERIA\SNPM_NIFTI\AD_ADNI_VS_AD_OASIS\0000\Paso1_job.m'};
% jobs = repmat(jobfile, 1, nrun);
% inputs = cell(0, nrun);
% for crun = 1:nrun
% end
function Paso1(work_path,Group1,Group2,nperm,red)
    spm_jobman('initcfg');
    spm('defaults', 'FMRI');
    matlabbatch=[];
    matlabbatch{1}.spm.tools.snpm.des.TwoSampT.DesignName = '2 Groups: Two Sample T test; 1 scan per subject';
    matlabbatch{1}.spm.tools.snpm.des.TwoSampT.DesignFile = 'snpm_bch_ui_TwoSampT';
    matlabbatch{1}.spm.tools.snpm.des.TwoSampT.dir = strcat(work_path,red);
    %% Grupo 1
    matlabbatch{1}.spm.tools.snpm.des.TwoSampT.scans1 = Group1;
    %%
    %% Grupo 2
    matlabbatch{1}.spm.tools.snpm.des.TwoSampT.scans2 = Group2;
    %%
    matlabbatch{1}.spm.tools.snpm.des.TwoSampT.cov = struct('c', {}, 'cname', {});
    matlabbatch{1}.spm.tools.snpm.des.TwoSampT.nPerm = nperm; %Va a cambiar el número de permutaciones, la primera vez 10 la segunda 10.000
    matlabbatch{1}.spm.tools.snpm.des.TwoSampT.vFWHM = [6 6 6];
    matlabbatch{1}.spm.tools.snpm.des.TwoSampT.bVolm = 1;
    matlabbatch{1}.spm.tools.snpm.des.TwoSampT.ST.ST_none = 0;
    matlabbatch{1}.spm.tools.snpm.des.TwoSampT.masking.tm.tm_none = 1;
    matlabbatch{1}.spm.tools.snpm.des.TwoSampT.masking.im = 1;
    matlabbatch{1}.spm.tools.snpm.des.TwoSampT.masking.em = {''};
    matlabbatch{1}.spm.tools.snpm.des.TwoSampT.globalc.g_omit = 1;
    matlabbatch{1}.spm.tools.snpm.des.TwoSampT.globalm.gmsca.gmsca_no = 1;
    matlabbatch{1}.spm.tools.snpm.des.TwoSampT.globalm.glonorm = 1;
    disp('COMPUTE!');
    spm_jobman('run', matlabbatch);
end

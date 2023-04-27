    
function Paso2(work_path,Group1,Group2,red,sig)
    spm_jobman('initcfg');
    spm('defaults', 'FMRI');
    matlabbatch=[];

    matlabbatch{1}.spm.tools.snpm.cp.snpmcfg = strcat(work_path,red,'/SnPMcfg.mat');
    disp(matlabbatch{1}.spm.tools.snpm.cp.snpmcfg)
    matlabbatch{2}.spm.tools.snpm.inference.SnPMmat = strcat(work_path,red,'/SnPM.mat');
    matlabbatch{2}.spm.tools.snpm.inference.Thr.Vox.VoxSig.FWEth = 0.05;
    matlabbatch{2}.spm.tools.snpm.inference.Tsign = sig;
    matlabbatch{2}.spm.tools.snpm.inference.WriteFiltImg.WF_no = 0;
    matlabbatch{2}.spm.tools.snpm.inference.Report = 'MIPtable';
    spm_jobman('run', matlabbatch);
end
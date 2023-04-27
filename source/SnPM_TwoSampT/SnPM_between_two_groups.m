%% Processing for inter-network group comparison

% Before running the script select 'Browse file' in the matlab Toolbar and
% select the folder with the scripts

clear all; close all;

% Here you must enter the number of networks

% If the group of networks is 'rs_networks_300ROI' nred=13, but if it is
% 'rs_networks_all' nred=17

nred= 14; %Set the number of networks

G1=compose('%04d', 0:nred); 
G2=compose('%04d', 0:nred); 

red=compose('%04d',0:nred);

work_path = '/your_path_where_the_results_will_be_saved/SnPM/G1_VS_G2/';
group1=[];
group2=[];


%Here you must enter the path to each directory containing the results of the Constrained Group ICA (cGICA).
%This is done for each group of networks.
% Example:
% 
%     G1/2_rs_networks_all
%     G1/2_rs_networks_300ROI

relevant_path_G1 = '/your_path/G1_rs_networks_300ROI/'
relevant_path_G2 = '/your_path/G2_rs_networks_300ROI/'


% Set the number of subject for each group
n_subjects_G1 = 10;% Please correct this value with the real value
n_subjects_G2 = 10; % Please correct this value with the real value

sub_G1=compose('%03d', 1:n_subjects_G1);
sub_G2=compose('%03d', 1:n_subjects_G2);

% Set encoding pattern of subjects
% This is done for each group
% Example:

%      res_bin_thr5_pval_G2_XXX001_component_ica_s1_0001,'.nii'
%      Replace XXX by encoding patterm 

G1_sub= 'GK_sub'; % set 'XXX' value here
G2_sub= 'GW_sub'; % set 'XXX' value here

max_s=max(n_subjects_G1,n_subjects_G2);

for q=1:nred
    
    group1=[];
    group2=[];

    % Group 1

    for j=1:length(sub_G1) 
        x1=strcat(relevant_path_G1,'res_bin_thr5_pval_',G1_sub,sub_G1(j),'_component_ica_s1_', G1(q),'.nii');
        group1=[group1;x1];
    end
    
    % Group 2

    for k=1:length(sub_G2) 
        y1=strcat(relevant_path_G2,'res_bin_thr5_pval_',G2_sub,sub_G2(k),'_component_ica_s1_', G2(q),'.nii');
        group2=[group2;y1];
    end



    n=[10,10000];

    for w=1:length(n)
        nperm=n(w);
        Paso1(work_path,group1,group2,nperm,red(q));

        for h=1:2
            sig=[1,-1];
            Paso2(work_path,group1,group2,red(q),sig(h))
            ruta=strcat(work_path,red(q),'/',red(q),'_',int2str(sig(h)));
            ruta=char(ruta);
            print(ruta,'-dpng');
            close;
        end
            
    end
    disp(q)
end





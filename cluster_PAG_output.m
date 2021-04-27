clear all;close all;clc

%data steps
R = readtable('Users/mrijpma/Box Sync/science/2019/rSMS_DCM/documents/PCA all PAG node-connections/SAS_DCM_86.xlsx');


%%ONC
DX_dummy = table2cell(R(:,105));
DX_dummy = cell2mat(DX_dummy);
cnc = R(DX_dummy == 0,[135,138]); %136,137
cnc = table2array(cnc);

%%bvFTD
cnd = R(DX_dummy == 1,[135,138]); %136,137
cnd = table2array(cnd);

%1 = PAG cortical output
%2 = PAG subcortical output

[idx,C] = kmeans(cnc,3,'Replicates',1000);

%check clusters
silhouette(cnc, idx);
set(gca, 'FontSize', 25);


%set style
g1 = idx; 
uidx1 = unique(g1); 
c1 = brewermap(length(uidx1),'Set1');

%%plotting PAG cortical and subcortical output; p <.001, positive rela
%%more output cortical means more output subcortical
gscatter(cnc(:,1),cnc(:,2),idx, c1, '.',35)
hold on
plot(C(:,1),C(:,2),'kx')
set(gca, 'FontSize', 20);
hold on

[~,idx2] = pdist2(C,cnd,'euclidean','Smallest',1);
gscatter(cnd(:,1),cnd(:,2),idx2,c1,'*',15)

%formatting
xlabel('PAG output') %PAG output towards cortical nodes
ylabel('PAG input') %PAG output towards subcortical nodes
%legend('Cluster 1 ONC','Cluster 2 ONC','Cluster 3 ONC', 'Cluster Centroid')


%combine the data
clusONC = array2table(idx);
clusONC.Properties.VariableNames = {'Clus'};
idxx2 = idx2.';
clusFTD = array2table(idxx2);
clusFTD.Properties.VariableNames = {'Clus'};

Cl = cat(1,clusONC, clusFTD);
data_all = cat(2,R,Cl);


%saving dataset for SAS all DX
filename = 'PAG_all_clus_output_86.xlsx';
writetable(data_all, filename);





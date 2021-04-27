clear all;close all;clc

%data steps
R = readtable('SAS_DCM_88_outliertest.xlsx');

%check outliers output sum est
out = R(:,135);
out = table2array(out);
boxplot(out);
%using z scores
out = table2array(out);
outz = zscore(out);
outh = histogram(outz,44);

%check outliers
out_cort = R(:,136);
out_cort = table2array(out_cort);
boxplot(out_cort);
%z scores
out_cort = table2array(out_cort);
outz_cort = zscore(out_cort);
outh_cort = histogram(outz_cort,44);

%check outliers
out_subc = R(:,137);
out_subc = table2array(out_subc);
boxplot(out_subc);
%using z scores
out_subc = table2array(out_subc);
outz_subc = zscore(out_subc);
outh_subc = histogram(outz_subc,44);
%z scores of obs 8 and obs 73, i.e., 6857 and 15600 are more than 3 SD from the
%standard curve

%check outliers input sum est
in = R(:,141);
in = table2array(in);
boxplot(in);
%using z scores
in = table2array(in);
inz = zscore(in);
inh = histogram(inz,44);
%nothing larger than 3 SD

%check outliers 
in_cort = R(:,142);
in_cort = table2array(in_cort);
boxplot(in_cort);
%z scores
in_cort = table2array(in_cort);
inz_cort = zscore(in_cort);
inh_cort = histogram(inz_cort,44);
%nothing larger than 3 SD

%check outliers
in_subc = R(:,143);
in_subc = table2array(in_subc);
boxplot(in_subc);
%using z scores
in_subc = table2array(in_subc);
inz_subc = zscore(in_subc);
inh_subc = histogram(inz_subc,44);
%nothing larger than 3 SD

function [nodata]= removeNODATA(textfile)
 
% read file delimeted with space
nodata = load(textfile,'delimiter',' ');
 
% store row_nr where Var3 in table is NODATA (-3.402823466385289e+38).
rows_to_remove = any(nodata(:,3)==-3.4028234663852886e+38, 2);
 
% delete rows from table.
nodata(rows_to_remove,:) = []; 

% save to file
dlmwrite(textfile,nodata,'delimiter',' ','precision',17);
clearvars nodata; % deleted variable nodate.
disp(['Rows with NODATA removed from ' textfile]);

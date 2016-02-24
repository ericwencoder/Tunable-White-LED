imagefiles = dir('*.PNG');      
nfiles = length(imagefiles);    % Number of files found
for ii=1:nfiles
   fn = imagefiles(ii).name;
   spd = imread(fn);
   spd = spd(:,:,1);
   spd = spd < 1;
   spd = sum(spd);
   spd = spd.*100/max(spd);
   spd = resample(spd, 81, length(spd));
   eval(strcat([fn(1:length(fn)-4), '=spd;']));
end
clear 'imagefiles' 'ii' 'nfiles' 'fn' 'spd'
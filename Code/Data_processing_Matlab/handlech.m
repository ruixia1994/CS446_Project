function out = handlech(in)
mbr = in;
% m = rgb2gray(in);
% mb = bina(m);
% mbr = ReSize(mb);
mbrs = smoth(mbr);
%mbrst = adFPA(mbrs);
mbrst = bwmorph(mbrs,'thin',inf);
out = mbrst;
end
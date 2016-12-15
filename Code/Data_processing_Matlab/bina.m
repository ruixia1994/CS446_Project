function out = bina(m)
th = im2double((max(max(m))+min(min(m)))/2)*0.9;
out = im2bw(m,th);
end
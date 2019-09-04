function [sB,bPlus,bM]=calculatingB(sW,salpha,ssX,ssY)

k = find(salpha>1);

j=1;
plus=0;
sMin=0;
bPBuf=[];
bMBuf=[];
while j<=size(k,1)
    if ssY(k(j))==1 & plus==0
        bPBuf=[bPBuf;k(j)];
        %plus=1;
    end
    
    if ssY(k(j))==-1 & sMin==0
        bMBuf=[bMBuf;k(j)];
        %min=1;
    end
    
    j=j+1;
end

bPx=[];
for ka=1:size(bPBuf,1)
    tx=[ssX(bPBuf(ka),1);ssX(bPBuf(ka),2);ssX(bPBuf(ka),3)];
    bPx=[bPx,tx];
end


bMx=[];
for ka=1:size(bMBuf,1)
    tx=[ssX(bMBuf(ka),1);ssX(bMBuf(ka),2);ssX(bMBuf(ka),3)];
    bMx=[bMx,tx];
end



bPlus=1-sW'*bPx;
bM=-1-sW'*bMx;

% bPlus=min(bPlus);
% bM=max(bM);

bPlus=max(bPlus);
bM=min(bM);

sB=(bPlus+bM)/2;

return
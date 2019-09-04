function ssZ=makingZ(ssX)

ssZ=ssX;
ssZ(:,3)=ssX(:,1).^2+ssX(:,2).^2;

return
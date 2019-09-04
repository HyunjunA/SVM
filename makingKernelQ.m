function kQ=makingKernelQ(ssX,ssY)
        for i=1:size(ssX,1)
            for j=1:size(ssX,1)
               
                element(i,j)=ssY(i)*ssY(j)*(ssX(i,:)*ssX(j,:)'+(ssX(i,:)*ssX(i,:)')*(ssX(j,:)*ssX(j,:)'));
            
            end
        end
        
        
kQ=element;
return
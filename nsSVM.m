function nsSVM(sX,sY,slineTruFalse)
    
    
    %linearly unspeparable data
    %need to nonlinear transform
    if slineTruFalse==0
        %kernel => K(x,y)=x*y+x^2*y^2
        H=makingKernelQ(sX,sY);
    end
    
    if slineTruFalse==1
        H=makingQ(sX,sY);
    end
    
    %QP condition setting
    f(1:size(sX,1),1:1)=-1;
    
    A=sY';
    b=[0];
    
    
    
    lb=zeros(100,1);
    
    
    options = optimoptions('quadprog',...
    'Algorithm','interior-point-convex','Display','off');

    [alpha,fval,exitflag,output,lambda] = ...
   quadprog(H,f,A,b,[],[],lb,[],[],options);
    

    sZ=makingZ(sX);

    mul=sZ.*sY;
    W=mul.*alpha;
    
    W=[sum(W(:,1));sum(W(:,2));sum(W(:,3))];
    
        
    [averB,bP,bM]=calculatingB(W,alpha,sZ,sY);
    
    
    %svm
    figure;
    for io=1:size(sZ,1)
       if sY(io)==1
           scatter3(sZ(io,1),sZ(io,2),sZ(io,3),'*','red');
           hold on;
       end
       
       if sY(io)==-1
           scatter3(sZ(io,1),sZ(io,2),sZ(io,3),'+','blue');
           hold on;
       end
       
    end
    
    hold on;
    [z1 z2] = meshgrid(-40:0.1:40);  
    z3 =  (W(1)*z1+W(2)*z2+averB)/(-1*W(3));
    mesh(z1,z2,z3);
    hold on;
    
    
    
    
    figure;
    hold on;
    for io=1:size(sX,1)
       if sY(io)==1
           scatter(sX(io,1),sX(io,2),'*','red');
           hold on;
       end
       
       if sY(io)==-1
           scatter(sX(io,1),sX(io,2),'+','blue');
           hold on;
       end
       
    end
    
    hold on;
    

    front=0;
    for iu=1:size(sX,1)
        front=front+alpha(iu)*sY(iu)*sZ(iu,:);
    end
    
%     f = @(x,y) front(1)*x-front(2)*y+front(3)*x.^2+front(3)*y.^2-averB;
%   front variable include [16.5312500000000 -107.662384033203 12447.7541503906]
%   you can check it front variable.
    f = @(x,y) 16.5312500000000*x-107.662384033203*y+12447.7541503906*x.^2+12447.7541503906*y.^2-1285331.33927656;
    fimplicit(f,[-30 30 -25 25])

    hold on;
    
      
    
end
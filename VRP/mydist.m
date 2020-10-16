function D = mydist(X1,X2)   
m = size(X2,1);
n = size(X1,1);
D = 69.5*abs(X1(:,ones(1,m)) - X2(:,ones(1,n))') + ...
         57.3*abs(X1(:,2*ones(1,m)) - X2(:,2*ones(1,n))');
end
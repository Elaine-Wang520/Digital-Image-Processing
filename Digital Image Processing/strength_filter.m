function d=strength_filter(x,n)
d=x;
operator=[0,-1,0;-1,6,-1;0,-1,0];
[width,height]=size(x);
for ii=1:width-(n-1)
    for jj=1:height-(n-1)
    tmp=x(ii:ii+n-1,jj:jj+n-1).*operator;
    p=sum(sum(tmp));
    d(ii+(n-1)/2,jj+(n-1)/2)=p;
    end
end
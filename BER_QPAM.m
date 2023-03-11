function [ p ] = BER_QPAM( SNRindB_sim )
d=1;
SNR=exp(SNRindB_sim*log(10)/10);
sgma=sqrt((5*d^2)/(4*SNR));
N=1e4;
dsource=zeros(1,N);
for i=1:N
    temp=rand;
    if (temp<0.25)
        dsource(i)=0;
    elseif (temp<0.5)
        dsource(i)=1;
    elseif (temp<0.75)
        dsource(i)=2; 
    else
    dsource(i)=3;   
    end
end
    numoferr=0;
    
    for i=1:N
        if (dsource(i)==0)
            r=-3*d+gngauss(sgma);
        elseif (dsource(i)==1)
            r=-d+gngauss(sgma);
        elseif (dsource(i)==2)
            r=d+gngauss(sgma);
        elseif (dsource(i)==3)
            r=3*d+gngauss(sgma);
        end
    end
        if (r<-2*d)
            decis=0;
        elseif (r<0)
            decis=1;
        elseif (r<2*d)
            decis=2;
        else
            decis=3;
        end
        if (decis~=dsource(i))
            numoferr=numoferr+1;
        end
        p=numoferr/N;
        

end


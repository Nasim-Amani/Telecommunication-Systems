function [ p ] = BER_QPAM8( SNRindB_sim )
d=1;
SNR=exp(SNRindB_sim*log(10)/10);
sgma=sqrt((21*d^2)/(6*SNR));
N=1e4;
dsource=zeros(1,N);
for i=1:N
    temp=rand;
    if (temp<0.125)
        dsource(i)=0;
    elseif (temp<0.25)
        dsource(i)=1;
    elseif (temp<0.375)
        dsource(i)=2;
    elseif (temp<0.5)
        dsource(i)=3;
    elseif (temp<0.625)
        dsource(i)=4;    
    elseif (temp<0.75)
        dsource(i)=5;
    elseif (temp<0.875)
        dsource(i)=6;
    else
        dsource(i)=7;     
    end
end
    numoferr=0;
    
    for i=1:N
        if (dsource(i)==0)
            r=-7*d+gngauss(sgma);
        elseif (dsource(i)==1)
            r=-5*d+gngauss(sgma);
        elseif (dsource(i)==2)
            r=-3*d+gngauss(sgma);
        elseif (dsource(i)==3)
            r=-d+gngauss(sgma);
         elseif (dsource(i)==4)
            r=d+gngauss(sgma);
        elseif (dsource(i)==5)
            r=3*d+gngauss(sgma);
        elseif (dsource(i)==6)
            r=5*d+gngauss(sgma);
            elseif (dsource(i)==7)
            r=7*d+gngauss(sgma);
        end
    end
        if (r<-6*d)
            decis=0;
        elseif (r<-4*d)
            decis=1;
        elseif (r<-2*d)
            decis=2;
        elseif (r<0)
            decis=3;
        elseif (r<2*d)
            decis=4;   
        elseif (r<4*d)
            decis=5;
        elseif (r<6*d)
            decis=6;
        else
            decis=7;
        end
        if (decis~=dsource(i))
            numoferr=numoferr+1;
        end
        p=numoferr/N;
        

end

function [p1] = BER__8PAM(SNRindB_sim8)

  d=1;
    SNR = exp(SNRindB_sim8 * log(10)/10);    % signal-to-noise ratio
    sgma = sqrt((7*d^2)/(2*SNR));           % sigma, standard deviation of noise
    N = 1e5;
    %% Random Symbol Generator
    dsource = zeros(1,N);
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
    %% Ditection and Symbol Error Calculation
  numoferr=0;
    for i=1:N
        % the matched filter outputs
         if (dsource(i)==0)
            r=(-7)*d+gnguass(sgma);
        elseif (dsource(i)==1)
            r=(-5)*d+gnguass(sgma);
        elseif (dsource(i)==2)
            r=(-3)*d+gnguass(sgma);
        elseif (dsource(i)==3)
            r=(-1)*d+gnguass(sgma);
        elseif (dsource(i)==4)
            r=d+gnguass(sgma);
        elseif (dsource(i)==5)
            r=(3*d)+gnguass(sgma);
        elseif (dsource(i)==6)
            r=(5*d)+gnguass(sgma);
        elseif (dsource(i)==7)
            r=(7*d)+gnguass(sgma);
         end
    end
%% Detector follows.
        if (r<(-6*d))
            decis=0;
        elseif (r<(-4*d))
            decis=1;
        elseif r<((-2*d))
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
        
        %%Symbol Error Calculation 
          
        if (decis~=dsource(i))
        numoferr = numoferr + 1;
        end
 
p1 = numoferr/N; % probability of error estimate
end


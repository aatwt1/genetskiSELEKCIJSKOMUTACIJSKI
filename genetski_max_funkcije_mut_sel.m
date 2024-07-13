period=0:0.01:2*pi;
funkcija=2*cos(period); 
plot(period, funkcija);
axis([-4 2*pi -2 2]);

% prvi korak je izbor početnog hromosoma
xx=randi([1 30]); 

% drugi korak je određivanje funkcije sposobnosti početnog hromosoma
funkcija_sposobnosti_xx=funkcija(xx)

uslov=1;
zastavica=true;

while zastavica==true
    % treci korak: promjena x u x' (MUTACIJA)
    ni=0.01;
    z=randi([-1 1]);
    delta=ni*z;
    xPrim=int8(xx+delta);
    
    % cetvrti korak je određivanje funkcije sposobnosti od X'
    funkcija_sposobnosti_xPrim=funkcija(xPrim);
    
    % peti korak je određivanje d
    d=funkcija_sposobnosti_xPrim-funkcija_sposobnosti_xx;
    
    % šesti
    T=0.1;
    p=1/1+exp(-d/T);
   
    
    z_novo=randi([0 1]);
    

    if z_novo<p
        xx=xPrim;
    end
    
   
    T=0.1-0.01;
    
    % sedmi korak je prekid uslova
    if uslov==1000
        zastavica=false;
    end
    uslov=uslov+1;
end

koordinata1=double(xx)/1000;
koordinata2=2;
text(koordinata1,koordinata2,'\leftarrow Maximum funkcije','Color','red');
%le programme suivant effectue un filtrage m�dian
C=[];
d=0;% longueur de la f�n�tre
I=imread('l.tif');
I=double(I);
[N,M]=size(I);
m=5; % taille du noyau de la f�n�tre du filtre
for i=1:N
    for j=1:M
        l=0;
        k=0;
        f=0;
        somme=0;% pour vider la variable apr�s l'it�ration
        d=(m-1)/2;
        for l=(-d):d
            if((i-l)>0)&&((N+1)>(i-l))% pour contourner les probl�mes de bord
                for k=(-d):d
                   if((j-k)>0)&&((M+1)>(j-k))
                        C(f)=I(i-l,j-k);
                    end
                end
            end
        end
        I(i,j)=median(C);
    end
end
         I=uint8(I);
         imshow(I)
 % imwrite(I,'cer.tif')% permet d'enregistre l'image en format tif pour autres            
            
function [res,fval,it] = muller_3(f,Z0,itmax,ztol,ftol,opt)
z0 = Z0(1);
z1 = Z0(2);
z2 = Z0(3);
y0 = feval ( f, z0);
y1 = feval ( f, z1);
y2 = feval ( f, z2);
for it = 1:itmax
    q = (z2 - z1)/(z1 - z0);
    A = q*y2 - q*(1+q)*y1 + q^2*y0;
    B = (2*q + 1)*y2 - (1 + q)^2*y1 + q^2*y0;
    C = (1 + q)*y2;
    if ( A ~= 0 )
        disc = B^2 - 4*A*C;
        den1 = ( B + sqrt ( disc ) );
        den2 = ( B - sqrt ( disc ) );
        if ( abs ( den1 ) < abs ( den2 ) )
            z3 = z2 - (z2 - z1)*(2*C/den2);                
        else
            z3 = z2 - (z2 - z1)*(2*C/den1);
        end
    elseif ( B ~= 0 )
        z3 = z2 - (z2 - z1)*(2*C/B);
    else
        warning('Muller Method failed to find a root. Last iteration result used as an output. Result may not be accurate')
        res(it) = z2;
        fval(it) = y2;
        %return
    end
    y3 = feval ( f, z3);
    
    if opt == 1
        if ( abs (z3 - z2) < ztol || abs ( y3 ) < ftol )
            res(it) = z3;
            fval(it) = y3;
            %return
        end
    else
        if ( abs (z3 - z2) < ztol && abs ( y3 ) < ftol )
            res(it) = z3;
            fval(it) = y3;
            %return
        end
    end
    
    z0 = z1;
    z1 = z2;
    z2 = z3;
    y0 = y1;
    y1 = y2;
    y2 = y3;
end
% res = z2;
% fval = y2;
warning('Maximum number of iterations reached. Result may not be accurate')

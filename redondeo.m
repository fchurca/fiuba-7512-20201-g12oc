function newx = redondeo(x, t, base, redondeo=true)
  if (x == 0)
    newx = 0;
  else
    s = sign(x);
    x = abs(x);
    if redondeo
      shift = 0.5;
    else
      shift = 0;
    end
    x_exp = floor(log2(x)/log2(base));
    rebase = base^(x_exp-t+1);
    x_mantissa = fix((x / rebase) + shift);
    newx = x_mantissa * rebase * s;
  end
end
